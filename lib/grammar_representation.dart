import 'package:flutter/material.dart' show Color, Colors;

class GrammarRepresentation {
  final String text;
  final String description;
  final Color color;

  const GrammarRepresentation(
      {required this.text,
      required this.description,
      this.color = Colors.black});
}
