import 'toki_content_phrase.dart';
import 'toki_content_phrase_choice.dart';

class TokiSubject extends TokiContentPhraseChoice {
  final bool isLoneMiSina;

  TokiSubject(List<TokiContentPhrase> choices, [this.isLoneMiSina = false])
      : super(choices);

  TokiSubject.fromContentPhraseChoice(
      TokiContentPhraseChoice contentPhraseChoice)
      : isLoneMiSina = false,
        super(contentPhraseChoice.choices);

  @override
  String toString() =>
      'TokiSubject(choices: $choices, isLoneMiSina: $isLoneMiSina)';
}
