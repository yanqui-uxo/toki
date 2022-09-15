import 'package:flutter/material.dart' show Colors;
import 'package:intersperse/intersperse.dart';

import '../representation/particle_representation.dart';
import '../representation/represent.dart';
import 'content_phrase_choice.dart';

class Subjects implements Representable {
  final List<ContentPhraseChoice> subjects;

  final bool isLoneMiSina;

  const Subjects(this.subjects, [this.isLoneMiSina = false]);

  @override
  Representation toRepresentation() => Representation(
      baseRepresentations: subjects
          .toRepresentationList()
          .map((x) => Representation.wrap(
              baseRepresentation: x,
              description: const Description('subject', Colors.blue)))
          .intersperse(const ParticleRepresentation('en'))
          .toList());

  @override
  String toString() =>
      'Subjects(subjects: $subjects, isLoneMiSina: $isLoneMiSina)';
}
