import 'package:flutter/material.dart';

import 'basic_representation.dart';
import 'complex_representation.dart';

class Description {
  final String text;
  final Color color;

  const Description(this.text, [this.color = Colors.black]);

  @override
  String toString() {
    return 'Description(text: $text, color: $color)';
  }
}

abstract class Representation implements Widget {
  String? get punctuation;
  Description? get description;

  Representation withPunctuation(String punctuation);
  Representation withDescription(Description description);

  factory Representation(
      {required List<Representation> baseRepresentations,
      String? punctuation,
      Description? description}) {
    if (baseRepresentations.length == 1) {
      Representation rep = baseRepresentations[0];

      if (punctuation == null && description == null) {
        return rep;
      } else {
        if (punctuation != null) {
          rep = rep.withPunctuation((rep.punctuation ?? '') + punctuation);
        }

        if (description != null) {
          rep = Representation.wrap(
              baseRepresentation: rep, description: description);
        }
      }

      return rep;
    } else if (baseRepresentations.isEmpty) {
      throw ArgumentError('baseRepresentations cannot be empty');
    } else {
      return ComplexRepresentation(
          baseRepresentations: baseRepresentations,
          punctuation: punctuation,
          description: description);
    }
  }

  factory Representation.wrap(
      {required Representation baseRepresentation,
      required Description description}) {
    if (baseRepresentation.description == null) {
      return baseRepresentation.withDescription(description);
    } else {
      return ComplexRepresentation(
          baseRepresentations: [baseRepresentation],
          punctuation: baseRepresentation.punctuation,
          description: description);
    }
  }
}

abstract class Representable {
  Representation toRepresentation();
}

extension ToRepresentationList on List<Representable> {
  List<Representation> toRepresentationList() =>
      map((x) => x.toRepresentation()).toList();
}

BasicRepresentation aRepresentation = const BasicRepresentation(
    text: 'a', description: Description('emotion marker'));

class Highlighter extends StatelessWidget {
  final Color color;

  const Highlighter({this.color = Colors.black, super.key});

  @override
  Widget build(BuildContext context) {
    final side = BorderSide(color: color, width: 3);
    final border = Border(left: side, right: side, bottom: side);
    return Container(height: 10, decoration: BoxDecoration(border: border));
  }
}

const Color defaultColor = Colors.black;
const double fontSize = 50;
