import 'dart:math';

import '../utility/utility.dart';

class PhraseChoices {
  final List<Iterable<String>> choiceSetList;

  const PhraseChoices(this.choiceSetList);

  PhraseChoices.fromPhraseChoicesList(List<PhraseChoices> phraseChoicesList)
      : this(List.unmodifiable(phraseChoicesList
            .map((x) => x.choiceSetList)
            .reduce((x, y) => x + y)));

  String generatePhrase() {
    final rand = Random();

    return choiceSetList.map((x) => x.randomChoice(rand)).join(' ');
  }
}
