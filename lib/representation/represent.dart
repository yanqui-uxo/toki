import 'package:flutter/material.dart' show Color;

import 'complex_representation.dart';

abstract class Representation {
  List<Representation> get baseRepresentations;
  String get text;
  String? get description;
  Color get color;

  factory Representation(
      {required List<Representation> baseRepresentations,
      String? description}) {
    if (baseRepresentations.length == 1) {
      if (description == null) {
        return baseRepresentations[0];
      } else {
        return baseRepresentations[0].withDescription(description);
      }
    } else {
      return ComplexRepresentation(
          baseRepresentations: baseRepresentations, description: description);
    }
  }

  factory Representation.wrap(
      {required Representation baseRepresentation,
      required String description}) {
    if (baseRepresentation.description == null) {
      return baseRepresentation.withDescription(description);
    } else {
      return ComplexRepresentation(
          baseRepresentations: [baseRepresentation], description: description);
    }
  }

  Representation withDescription(String description);
}

abstract class Representable {
  Representation toRepresentation();
}

extension ToRepresentationList on List<Representable> {
  List<Representation> toRepresentationList() =>
      map((x) => x.toRepresentation()).toList();
}
