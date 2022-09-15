import 'package:intersperse/intersperse.dart';

import '../representation/basic_representation.dart';
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
  Representation toRepresentation() {
    List<Representation> contextRepresentations = contextPhrases
        .toRepresentationList()
        .map((x) => Representation.wrap(
            baseRepresentation: x,
            description: const Description('context phrase')))
        .intersperseOuter(const BasicRepresentation(
            text: 'la', description: Description('context marker')))
        .toList();
    if (contextRepresentations.isNotEmpty) {
      contextRepresentations.removeAt(0);
    }

    return Representation(baseRepresentations: [
      ...contextRepresentations,
      rootClause.toRepresentation()
    ]);
  }
}
