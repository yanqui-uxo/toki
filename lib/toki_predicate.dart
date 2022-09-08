import 'representation/basic_representation.dart';
import 'representation/complex_representation.dart';
import 'representation/represent.dart';
import 'toki_content_phrase.dart';
import 'toki_prep_phrase.dart';
import 'toki_word.dart';

enum PredicateType { li, o }

class TokiPredicate implements Representable {
  final List<TokiWord> preverbs;
  final TokiContentPhrase verb;
  final List<TokiContentPhrase> objects;
  final List<TokiPrepPhrase> prepPhrases;

  const TokiPredicate(
      {this.preverbs = const [],
      required this.verb,
      this.objects = const [],
      this.prepPhrases = const []});

  @override
  String toString() {
    return "Predicate(preverbs: $preverbs, verb: $verb, objects: $objects, prep phrases: $prepPhrases)";
  }

  @override
  Representation get representation {
    List<Representation> reps = [];

    reps.add(ComplexRepresentation(
        baseReps: preverbs.toRepresentationList(), description: 'preverbs'));
    reps.add(BasicRepresentation.fromRep(
        rep: verb.representation, description: 'verb'));

    // TODO: add e's
    if (objects.isNotEmpty) {
      reps.add(ComplexRepresentation(
          baseReps: objects.toRepresentationList(), description: 'objects'));
    }

    if (prepPhrases.isNotEmpty) {
      reps.add(ComplexRepresentation(
          baseReps: prepPhrases.toRepresentationList(),
          description: 'prepositional phrases'));
    }

    return ComplexRepresentation(baseReps: reps, description: 'predicate');
  }
}
