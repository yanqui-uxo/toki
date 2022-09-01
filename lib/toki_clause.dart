import 'toki_predicate.dart';

class TokiClause {
  final PredicateType type;
  final List<ContentPhrase> subjects;
  final List<TokiPredicate> predicates;

  const TokiClause(
      {required this.type, required this.subjects, required this.predicates});

  @override
  String toString() {
    return "Clause(type: ${type.name}, subjects: $subjects, predicates: $predicates)";
  }
}
