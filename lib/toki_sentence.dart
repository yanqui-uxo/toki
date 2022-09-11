import 'representation/complex_representation.dart';
import 'representation/represent.dart';
import 'toki_clause.dart';
import 'toki_context_phrase.dart';

class TokiSentence implements Representable {
  final List<TokiContextPhrase> contextPhrases;
  final TokiClause rootClause;

  const TokiSentence(this.rootClause, [this.contextPhrases = const []]);

  @override
  String toString() =>
      'Sentence(contextPhrases: $contextPhrases, rootClause: $rootClause)';

  // TODO: add proper particles
  @override
  Representation toRepresentation() => ComplexRepresentation(baseReps: [
        ...contextPhrases.toRepresentationList(),
        rootClause.toRepresentation()
      ]);
}
