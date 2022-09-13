import 'package:intersperse/intersperse.dart';

import '../representation/particle_representation.dart';
import '../representation/represent.dart';
import 'content_phrase_choice.dart';

class Subjects implements Representable {
  final List<ContentPhraseChoice> _subjects;
  List<ContentPhraseChoice> get subjects => List.unmodifiable(_subjects);

  final bool isLoneMiSina;

  const Subjects(this._subjects, [this.isLoneMiSina = false]);

  @override
  Representation toRepresentation() => Representation(
      baseRepresentations: _subjects
          .toRepresentationList()
          .map((x) => x.withDescription('subject'))
          .intersperse(const ParticleRepresentation('en'))
          .toList(),
      description: 'subjects');

  @override
  String toString() =>
      'Subjects(subjects: $_subjects, isLoneMiSina: $isLoneMiSina)';
}
