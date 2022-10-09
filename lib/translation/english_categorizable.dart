import '../english/verb.dart';

class PluralString {
  final String string;
  final bool isPlural;

  const PluralString(this.string, this.isPlural);
}

enum NounType { subject, object }

abstract class EnglishCategorizable {
  PluralString randomNounString(NounType type);
  String randomAdjectiveString(bool plural);
  String randomVerbString(VerbSubject subject);
  String randomAdverbString();
}
