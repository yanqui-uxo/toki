import 'package:intersperse/intersperse.dart';

import '../representation/particle_representation.dart';
import '../representation/represent.dart';
import 'clause.dart';
import 'context_phrase.dart';

class Sentence implements Representable {
  final List<ContextPhrase> contextPhrases;
  final Clause rootClause;

  const Sentence(this.rootClause, [this.contextPhrases = const []]);

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
