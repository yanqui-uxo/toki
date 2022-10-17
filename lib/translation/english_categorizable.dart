import '../english/verb.dart';
import 'utility.dart';

abstract class EnglishCategorizable {
  PluralString randomNounString(NounType type);
  String randomAdjectiveString(bool plural);
  String randomVerbString(VerbSubject subject);
  String randomAdverbString();
}
