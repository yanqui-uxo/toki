import 'string_choices.dart';

class NounStringChoices extends MultipleStringChoices {
  final bool plural;
  NounStringChoices(Iterable<String> choices, this.plural) : super(choices);
}
