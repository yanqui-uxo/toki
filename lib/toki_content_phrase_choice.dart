import 'package:intersperse/intersperse.dart';
import 'representation/particle_representation.dart';
import 'representation/represent.dart';
import 'toki_content_phrase.dart';
import 'toki_context_phrase.dart';

class TokiContentPhraseChoice implements TokiContextPhrase {
  final List<TokiContentPhrase> phrases;

  const TokiContentPhraseChoice(this.phrases);

  @override
  Representation toRepresentation() => Representation(
      baseRepresentations: phrases
          .toRepresentationList()
          .intersperse(const ParticleRepresentation('pi'))
          .toList());

  @override
  String toString() => 'TokiContentPhraseChoice(phrases: $phrases)';
}
