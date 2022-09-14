import 'package:flutter/material.dart' show Color;

import 'complex_representation.dart';

abstract class Representation {
  List<Representation> get baseRepresentations;
  String get text;
  String? get punctuation;
  String? get description;
  Color get color;

  Representation withPunctuation(String punctuation);
  Representation withDescription(String description);

  factory Representation(
      {required List<Representation> baseRepresentations,
      String? punctuation,
      String? description}) {
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
    } else {
      return ComplexRepresentation(
          baseRepresentations: baseRepresentations,
          punctuation: punctuation,
          description: description);
    }
  }

  factory Representation.wrap(
      {required Representation baseRepresentation,
      required String description}) {
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
