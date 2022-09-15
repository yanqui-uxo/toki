import 'package:intersperse/intersperse.dart';

import '../representation/particle_representation.dart';
import '../representation/represent.dart';
import 'content_phrase_choice.dart';
import 'prep_phrase.dart';
import 'word.dart';

enum PredicateType { li, o }

class Predicate implements Representable {
  final List<Word> preverbs;
  final ContentPhraseChoice? verb;
  final List<ContentPhraseChoice> objects;
  final List<PrepPhrase> prepPhrases;

  const Predicate(
      {this.preverbs = const [],
      this.verb,
      this.objects = const [],
      this.prepPhrases = const []});

  @override
  String toString() =>
      'Predicate(preverbs: $preverbs, verb: $verb, objects: $objects, '
      'prep phrases: $prepPhrases)';

  @override
  Representation toRepresentation() {
    List<Representation> reps = [];

    if (preverbs.isNotEmpty) {
      reps.add(Representation(
          baseRepresentations: preverbs.toRepresentationList(),
          description: const Description('preverbs')));
    }

    if (verb != null) {
      reps.add(Representation.wrap(
          baseRepresentation: verb!.toRepresentation(),
          description: const Description('verb')));
    }

    if (objects.isNotEmpty) {
      List<Representation> baseRepresentations = objects
          .toRepresentationList()
          .map((x) => Representation.wrap(
              baseRepresentation: x, description: const Description('object')))
          .intersperseOuter(const ParticleRepresentation('e'))
          .toList();
      baseRepresentations.removeLast();

      reps.add(Representation(baseRepresentations: baseRepresentations));
    }

    if (prepPhrases.isNotEmpty) {
      reps.add(Representation(
          baseRepresentations: prepPhrases.toRepresentationList()));
    }

    return Representation(
        baseRepresentations: reps, description: const Description('predicate'));
  }
}
