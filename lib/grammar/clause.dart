import 'package:intersperse/intersperse.dart';

import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import 'context_phrase.dart';
import 'predicate.dart';
import 'subjects.dart';

class Clause implements ContextPhrase {
  final PredicateType type;
  final bool tasoAtStart;
  final Subjects subjects;
  final List<Predicate> predicates;

  const Clause(
      {required this.type,
      this.tasoAtStart = false,
      required this.subjects,
      required this.predicates});

  @override
  Representation toRepresentation() {
    List<Representation> predicateRepresentations = predicates
        .toRepresentationList()
        .intersperseOuter(BasicRepresentation(
            text: type.name,
            description: const Description('predicate marker')))
        .toList();
    predicateRepresentations.removeLast();

    if (subjects.isLoneMiSina && type == PredicateType.li) {
      predicateRepresentations.removeAt(0); // remove first li
    }

    return Representation(baseRepresentations: [
      if (tasoAtStart)
        const BasicRepresentation(
            text: 'taso', description: Description('but')),
      subjects.toRepresentation(),
      ...predicateRepresentations
    ], description: const Description('clause'));
  }

  @override
  String toString() => 'Clause(type: ${type.name}, subjects: $subjects, '
      'predicates: $predicates)';
}
