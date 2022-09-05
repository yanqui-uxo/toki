import 'package:flutter/material.dart' show Color, Colors;

enum GrammarType {
  subject(color: Colors.blue, description: 'subject'),
  verb(color: Colors.red, description: 'verb'),
  object(color: Colors.green, description: 'object');

  const GrammarType({this.color = Colors.black, required this.description});

  final Color color;
  final String description;
}
