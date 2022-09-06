import 'representable.dart';
import 'toki_clause.dart';
import 'toki_context_phrase.dart';

class TokiSentence implements Representable {
  final List<TokiContextPhrase> contextPhrases;
  final TokiClause rootClause;

  const TokiSentence(this.rootClause, [this.contextPhrases = const []]);

  @override
  String toString() {
    return "Sentence(contextPhrases: $contextPhrases, rootClause: $rootClause)";
  }
}
