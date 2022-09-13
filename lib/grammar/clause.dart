import 'package:intersperse/intersperse.dart';

import '../representation/particle_representation.dart';
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
  String toString() => 'Clause(type: ${type.name}, subjects: $subjects, '
      'predicates: $predicates)';

  @override
  Representation toRepresentation() {
    List<Representation> predicateRepresentations = predicates
        .toRepresentationList()
        .intersperseOuter(ParticleRepresentation(type.name))
        .toList();
    predicateRepresentations.removeLast();

    if (subjects.isLoneMiSina && type == PredicateType.li) {
      predicateRepresentations.removeAt(0); // remove first li
    }

    return Representation(baseRepresentations: [
      if (tasoAtStart) const ParticleRepresentation('taso'),
      subjects.toRepresentation(),
      ...predicateRepresentations
    ], description: 'clause');
  }
}
