import 'choice.dart';
import 'content_phrase_choice.dart';
import 'verb.dart';

class VerbChoice extends Choice<Verb> {
  @override
  final List<Verb> choices;

  VerbChoice(ContentPhraseChoice phraseChoices)
      : choices = phraseChoices.choices.map(Verb.new).toList();
}
