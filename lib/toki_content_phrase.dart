import 'package:intersperse/intersperse.dart';

import 'representation/particle_representation.dart';
import 'representation/represent.dart';
import 'toki_context_phrase.dart';
import 'toki_word.dart';

typedef ContentList = List<List<TokiWord>>;

class TokiContentPhrase implements TokiContextPhrase {
  final List<List<TokiWord>> contentGroups;

  const TokiContentPhrase(this.contentGroups);

  @override
  String toString() =>
      'TokiContentPhrase(contentGroups: ${contentGroups.toString()})';

  @override
  Representation toRepresentation() {
    List<Representation> reps = contentGroups
        .map((x) =>
            Representation(baseRepresentations: x.toRepresentationList()))
        .toList();
    reps = reps.intersperse(const ParticleRepresentation('pi')).toList();

    return Representation(baseRepresentations: reps);
  }
}
