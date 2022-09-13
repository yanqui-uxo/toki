import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import 'clause.dart';
import 'context_phrase.dart';
import 'sentence.dart';

// TODO: separate punctuation from content

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
  Representation toRepresentation() {
    if (punctuation != null) {
      return super.toRepresentation().withPunctuation(punctuation!);
    } else {
      return super.toRepresentation();
    }
  }

  @override
  String toString() => 'PunctuatedSentence(contextPhrases: $contextPhrases, '
      'rootClause: $rootClause, punctuation: $punctuation)';
}
