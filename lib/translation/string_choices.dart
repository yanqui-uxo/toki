import '../utility/utility.dart';

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
  final List<String> choices;

  MultipleStringChoices(Iterable<String> choices)
      : choices = List.unmodifiable(choices) {
    if (choices.isEmpty) {
      throw ArgumentError('Choice list cannot be null');
    }
  }

  @override
  String generate() => choices.randomChoice();
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
