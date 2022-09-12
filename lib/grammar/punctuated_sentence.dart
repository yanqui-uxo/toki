import 'clause.dart';
import 'context_phrase.dart';
import 'sentence.dart';

class PunctuatedSentence extends Sentence {
  final String? punctuation;

  PunctuatedSentence(
      {required Clause rootClause,
      List<ContextPhrase> contextPhrases = const [],
      this.punctuation})
      : super(rootClause, contextPhrases);

  PunctuatedSentence.fromSentence(Sentence sentence, [String? punctuation])
      : this(
            rootClause: sentence.rootClause,
            contextPhrases: sentence.contextPhrases,
            punctuation: punctuation);

  @override
  String toString() => 'PunctuatedSentence(contextPhrases: $contextPhrases, '
      'rootClause: $rootClause, punctuation: $punctuation)';
}
