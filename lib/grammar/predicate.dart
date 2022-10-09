import 'package:intersperse/intersperse.dart';

import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import 'content_phrase_choice.dart';
import 'grammar_word.dart';
import 'prep_phrase.dart';

enum PredicateType { li, o }

class Predicate implements Representable {
  final List<GrammarWord> preverbs;
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
      reps.add(
          Representation(baseRepresentations: preverbs.toRepresentationList()));
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
          .intersperseOuter(const BasicRepresentation(
              text: 'e', description: Description('subject marker')))
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
