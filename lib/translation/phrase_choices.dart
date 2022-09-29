import 'dart:math';

import '../utility/utility.dart';

class EmptyChoices implements Exception {
  const EmptyChoices();
}

class PhraseChoices {
  final List<Iterable<String>> choiceSetList;

  PhraseChoices(choiceSetList)
      : choiceSetList = List.unmodifiable(choiceSetList) {
    if (choiceSetList.isEmpty || choiceSetList.any((x) => x.isEmpty)) {
      throw const EmptyChoices();
    }
  }

  PhraseChoices.fromPhraseChoicesList(List<PhraseChoices> phraseChoicesList)
      : this(phraseChoicesList
            .map((x) => x.choiceSetList)
            .reduce((x, y) => x + y));

  PhraseChoices.fromStrings(Iterable<String> stringIterable)
      : this([stringIterable]);

  String generatePhrase() {
    final rand = Random();

    return choiceSetList.map((x) => x.randomChoice(rand)).join(' ');
  }
}
