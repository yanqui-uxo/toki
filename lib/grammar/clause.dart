import 'package:intersperse/intersperse.dart';

import '../representation/particle_representation.dart';
import '../representation/represent.dart';
import 'context_phrase.dart';
import 'predicate.dart';
import 'subject.dart';

class Clause implements ContextPhrase {
  final PredicateType type;
  final List<Subject> subjects;
  final bool loneMiSinaSubject;
  final List<Predicate> predicates;

  const Clause(
      {required this.type,
      required this.subjects,
      this.loneMiSinaSubject = false,
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

    return Representation(
        baseRepresentations: subjects
                .toRepresentationList()
                .map((x) => x.withDescription('subject'))
                .toList() +
            predicateRepresentations,
        description: 'clause');
  }
}
