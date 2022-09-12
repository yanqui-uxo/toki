import 'content_phrase.dart';
import 'content_phrase_choice.dart';

class Subject extends ContentPhraseChoice {
  final bool isLoneMiSina;

  Subject(List<ContentPhrase> choices, [this.isLoneMiSina = false])
      : super(choices);

  Subject.fromContentPhraseChoice(ContentPhraseChoice contentPhraseChoice)
      : isLoneMiSina = false,
        super(contentPhraseChoice.choices);

  @override
  String toString() =>
      'Subject(choices: $choices, isLoneMiSina: $isLoneMiSina)';
}
