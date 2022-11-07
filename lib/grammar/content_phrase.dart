import 'package:intersperse/intersperse.dart';

import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import 'content_group.dart';
import 'context_phrase.dart';

// TODO: implement BasicEnglishPhraseable
class ContentPhrase implements ContextPhrase {
  final List<ContentGroup> contentGroups;

  ContentPhrase(this.contentGroups) {
    if (contentGroups.isEmpty) {
      throw ArgumentError('contentGroups cannot be empty');
    }
  }

  @override
  Representation toRepresentation() {
    List<Representation> reps = contentGroups.toRepresentationList();
    reps = reps
        .intersperse(const BasicRepresentation(
            text: 'pi', description: Description('modifier regrouper')))
        .toList();

    return Representation(baseRepresentations: reps);
  }

  @override
  String toString() => contentGroups.map((x) => x.toString()).join(' pi ');
}
