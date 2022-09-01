import 'package:petitparser/petitparser.dart';
import 'nimi.dart';
import 'toki_content_phrase.dart';
import 'toki_predicate.dart';
import 'toki_prep_phrase.dart';
import 'toki_clause.dart';
import 'toki_word.dart';

typedef Seq<T> = SequenceParser<T>;
typedef Or<T> = ChoiceParser<T>;

extension ListWrap<T> on Parser<T> {
  Parser<List<T>> listWrap() => map((x) => [x]);
}

extension InterleavedRepeat<T> on Parser<T> {
  // counts repeats of in-between token, or repeats of main parser - 1
  Parser<List<T>> interleavedRepeat(Parser<void> p,
          [int minRepeats = 0, int maxRepeats = unbounded]) =>
      Seq([listWrap(), skip(before: p).repeat(minRepeats, maxRepeats)])
          .map((x) => x[0] + x[1]);
}

extension CastToList on Parser {
  Parser<List<T>> castToList<T>() {
    return map((x) => List<T>.from(x as Iterable));
  }
}

class TokiGrammar extends GrammarDefinition {
  @override
  Parser start() => ref0(sentences).end();

  Parser<void> spaceOrEnd() => Or([char(' '), endOfInput()]);

  Parser<TokiWord> aString(Parser<String> x, [isName = false]) =>
      Seq([x, string(' a').skip(after: ref0(spaceOrEnd).and()).optional()])
          .map((x) => TokiWord(x[0]!, aAttached: x[1] != null, isName: isName));

  Parser<TokiWord> aContentWord() => ref1(aString, contentWord);

  // TODO: ensure proper name syllables
  Parser<TokiWord> name() =>
      ref2(aString, Seq([uppercase(), lowercase().plus()]).flatten(), true);

  Parser<TokiWord> modifier() => Or([ref0(aContentWord), ref0(name)]);

  Parser<List<TokiWord>> singleWordGroup() => ref0(aContentWord).listWrap();

  // checks limit between first and further words
  // does not check limit before string
  Parser<List<TokiWord>> multiWordGroup([Parser<void>? limit]) {
    var tmp = ref0(modifier).skip(before: char(' '));
    var modifiers = limit != null ? tmp.plusLazy(limit) : tmp.plus();
    modifiers = modifiers.skip(after: Or([char(' '), endOfInput()]).and());

    return Seq([
      ref0(singleWordGroup).skip(after: (limit ?? failure()).not()),
      modifiers
    ]).map((x) => x[0] + x[1]);
  }

  Parser<List<TokiWord>> multiOrSingleGroup([Parser<void>? limit]) =>
      Or([ref1(multiWordGroup, limit), ref0(singleWordGroup)]);

  Parser<List<List<TokiWord>>> piString([Parser<void>? limit]) => Seq([
        ref1(multiOrSingleGroup, limit).skip(after: string(' pi ')).listWrap(),
        Or([
          ref1(piString, limit),
          Seq([
            ref0(singleWordGroup).skip(after: char(' ')),
            ref1(multiOrSingleGroup, limit)
          ]).map((x) => [x[0] + x[1]])
        ])
      ]).map((x) => x[0] + x[1]);

  Parser<TokiContentPhrase> contentGroup([Parser<void>? limit]) => Or([
        ref1(piString, limit),
        ref1(multiWordGroup, limit).listWrap(),
      ]).map((x) => TokiContentPhrase(x));

  Parser<TokiContentPhrase> content([Parser<void>? limit]) => Or([
        ref1(contentGroup, limit),
        ref0(singleWordGroup).listWrap().map((x) => TokiContentPhrase(x))
      ]);

  Parser<List<TokiContentPhrase>> subjects() =>
      ref0(content).interleavedRepeat(string(' en '));

  Parser<String> miSina() => Or([string('mi'), string('sina')]);

  // naively assumes a "mi" or "sina" at the start must be a lone subject
  Parser<List<TokiContentPhrase>> prePredicate(PredicateType type) {
    switch (type) {
      case PredicateType.li:
        return Or([
          ref1(aString, ref0(miSina).skip(after: char(' ').and()))
              .skip(after: Or([string(' li '), string(' en ')]).not())
              .listWrap()
              .listWrap()
              .map((x) => TokiContentPhrase(x))
              .listWrap(),
          ref0(subjects).skip(after: string(' li') & char(' ').and())
        ]);
      case PredicateType.o:
        return ref0(subjects)
            .skip(after: char(' '))
            .optional()
            .skip(after: char('o'))
            .map((x) => x ?? List<TokiContentPhrase>.empty());
    }
  }

  Parser<TokiWord> preposition() => ref1(
      aString,
      Or(['alasa', 'kepeken', 'lon', 'lukin', 'sama', 'tan', 'tawa']
          .map(string)));

  // separates sentences
  Parser<String> sepPunctuation() => pattern('.:;');

  // for content word groups, guarantees that prep phrases are not infringed upon
  Parser<void> contentLimit() => Or([
        char(' ') & ref0(prepPhrase),
        char(' ') & contentWord.not(),
        ref0(sepPunctuation),
        endOfInput()
      ]);

  // yields to other prep phrases
  Parser<TokiPrepPhrase> prepPhrase() => Seq([
        ref0(preposition).skip(after: char(' ')),
        ref1(content, ref0(contentLimit))
      ]).map(
          (x) => TokiPrepPhrase(x[0] as TokiWord, x[1] as TokiContentPhrase));

  // like content(), but yields to prep phrases
  Parser<TokiContentPhrase> prePrepContent() => Or([
        Seq([ref0(singleWordGroup), char(' ').seq(ref0(prepPhrase)).and()])
            .pick(0)
            .listWrap()
            .map((x) => TokiContentPhrase(List<List<TokiWord>>.from(x))),
        ref1(content, ref0(contentLimit))
      ]);

  Parser<TokiPredicate> predicate(PredicateType type) => Or([
        Seq([
          epsilon().map((x) => const TokiContentPhrase([])),
          epsilon().map((x) => []),
          ref0(prepPhrase).interleavedRepeat(string(' '))
        ]),
        Seq([
          ref0(content),
          ref0(prePrepContent).skip(before: string(' e ')).plus(),
          ref0(prepPhrase).skip(before: char(' ')).star()
        ]),
        Seq([
          ref0(prePrepContent),
          epsilon().map((x) => []),
          ref0(prepPhrase).skip(before: char(' ')).star()
        ])
      ]).map((x) => TokiPredicate(
          verb: x[0] as TokiContentPhrase,
          objects: List<TokiContentPhrase>.from(x[1] as List),
          prepPhrases: List<TokiPrepPhrase>.from(x[2] as List)));

  // TODO: la
  Parser<TokiClause> clause(PredicateType type) {
    String marker;
    switch (type) {
      case PredicateType.li:
        marker = 'li';
        break;
      case PredicateType.o:
        marker = 'o';
        break;
    }

    return Seq([
      ref1(prePredicate, type).skip(after: char(' ')),
      ref1(predicate, type)
          .interleavedRepeat(char(' ') & string(marker) & char(' ')),
    ]).map((x) => TokiClause(
        type: type,
        subjects: List<TokiContentPhrase>.from(x[0]),
        predicates: List<TokiPredicate>.from(x[1])));
  }

  Parser<List<TokiClause>> sentence(PredicateType type) =>
      ref1(clause, type).interleavedRepeat(string(' la '));

  Parser<List<List<TokiClause>>> sentences() {
    Parser<List<List<TokiClause>>> sentenceRepeat(Parser<List<TokiClause>> p) {
      return p.interleavedRepeat(Seq([ref0(sepPunctuation), char(' ')]));
    }

    // may cause a problem. maybe.
    return Or([
      sentenceRepeat(ref1(sentence, PredicateType.o)),
      sentenceRepeat(ref1(sentence, PredicateType.li))
    ]).skip(after: char('.').optional());
  }
}
