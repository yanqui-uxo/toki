import '../english/verb.dart';
import '../representation/represent.dart';
import '../translation/english_phraseable.dart';
import '../translation/utility.dart';
import 'wordinal.dart';

class ContentGroup implements EnglishPhraseable, Representable {
  final List<Wordinal> words;

  ContentGroup(this.words) {
    if (words.isEmpty) {
      throw ArgumentError('words cannot be empty');
    }
  }

  @override
  Representation toRepresentation() =>
      Representation(baseRepresentations: words.toRepresentationList());

  Iterable<Wordinal> get _modifiers {
    if (words.length == 1) {
      return const Iterable.empty();
    } else {
      return words.sublist(1).reversed;
    }
  }

  @override
  EnglishPhrase<PluralString> randomNounPhrase(NounType type) {
    final mainWord = words[0].randomNounString(type);
    return EnglishPhrase(mainWord,
        _modifiers.map((x) => x.randomAdjectiveString(mainWord.isPlural)));
  }

  @override
  EnglishPhrase<String> randomAdjectivePhrase(bool plural) => EnglishPhrase(
      words[0].randomAdjectiveString(plural),
      _modifiers.map((x) => x.randomAdverbString()));

  @override
  EnglishPhrase<String> randomVerbPhrase(VerbSubject subject) => EnglishPhrase(
      words[0].randomVerbString(subject),
      _modifiers.map((x) => x.randomAdverbString()));

  @override
  EnglishPhrase<String> randomAdverbPhrase() => EnglishPhrase(
      words[0].randomAdverbString(),
      _modifiers.map((x) => x.randomAdverbString()));

  ContentGroup operator +(ContentGroup other) =>
      ContentGroup(words + other.words);
}
