import 'represent.dart';

class ComplexRepresentation implements Representation {
  @override
  final List<Representation> baseRepresentations;

  @override
  final String? punctuation;

  @override
  final Description? description;

  @override
  Never get text =>
      throw UnsupportedError('Cannot get text from ComplexRepresentation');

  ComplexRepresentation(
      {required this.baseRepresentations, this.punctuation, this.description}) {
    if (baseRepresentations.isEmpty) {
      throw ArgumentError('baseRepresentations cannot be empty');
    }
  }

  @override
  ComplexRepresentation withPunctuation(String punctuation) =>
      ComplexRepresentation(
          baseRepresentations: baseRepresentations,
          punctuation: punctuation,
          description: description);

  @override
  ComplexRepresentation withDescription(Description description) =>
      ComplexRepresentation(
        baseRepresentations: baseRepresentations,
        punctuation: punctuation,
        description: description,
      );

  @override
  String toString() =>
      '$description(baseReps: $baseRepresentations, punctuation: $punctuation)';
}
