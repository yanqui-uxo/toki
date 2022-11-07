import 'package:intersperse/intersperse.dart';

import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import 'content_phrase_choice.dart';
import 'grammar_word.dart';
import 'prep_phrase.dart';
import 'verb_choice.dart';

enum PredicateType { li, o }

class Predicate implements Representable {
  final List<GrammarWord> preverbs;
  final VerbChoice? verbChoice;
  final List<ContentPhraseChoice> objects;
  final List<PrepPhrase> prepPhrases;

  const Predicate(
      {this.preverbs = const [],
      this.verbChoice,
      this.objects = const [],
      this.prepPhrases = const []});

  @override
  String toString() =>
      'Predicate(preverbs: $preverbs, verb: $verbChoice, objects: $objects, '
      'prep phrases: $prepPhrases)';

  @override
  Representation toRepresentation() {
    List<Representation> reps = [];

    if (preverbs.isNotEmpty) {
      reps.add(
          Representation(baseRepresentations: preverbs.toRepresentationList()));
    }

    if (verbChoice != null) {
      reps.add(verbChoice!.toRepresentation());
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
