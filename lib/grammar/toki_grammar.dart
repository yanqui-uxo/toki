import 'package:petitparser/petitparser.dart';

import '../data/nimi.dart';
import '../utility/extensions.dart';
import 'clause.dart';
import 'content_phrase.dart';
import 'content_phrase_choice.dart';
import 'context_phrase.dart';
import 'predicate.dart';
import 'prep_phrase.dart';
import 'punctuated_sentence.dart';
import 'sentence.dart';
import 'subjects.dart';
import 'word.dart';

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

// TODO: implement nanpa
class TokiGrammar extends GrammarDefinition {
  @override
  Parser start() => ref0(sentences).end();

  Parser<void> spaceOrEnd() =>
      Or([char(' '), sepPunctuation, endPunctuation, endOfInput()]);

  Parser<Word> aWord(Parser<String> x, [isName = false]) =>
      Seq([x, string(' a').skip(after: ref0(spaceOrEnd).and()).optional()])
          .map((x) => Word(x[0]!, aAttached: x[1] != null, isName: isName));

  Parser<Word> aContentWord() => ref1(aWord, contentWord);

  Parser<Word> name() {
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

  Parser<Word> modifier() => Or([ref0(aContentWord), ref0(name)]);

  Parser<ContentGroup> singleWordGroup() => ref0(aContentWord).listWrap();

  // checks limit between first and further words
  // does not check limit before string
  Parser<ContentGroup> multiWordGroup([Parser<void>? limit]) {
    var tmp = ref0(modifier).skip(before: char(' '));
    var modifiers = limit != null ? tmp.plusLazy(limit) : tmp.plus();

    return Seq([
      ref0(singleWordGroup).skip(after: (limit ?? failure()).not()),
      modifiers
    ]).map((x) => x[0] + x[1]);
  }

  Parser<ContentGroup> multiOrSingleGroup([Parser<void>? limit]) =>
      Or([ref1(multiWordGroup, limit), ref0(singleWordGroup)]);

  Parser<List<ContentGroup>> piString([Parser<void>? limit]) => Seq([
        ref1(multiOrSingleGroup, limit).skip(after: string(' pi ')).listWrap(),
        Or([
          ref1(piString, limit),
          Seq([
            ref0(singleWordGroup).skip(after: char(' ')),
            ref1(multiOrSingleGroup, limit)
          ]).map((x) => [x[0] + x[1]])
        ])
      ]).map((x) => x[0] + x[1]);

  Parser<ContentPhrase> contentGroup([Parser<void>? limit]) => Or([
        ref1(piString, limit),
        ref1(multiWordGroup, limit).listWrap(),
      ]).map(ContentPhrase.new);

  Parser<ContentPhrase> content([Parser<void>? limit]) => Or([
        ref1(contentGroup, limit),
        ref0(singleWordGroup).listWrap().map(ContentPhrase.new)
      ]);

  Parser<ContentPhraseChoice> anuContent([Parser<void>? limit]) =>
      ref1(content, limit)
          .interleavedRepeat(string(' anu '))
          .map(ContentPhraseChoice.new);

  // naively assumes a "mi" or "sina" at the start must be a lone subject
  Parser<Subjects> prePredicate(PredicateType type) {
    Parser<Subjects> subjects() =>
        ref0(anuContent).interleavedRepeat(string(' en ')).map(Subjects.new);

    // detects unmodified mi/sina
    Parser<Subjects> loneMiSina() => ref1(
            aWord,
            Or([string('mi'), string('sina')]).skip(
                before:
                    ref0(subjects).and().where((x) => x.subjects.length == 1),
                after: char(' ').and() &
                    string(' pi ').not() &
                    string(' anu ').not()))
        .map((x) => Subjects([
              ContentPhraseChoice([
                ContentPhrase([
                  [x]
                ])
              ]),
            ], isLoneMiSina: true));

    Parser<void> miSinaLi() =>
        Or([string('mi'), string('sina')]) & (string(' li '));

    switch (type) {
      case PredicateType.li:
        return Or([
          ref0(loneMiSina).skip(after: string(' li ').not()),
          ref0(subjects).skip(
              before: ref0(miSinaLi).not(),
              after: string(' li') & char(' ').and())
        ]);
      case PredicateType.o:
        return ref0(subjects)
            .skip(after: char(' '))
            .optional()
            .skip(after: char('o'))
            .map((x) => x ?? const Subjects([]));
    }
  }

  Parser<Word> preposition() =>
      ref1(aWord, Or(prepositions.keySet().map(string)));
  Parser<Word> preverb() => ref1(aWord, Or(preverbs.keySet().map(string)));

  // separates sentences
  static final Parser<String> sepPunctuation = pattern('.:;!?');

  // can end final sentence
  static final Parser<String> endPunctuation = pattern('.!?');

  // for content word groups
  // guarantees that prep phrases are not infringed upon
  Parser<void> contentLimit() => Or([
        char(' ') & ref0(prepPhrase),
        char(' ') & contentWord.not() & ref0(name).not(),
        sepPunctuation,
        endOfInput()
      ]);

  // yields to other prep phrases if yield is true
  Parser<PrepPhrase> prepPhrase([bool yield = true]) => Seq([
        ref0(preposition).skip(after: char(' ')),
        ref1(anuContent, yield ? ref0(contentLimit) : null)
      ]).map((x) => PrepPhrase(x[0] as Word, x[1] as ContentPhraseChoice));

  // like content(), but yields to prep phrases
  Parser<ContentPhraseChoice> prePrepContent() => Or([
        Seq([ref0(singleWordGroup), char(' ').seq(ref0(prepPhrase)).and()])
            .pick(0)
            .listWrap()
            .map((x) => ContentPhraseChoice(
                [ContentPhrase(List<ContentGroup>.from(x))])),
        ref1(anuContent, ref0(contentLimit))
      ]);

  Parser<ContentGroup> predicatePreverbs() =>
      ref0(preverb).skip(after: char(' ') & contentWord.and()).star();

  Parser<Predicate> predicate() => Or([
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
      ]).map((x) => Predicate(
          preverbs: ContentGroup.from(x[0] as List),
          verb: x[1] as ContentPhraseChoice?,
          objects: List<ContentPhraseChoice>.from(x[2] as List),
          prepPhrases: List<PrepPhrase>.from(x[3] as List)));

  Parser<Clause> clause(PredicateType type) {
    var marker = type.name;

    return Seq([
      string('taso ').optional(),
      ref1(prePredicate, type).skip(after: char(' ')),
      ref0(predicate).interleavedRepeat(char(' ') & string(marker) & char(' ')),
    ]).map((x) => Clause(
        type: type,
        tasoAtStart: x[0] != null,
        subjects: x[1] as Subjects,
        predicates: List<Predicate>.from(x[2] as List)));
  }

  Parser<Clause> anyClause() =>
      Or([ref1(clause, PredicateType.o), ref1(clause, PredicateType.li)]);

  Parser<Sentence> sentence() => Seq([
        Or([ref0(anyClause), ref1(prepPhrase, false), ref0(content)])
            .skip(after: string(' la '))
            .star(),
        ref0(anyClause)
      ]).map((x) =>
          Sentence(x[1] as Clause, List<ContextPhrase>.from(x[0] as List)));

  Parser<List<PunctuatedSentence>> sentences() => Seq([
        Seq([ref0(sentence), sepPunctuation.skip(after: char(' '))])
            .map((x) => PunctuatedSentence.fromSentence(
                x[0] as Sentence, x[1] as String))
            .star(),
        Seq([ref0(sentence), endPunctuation.optional()])
            .map((x) => PunctuatedSentence.fromSentence(
                x[0] as Sentence, x[1] as String?))
            .listWrap()
      ]).map((x) => x[0] + x[1]);
}
