import 'represent.dart';

class ComplexRepresentation implements Representation {
  @override
  final List<Representation> baseReps;

  @override
  Never get text =>
      throw UnsupportedError("Cannot get text from CombinedRepresentation");

  @override
  Never get color =>
      throw UnsupportedError("Cannot get color from CombinedRepresentation");

  @override
  final String? description;

  const ComplexRepresentation({required this.baseReps, this.description});
  ComplexRepresentation.wrap(
      {required Representation baseRep, String? description})
      : this(baseReps: [baseRep], description: description);

  @override
  String toString() =>
      'ComplexRepresentation(baseReps: $baseReps, description: $description)';
}