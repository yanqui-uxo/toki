import '../english/verb.dart';

class PluralString {
  final String string;
  final bool isPlural;

  const PluralString(this.string, this.isPlural);
}

enum NounType { subject, object }

abstract class EnglishCategorizable {
  PluralString randomNoun(NounType type);
  String randomAdjective(bool plural);
  String randomVerb(VerbSubject subject);
}
