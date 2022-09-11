import 'representation/basic_representation.dart';
import 'representation/complex_representation.dart';
import 'representation/represent.dart';
import 'toki_content_phrase.dart';
import 'toki_content_phrase_choice.dart';
import 'toki_prep_phrase.dart';
import 'toki_word.dart';

enum PredicateType { li, o }

class TokiPredicate implements Representable {
  final List<TokiWord> preverbs;
  final TokiContentPhraseChoice? verb;
  final List<TokiContentPhraseChoice> objects;
  final List<TokiPrepPhrase> prepPhrases;

  const TokiPredicate(
      {this.preverbs = const [],
      this.verb,
      this.objects = const [],
      this.prepPhrases = const []});

  @override
  String toString() {
    return "Predicate(preverbs: $preverbs, verb: $verb, objects: $objects, prep phrases: $prepPhrases)";
  }

  @override
  Representation toRepresentation() {
    List<Representation> reps = [];

    if (preverbs.isNotEmpty) {
      reps.add(ComplexRepresentation(
          baseReps: preverbs.toRepresentationList(), description: 'preverbs'));
    }

    if (verb != null) {
      reps.add(ComplexRepresentation.wrap(
          baseRep: verb!.toRepresentation(), description: 'verb'));
    }

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
