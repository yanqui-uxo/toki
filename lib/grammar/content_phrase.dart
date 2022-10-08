import 'package:intersperse/intersperse.dart';

import '../english/verb.dart';
import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import '../translation/english_categorizable.dart';
import 'context_phrase.dart';
import 'word.dart';

typedef ContentGroup = List<Word>;

class ContentPhrase implements ContextPhrase, EnglishCategorizable {
  final List<ContentGroup> contentGroups;

  ContentPhrase(this.contentGroups) {
    if (contentGroups.isEmpty || contentGroups.any((x) => x.isEmpty)) {
      throw ArgumentError(
          'contentGroups cannot be empty or have empty elements');
    }
  }

  static PluralString _contentGroupRandomNoun(
      ContentGroup group, NounType type) {
    final noun = group[0].randomNounString(type);

    String adjectives = group
        .sublist(1)
        .reversed
        .map((x) => x.randomAdjectiveString(noun.isPlural))
        .join(' ');

    return PluralString('$adjectives ${noun.string}', noun.isPlural);
  }

  String _piGroups() => contentGroups
      .sublist(1)
      .reversed
      .map((x) => _contentGroupRandomNoun(x, NounType.object))
      .join(' ');

  String _addPiGroups(String s) => '${_piGroups()} $s';

  @override
  PluralString randomNounString(NounType type) {
    final noun = _contentGroupRandomNoun(contentGroups[0], type);

    return PluralString(_addPiGroups(noun.string), noun.isPlural);
  }

  @override
  String randomAdjectiveString(bool plural) {
    final adjective = contentGroups[0][0].randomAdjectiveString(plural);
    final adverbs =
        contentGroups[0].sublist(1).reversed.map((x) => x.randomAdverb());

    final adverbsStr = adverbs.join(' ');

    return _addPiGroups('$adverbsStr $adjective');
  }

  @override
  String randomVerbString(VerbSubject subject) {
    final verb = contentGroups[0][0].randomVerbString(subject);
    final adverbs =
        contentGroups[0].sublist(1).reversed.map((x) => x.randomAdverb());

    final adverbsStr = adverbs.join(' ');

    return _addPiGroups('$verb $adverbsStr');
  }

  @override
  String toString() => 'ContentPhrase(contentGroups: $contentGroups)';

  @override
  Representation toRepresentation() {
    List<Representation> reps = contentGroups
        .map((x) =>
            Representation(baseRepresentations: x.toRepresentationList()))
        .toList();
    reps = reps
        .intersperse(const BasicRepresentation(
            text: 'pi', description: Description('modifier regrouper')))
        .toList();

    return Representation(baseRepresentations: reps);
  }
}
