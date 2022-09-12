import 'package:intersperse/intersperse.dart';

import '../representation/particle_representation.dart';
import '../representation/represent.dart';
import 'toki_context_phrase.dart';
import 'toki_subject.dart';
import 'toki_predicate.dart';

class TokiClause implements TokiContextPhrase {
  final PredicateType type;
  final List<TokiSubject> subjects;
  final bool loneMiSinaSubject;
  final List<TokiPredicate> predicates;

  const TokiClause(
      {required this.type,
      required this.subjects,
      this.loneMiSinaSubject = false,
      required this.predicates});

  @override
  String toString() =>
      'Clause(type: ${type.name}, subjects: $subjects, predicates: $predicates)';

  @override
  Representation toRepresentation() {
    List<Representation> predicateRepresentations = predicates
        .toRepresentationList()
        .intersperseOuter(ParticleRepresentation(type.name))
        .toList();
    predicateRepresentations = predicateRepresentations.sublist(
        0, predicateRepresentations.length - 1);

    return Representation(
        baseRepresentations: subjects
                .toRepresentationList()
                .map((x) => x.withDescription('subject'))
                .toList() +
            predicateRepresentations,
        description: 'clause');
  }
}
