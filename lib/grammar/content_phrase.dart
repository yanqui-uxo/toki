import 'package:intersperse/intersperse.dart';

import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import '../translation/english_phraseable.dart';
import 'content_group.dart';
import 'context_phrase.dart';

class ContentPhrase implements ContextPhrase, BasicEnglishPhraseable {
  final List<ContentGroup> contentGroups;

  ContentPhrase(this.contentGroups) {
    if (contentGroups.isEmpty) {
      throw ArgumentError('contentGroups cannot be empty');
    }
  }

  @override
  String toString() => 'ContentPhrase(contentGroups: $contentGroups)';

  @override
  Representation toRepresentation() {
    List<Representation> reps = contentGroups.toRepresentationList();
    reps = reps
        .intersperse(const BasicRepresentation(
            text: 'pi', description: Description('modifier regrouper')))
        .toList();

    return Representation(baseRepresentations: reps);
  }
}
