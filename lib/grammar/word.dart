import 'dart:math';

import '../data/nimi.dart';
import '../english/verb.dart';
import '../english/word_definitions.dart';
import '../representation/basic_representation.dart';
import '../representation/complex_representation.dart';
import '../representation/represent.dart';
import '../translation/english_categorizable.dart';
import '../utility/extensions.dart';

class Word implements EnglishCategorizable, Representable {
  final String word;
  final bool aAttached;
  final bool isName;

  const Word(this.word, {this.aAttached = false, this.isName = false});

  WordDefinitions get _definitions => contentWords[word]!;

  @override
  PluralString randomNoun(NounType type) {
    final noun = _definitions.nouns.randomChoice();

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
  String randomAdjective(bool plural) {
    final adjective = _definitions.adjectives.randomChoice();

    if (plural) {
      return adjective.irregularPluralForm ?? adjective.rootWord;
    } else {
      return adjective.rootWord;
    }
  }

  @override
  String randomVerb(VerbSubject subject) =>
      _definitions.verbs.randomChoice().randomForm(subject);

  String randomAdverb() => _definitions.adverbs.randomChoice();

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
