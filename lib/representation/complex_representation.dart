import 'represent.dart';

class ComplexRepresentation implements Representation {
  @override
  final List<Representation> baseRepresentations;

  @override
  final String? punctuation;

  @override
  Never get text =>
      throw UnsupportedError('Cannot get text from CombinedRepresentation');

  @override
  Never get color =>
      throw UnsupportedError('Cannot get color from CombinedRepresentation');

  @override
  final String? description;

  const ComplexRepresentation(
      {required this.baseRepresentations, this.punctuation, this.description});

  @override
  ComplexRepresentation withPunctuation(String punctuation) =>
      ComplexRepresentation(
          baseRepresentations: baseRepresentations,
          punctuation: punctuation,
          description: description);

  @override
  ComplexRepresentation withDescription(String description) =>
      ComplexRepresentation(
          baseRepresentations: baseRepresentations,
          punctuation: punctuation,
          description: description);

  @override
  String toString() =>
      '$description(baseReps: $baseRepresentations, punctuation: $punctuation)';
}
