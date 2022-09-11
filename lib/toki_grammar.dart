import 'package:petitparser/petitparser.dart';

import 'nimi.dart';
import 'toki_clause.dart';
import 'toki_content_phrase.dart';
import 'toki_content_phrase_choice.dart';
import 'toki_context_phrase.dart';
import 'toki_predicate.dart';
import 'toki_prep_phrase.dart';
import 'toki_punctuated_sentence.dart';
import 'toki_sentence.dart';
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

extension CaseCheck on String {
  bool get isUpper => this == toUpperCase();
  bool get isLower => this == toLowerCase();

  // fails on empty strings
  bool get isCapitalized =>
      this[0].isUpper && (length == 1 || substring(1).isLower);
}

// TODO: support commas
class TokiGrammar extends GrammarDefinition {
  @override
  Parser<List<TokiPunctuatedSentence>> start() => ref0(sentences).end();

  Parser<void> spaceOrEnd() => Or([char(' '), endOfInput()]);

  Parser<TokiWord> aWord(Parser<String> x, [isName = false]) =>
      Seq([x, string(' a').skip(after: ref0(spaceOrEnd).and()).optional()])
          .map((x) => TokiWord(x[0]!, aAttached: x[1] != null, isName: isName));

  Parser<TokiWord> aContentWord() => ref1(aWord, contentWord);

  Parser<TokiWord> name() {
    Parser<String> consonant() => patternIgnoreCase('jklmnpstw');
    Parser<String> vowel() => patternIgnoreCase('aeiou');

    Set<String> forbidden = {
      'wu',
      'wo',
      'ji',
      'ti',
      'wun',
      'won',
      'jin',
      'tin'
    };
    Parser<String> syllable() => Seq([
          ref0(consonant).optional(),
          ref0(vowel).skip(after: ref0(vowel).not()),
          char('n').skip(after: pattern('mn').not()).optional()
        ]).flatten().where((x) => !forbidden.contains(x.toLowerCase()));

    Parser<String> capSyllable() =>
        ref0(syllable).where((x) => x.isCapitalized);
    Parser<String> lowerSyllable() => ref0(syllable).where((x) => x.isLower);

    return ref2(aWord,
        Seq([ref0(capSyllable), ref0(lowerSyllable).star()]).flatten(), true);
  }

  Parser<TokiWord> modifier() => Or([ref0(aContentWord), ref0(name)]);

  Parser<List<TokiWord>> singleWordGroup() => ref0(aContentWord).listWrap();

  // checks limit between first and further words
  // does not check limit before string
  Parser<List<TokiWord>> multiWordGroup([Parser<void>? limit]) {
    var tmp = ref0(modifier).skip(before: char(' '));
    var modifiers = limit != null ? tmp.plusLazy(limit) : tmp.plus();

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

  Parser<TokiContentPhraseChoice> anuContent([Parser<void>? limit]) =>
      ref1(content, limit)
          .interleavedRepeat(string(' anu '))
          .map((x) => TokiContentPhraseChoice(x));

  // naively assumes a "mi" or "sina" at the start must be a lone subject
  Parser<List<TokiContentPhraseChoice>> prePredicate(PredicateType type) {
    Parser<List<TokiContentPhraseChoice>> subjects() =>
        ref0(anuContent).interleavedRepeat(string(' en '));

    // detects unmodified mi/sina
    Parser<String> loneMiSina() => Or([string('mi'), string('sina')]).skip(
        after: char(' ').and() &
            string(' pi ').not() &
            string(' en ').not() &
            string(' anu ').not());

    Parser<void> miSinaLi() =>
        Or([string('mi'), string('sina')]) & (string(' li '));

    switch (type) {
      case PredicateType.li:
        return Or([
          ref1(aWord, ref0(loneMiSina))
              .skip(after: string(' li ').not())
              .map((x) => [
                    TokiContentPhraseChoice([
                      TokiContentPhrase([
                        [x]
                      ])
                    ])
                  ]),
          ref0(subjects).skip(
              before: ref0(miSinaLi).not(),
              after: string(' li') & char(' ').and())
        ]);
      case PredicateType.o:
        return ref0(subjects)
            .skip(after: char(' '))
            .optional()
            .skip(after: char('o'))
            .map((x) => x ?? []);
    }
  }

  Parser<TokiWord> preposition() => ref1(aWord, Or(prepositions.map(string)));
  Parser<TokiWord> preverb() => ref1(aWord, Or(preverbs.map(string)));

  // separates sentences
  static final Parser<String> sepPunctuation = pattern('.:;!?');
  static final Parser<String> endPunctuation = pattern('.!?');

  // for content word groups, guarantees that prep phrases are not infringed upon
  Parser<void> contentLimit() => Or([
        char(' ') & ref0(prepPhrase),
        char(' ') & contentWord.not(),
        sepPunctuation,
        endOfInput()
      ]);

  // yields to other prep phrases if yield is true
  Parser<TokiPrepPhrase> prepPhrase([bool yield = true]) => Seq([
        ref0(preposition).skip(after: char(' ')),
        ref1(anuContent, yield ? ref0(contentLimit) : null)
      ]).map((x) =>
          TokiPrepPhrase(x[0] as TokiWord, x[1] as TokiContentPhraseChoice));

  // like content(), but yields to prep phrases
  Parser<TokiContentPhraseChoice> prePrepContent() => Or([
        Seq([ref0(singleWordGroup), char(' ').seq(ref0(prepPhrase)).and()])
            .pick(0)
            .listWrap()
            .map((x) => TokiContentPhraseChoice(
                [TokiContentPhrase(List<List<TokiWord>>.from(x))])),
        ref1(anuContent, ref0(contentLimit))
      ]);

  Parser<List<TokiWord>> predicatePreverbs() =>
      ref0(preverb).skip(after: char(' ') & contentWord.and()).star();

  Parser<TokiPredicate> predicate(PredicateType type) => Or([
        Seq([
          ref0(predicatePreverbs),
          // ignore: prefer_void_to_null
          epsilon().cast<Null>(),
          epsilon().map((x) => []),
          ref0(prepPhrase).interleavedRepeat(string(' '))
        ]),
        Seq([
          ref0(predicatePreverbs),
          ref0(anuContent),
          ref0(prePrepContent).skip(before: string(' e ')).plus(),
          ref0(prepPhrase).skip(before: char(' ')).star()
        ]),
        Seq([
          ref0(predicatePreverbs),
          ref0(prePrepContent),
          epsilon().map((x) => []),
          ref0(prepPhrase).skip(before: char(' ')).star()
        ])
      ]).map((x) => TokiPredicate(
          preverbs: List<TokiWord>.from(x[0] as List),
          verb: x[1] as TokiContentPhraseChoice?,
          objects: List<TokiContentPhraseChoice>.from(x[2] as List),
          prepPhrases: List<TokiPrepPhrase>.from(x[3] as List)));

  Parser<TokiClause> clause(PredicateType type) {
    var marker = type.name;

    return Seq([
      ref1(prePredicate, type).skip(after: char(' ')),
      ref1(predicate, type)
          .interleavedRepeat(char(' ') & string(marker) & char(' ')),
    ]).map((x) => TokiClause(
        type: type,
        subjects: List<TokiContentPhraseChoice>.from(x[0]),
        predicates: List<TokiPredicate>.from(x[1])));
  }

  Parser<TokiClause> anyClause() =>
      Or([ref1(clause, PredicateType.o), ref1(clause, PredicateType.li)]);

  Parser<TokiSentence> sentence() => Seq([
        Or([ref0(anyClause), ref1(prepPhrase, false), ref0(content)])
            .skip(after: string(' la '))
            .star(),
        ref0(anyClause)
      ]).map((x) => TokiSentence(
          x[1] as TokiClause, List<TokiContextPhrase>.from(x[0] as List)));

  Parser<List<TokiPunctuatedSentence>> sentences() => Seq([
        Seq([ref0(sentence), sepPunctuation.skip(after: char(' '))])
            .map((x) => TokiPunctuatedSentence.fromSentence(
                x[0] as TokiSentence, x[1] as String))
            .star(),
        Seq([ref0(sentence), endPunctuation.optional()])
            .map((x) => TokiPunctuatedSentence.fromSentence(
                x[0] as TokiSentence, x[1] as String?))
            .listWrap()
      ]).map((x) => x[0] + x[1]);
}
