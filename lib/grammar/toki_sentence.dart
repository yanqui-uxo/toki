import 'package:intersperse/intersperse.dart';

import '../representation/particle_representation.dart';
import '../representation/represent.dart';
import 'toki_clause.dart';
import 'toki_context_phrase.dart';

class TokiSentence implements Representable {
  final List<TokiContextPhrase> contextPhrases;
  final TokiClause rootClause;

  const TokiSentence(this.rootClause, [this.contextPhrases = const []]);

  @override
  String toString() =>
      'Sentence(contextPhrases: $contextPhrases, rootClause: $rootClause)';

  @override
  Representation toRepresentation() => Representation(baseRepresentations: [
        ...contextPhrases
            .toRepresentationList()
            .intersperse(const ParticleRepresentation('la')),
        rootClause.toRepresentation()
      ]);
}
