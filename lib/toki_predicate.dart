import 'package:intersperse/intersperse.dart';

import 'representation/particle_representation.dart';
import 'representation/represent.dart';
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
      reps.add(Representation(
          baseRepresentations: preverbs.toRepresentationList(),
          description: 'preverbs'));
    }

    if (verb != null) {
      reps.add(Representation.wrap(
          baseRepresentation: verb!.toRepresentation(), description: 'verb'));
    }

    if (objects.isNotEmpty) {
      List<Representation> baseRepresentations = objects
          .toRepresentationList()
          .map((x) => x.withDescription('object'))
          .intersperseOuter(const ParticleRepresentation('e'))
          .toList();
      baseRepresentations =
          baseRepresentations.sublist(0, baseRepresentations.length - 1);

      reps.add(Representation(baseRepresentations: baseRepresentations));
    }

    if (prepPhrases.isNotEmpty) {
      reps.add(Representation(
          baseRepresentations: prepPhrases.toRepresentationList(),
          description: 'prepositional phrases'));
    }

    return Representation(baseRepresentations: reps, description: 'predicate');
  }
}
