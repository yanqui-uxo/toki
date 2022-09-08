import 'package:flutter/material.dart' show Color, Colors;
import 'represent.dart';

class BasicRepresentation implements Representation {
  @override
  final List<Representation> baseReps = const [];

  @override
  final String text;

  @override
  final String? description;

  @override
  final Color color;

  const BasicRepresentation(
      {required this.text, this.description, this.color = Colors.black});

  BasicRepresentation.fromRep(
      {required Representation rep, String? description, Color? color})
      : text = rep.text,
        description = description ?? rep.description,
        color = color ?? rep.color;
}
