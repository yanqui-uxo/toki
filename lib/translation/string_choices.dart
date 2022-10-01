import 'dart:math';

class EmptyChoicesException implements Exception {
  const EmptyChoicesException();
}

abstract class StringChoices {
  String generate();
}

class SingleStringChoice implements StringChoices {
  final String choice;

  const SingleStringChoice(this.choice);

  @override
  String generate() => choice;
}

class MultipleStringChoices implements StringChoices {
  static final Random _rand = Random();

  final List<String> choices;

  MultipleStringChoices(Iterable<String> choices)
      : choices = List.unmodifiable(choices) {
    if (choices.isEmpty) {
      throw const EmptyChoicesException();
    }
  }

  @override
  String generate() {
    return choices[_rand.nextInt(choices.length)];
  }
}

class CombinedStringChoices implements StringChoices {
  final List<StringChoices> choicesList;

  CombinedStringChoices(List<StringChoices> choicesList)
      : choicesList = List.unmodifiable(choicesList);

  @override
  String generate() {
    return choicesList.map((x) => x.generate()).join(' ');
  }
}
