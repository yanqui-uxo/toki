import 'choice.dart';
import 'content_phrase.dart';
import 'context_phrase.dart';

class ContentPhraseChoice extends Choice<ContentPhrase>
    implements ContextPhrase {
  @override
  final List<ContentPhrase> choices;

  const ContentPhraseChoice(this.choices);
}
