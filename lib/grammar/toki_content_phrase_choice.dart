import 'package:intersperse/intersperse.dart';
import '../representation/particle_representation.dart';
import '../representation/represent.dart';
import 'toki_content_phrase.dart';
import 'toki_context_phrase.dart';

class TokiContentPhraseChoice implements TokiContextPhrase {
  final List<TokiContentPhrase> choices;

  const TokiContentPhraseChoice(this.choices);

  @override
  Representation toRepresentation() => Representation(
      baseRepresentations: choices
          .toRepresentationList()
          .intersperse(const ParticleRepresentation('pi'))
          .toList());

  @override
  String toString() => 'TokiContentPhraseChoice(phrases: $choices)';
}
