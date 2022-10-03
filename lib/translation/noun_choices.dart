import 'string_choices.dart';

class NounChoices extends MultipleStringChoices {
  final bool plural;
  NounChoices(Iterable<String> choices, this.plural) : super(choices);
}
