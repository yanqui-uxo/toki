import 'package:flutter/material.dart' show Color, Colors;
import 'represent.dart';

class BasicRepresentation implements Representation {
  @override
  final List<Representation> baseRepresentations = const [];

  @override
  final String text;

  @override
  final String? punctuation;

  @override
  final String? description;

  @override
  final Color color;

  const BasicRepresentation(
      {required this.text,
      this.punctuation,
      this.description,
      this.color = Colors.black});

  BasicRepresentation.fromRep(
      {required BasicRepresentation rep, String? description, Color? color})
      : text = rep.text,
        punctuation = rep.punctuation,
        description = description ?? rep.description,
        color = color ?? rep.color;

  @override
  BasicRepresentation withPunctuation(String punctuation) =>
      BasicRepresentation(
          text: text,
          punctuation: punctuation,
          description: description,
          color: color);

  @override
  BasicRepresentation withDescription(String description) =>
      BasicRepresentation(
          text: text,
          punctuation: punctuation,
          description: description,
          color: color);

  @override
  String toString() =>
      '$description(text: $text, punctuation: $punctuation, color: $color)';
}
