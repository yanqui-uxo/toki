import 'represent.dart';

class BasicRepresentation implements Representation {
  @override
  final List<Representation> baseRepresentations = const [];

  @override
  final String text;

  @override
  final String? punctuation;

  @override
  final Description? description;

  const BasicRepresentation(
      {required this.text, this.punctuation, this.description});

  BasicRepresentation.fromRep(
      {required BasicRepresentation rep, Description? description})
      : text = rep.text,
        punctuation = rep.punctuation,
        description = description ?? rep.description;

  @override
  BasicRepresentation withPunctuation(String punctuation) =>
      BasicRepresentation(
          text: text, punctuation: punctuation, description: description);

  @override
  BasicRepresentation withDescription(Description description) =>
      BasicRepresentation(
          text: text, punctuation: punctuation, description: description);

  @override
  String toString() => '$description(text: $text, punctuation: $punctuation)';
}
