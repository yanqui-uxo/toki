import 'package:intersperse/intersperse.dart';
import '../representation/complex_representation.dart';
import '../representation/represent.dart';
import 'content_phrase_choice.dart';
import 'verb.dart';

// TODO: combine ContentPhraseChoice and VerbChoice into one abstraction
class VerbChoice implements Representable {
  final List<Verb> choices;

  VerbChoice(ContentPhraseChoice phraseChoices)
      : choices = phraseChoices.choices.map(Verb.new).toList();

  @override
  Representation toRepresentation() => ComplexRepresentation(
      baseRepresentations: choices
          .toRepresentationList()
          .map((x) => Representation.wrap(
              baseRepresentation: x, description: choiceDescription))
          .intersperse(anuRepresentation)
          .toList());
}
