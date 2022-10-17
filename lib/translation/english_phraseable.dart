import '../english/verb.dart';
import 'utility.dart';

class EnglishPhrase<T> {
  final T main;
  final Iterable<String> modifiers;

  const EnglishPhrase(this.main, this.modifiers);
}

abstract class BasicEnglishPhraseable {
  EnglishPhrase<PluralString> randomNounPhrase(NounType type);
  EnglishPhrase<String> randomAdjectivePhrase(bool plural);
  EnglishPhrase<String> randomVerbPhrase(VerbSubject subject);
}

abstract class EnglishPhraseable implements BasicEnglishPhraseable {
  EnglishPhrase<String> randomAdverbPhrase();
}
