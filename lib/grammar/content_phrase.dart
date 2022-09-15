import 'package:intersperse/intersperse.dart';

import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import 'context_phrase.dart';
import 'word.dart';

typedef ContentList = List<List<Word>>;

class ContentPhrase implements ContextPhrase {
  final List<List<Word>> contentGroups;

  const ContentPhrase(this.contentGroups);

  @override
  String toString() =>
      'ContentPhrase(contentGroups: ${contentGroups.toString()})';

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
