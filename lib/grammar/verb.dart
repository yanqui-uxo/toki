import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import 'content_group.dart';
import 'content_phrase.dart';
import 'toki_grammar.dart' show xAlaXPattern;

class Verb implements Representable {
  final ContentPhrase phrase;
  final String? questionedWord;

  Verb(this.phrase)
      : questionedWord =
            xAlaXPattern.matchAsPrefix(phrase.toString())?.group(1);

  @override
  Representation toRepresentation() {
    final Representation initial;
    ContentPhrase? newPhrase;

    final List<ContentGroup> restOfGroups;
    if (phrase.contentGroups.length > 1) {
      restOfGroups = phrase.contentGroups.sublist(1);
    } else {
      restOfGroups = [];
    }

    if (restOfGroups.isNotEmpty) {
      newPhrase = ContentPhrase(restOfGroups);
    } else {
      newPhrase = null;
    }

    if (questionedWord != null) {
      final groups = phrase.contentGroups;
      initial = BasicRepresentation(
          text: '$questionedWord ala $questionedWord',
          description: Description('questioning $questionedWord'));

      if (groups[0].words.length > 3) {
        newPhrase = ContentPhrase(
            [ContentGroup(groups[0].words.sublist(3)), ...restOfGroups]);
      }
    } else {
      initial = phrase.contentGroups[0].toRepresentation();
    }

    return Representation(baseRepresentations: [
      initial,
      if (newPhrase != null) ...[piRepresentation, newPhrase.toRepresentation()]
    ], description: const Description('verb'));
  }
}
