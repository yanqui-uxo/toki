import 'package:intersperse/intersperse.dart';

import 'representation/basic_representation.dart';
import 'representation/complex_representation.dart';
import 'representation/represent.dart';
import 'toki_context_phrase.dart';
import 'toki_word.dart';

typedef ContentList = List<List<TokiWord>>;

class TokiContentPhrase implements TokiContextPhrase {
  final List<List<TokiWord>> contentGroups;
  const TokiContentPhrase(this.contentGroups);

  @override
  String toString() {
    return contentGroups.toString();
  }

  @override
  Representation get representation {
    List<Representation> reps = contentGroups
        .map((x) => ComplexRepresentation(baseReps: x.toRepresentationList()))
        .toList();
    reps = reps
        .intersperse(
            const BasicRepresentation(text: 'pi', description: 'particle'))
        .toList();
    return ComplexRepresentation(baseReps: reps);
  }
}
