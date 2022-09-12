import 'package:intersperse/intersperse.dart';
import '../representation/particle_representation.dart';
import '../representation/represent.dart';
import 'content_phrase.dart';
import 'context_phrase.dart';

class ContentPhraseChoice implements ContextPhrase {
  final List<ContentPhrase> choices;

  const ContentPhraseChoice(this.choices);

  @override
  Representation toRepresentation() => Representation(
      baseRepresentations: choices
          .toRepresentationList()
          .intersperse(const ParticleRepresentation('pi'))
          .toList());

  @override
  String toString() => 'ContentPhraseChoice(phrases: $choices)';
}
