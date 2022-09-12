import 'toki_clause.dart';
import 'toki_context_phrase.dart';
import 'toki_sentence.dart';

class TokiPunctuatedSentence extends TokiSentence {
  final String? punctuation;

  TokiPunctuatedSentence(
      {required TokiClause rootClause,
      List<TokiContextPhrase> contextPhrases = const [],
      this.punctuation})
      : super(rootClause, contextPhrases);

  TokiPunctuatedSentence.fromSentence(TokiSentence sentence,
      [String? punctuation])
      : this(
            rootClause: sentence.rootClause,
            contextPhrases: sentence.contextPhrases,
            punctuation: punctuation);

  @override
  String toString() =>
      'TokiPunctuatedSentence(contextPhrases: $contextPhrases, '
      'rootClause: $rootClause, punctuation: $punctuation)';
}
