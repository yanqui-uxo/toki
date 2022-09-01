import 'toki_clause.dart';

class TokiSentence {
  final bool usesLa;
  final List<TokiClause> contextClauses;
  final TokiClause rootClause;

  TokiSentence(this.rootClause)
      : contextClauses = List.empty(),
        usesLa = false;

  TokiSentence.la(this.contextClauses)
      : rootClause = contextClauses[contextClauses.length - 1],
        usesLa = true;
}
