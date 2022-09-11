import 'representation/complex_representation.dart';
import 'representation/represent.dart';
import 'toki_content_phrase_choice.dart';
import 'toki_context_phrase.dart';
import 'toki_predicate.dart';

class TokiClause implements TokiContextPhrase {
  final PredicateType type;
  final List<TokiContentPhraseChoice> subjects;
  final List<TokiPredicate> predicates;

  const TokiClause(
      {required this.type, required this.subjects, required this.predicates});

  @override
  String toString() =>
      'Clause(type: ${type.name}, subjects: $subjects, predicates: $predicates)';

  // TODO: add proper particles
  @override
  Representation toRepresentation() => ComplexRepresentation(
      baseReps:
          subjects.toRepresentationList() + predicates.toRepresentationList());
}
