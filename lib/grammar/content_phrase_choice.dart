import 'package:intersperse/intersperse.dart';
import '../representation/represent.dart';
import 'content_phrase.dart';
import 'context_phrase.dart';

class ContentPhraseChoice implements ContextPhrase {
  final List<ContentPhrase> choices;

  const ContentPhraseChoice(this.choices);

  @override
  Representation toRepresentation() {
    List<Representation> choiceRepresentations = choices.toRepresentationList();
    if (choiceRepresentations.length > 1) {
      choiceRepresentations = choiceRepresentations
          .map((x) => Representation.wrap(
              baseRepresentation: x, description: choiceDescription))
          .intersperse(anuRepresentation)
          .toList();
    }

    return Representation(baseRepresentations: choiceRepresentations);
  }

  @override
  String toString() => 'ContentPhraseChoice(phrases: $choices)';
}
