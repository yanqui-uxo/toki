import 'dart:math';

import '../data/nimi.dart';
import '../english/verb.dart';
import '../english/word_definitions.dart';
import '../representation/basic_representation.dart';
import '../representation/complex_representation.dart';
import '../representation/represent.dart';
import '../translation/english_categorizable.dart';
import '../translation/grammar_category_exception.dart';
import '../utility/extensions.dart';

class Word implements EnglishCategorizable, Representable {
  final String word;
  final bool aAttached;
  final bool isName;

  const Word(this.word, {this.aAttached = false, this.isName = false});

  WordDefinitions get _definitions => contentWords[word]!;

  @override
  PluralString randomNounString(NounType type) {
    final noun = _definitions.nouns.randomChoice();

    if (noun == null) throw GrammarCategoryException();

    final bool plural;

    if (noun.hasPluralForm) {
      plural = Random().nextBool();
    } else {
      plural = false;
    }

    final String word;

    switch (type) {
      case NounType.subject:
        word = noun.nominativeForm(plural);
        break;
      case NounType.object:
        word = noun.accusativeForm(plural);
    }

    return PluralString(word, plural);
  }

  @override
  String randomAdjectiveString(bool plural) {
    final adjective = _definitions.adjectives.randomChoice();

    if (adjective == null) throw GrammarCategoryException();

    if (plural) {
      return adjective.irregularPluralForm ?? adjective.rootWord;
    } else {
      return adjective.rootWord;
    }
  }

  @override
  String randomVerbString(VerbSubject subject) {
    final verb = _definitions.verbs.randomChoice();

    if (verb == null) throw GrammarCategoryException();

    return verb.randomForm(subject);
  }

  String? randomAdverb() => _definitions.adverbs.randomChoice();

  @override
  Representation toRepresentation() {
    BasicRepresentation rep;
    if (isName) {
      rep = BasicRepresentation(
          text: word, description: const Description('name'));
    } else {
      rep = BasicRepresentation(text: word);
    }

    if (aAttached) {
      return ComplexRepresentation(baseRepresentations: [
        rep,
        const BasicRepresentation(
            text: 'a', description: Description('emotion marker'))
      ]);
    } else {
      return rep;
    }
  }

  @override
  String toString() {
    var ret = word;
    if (aAttached) ret += '+a';
    if (isName) ret += ' (name)';
    return ret;
  }
}
