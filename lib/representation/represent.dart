import 'package:flutter/material.dart' show Color;

abstract class Representation {
  List<Representation> get baseReps;
  String get text;
  String? get description;
  Color get color;
}

abstract class Representable {
  Representation toRepresentation();
}

extension ToRepresentationList on List<Representable> {
  List<Representation> toRepresentationList() =>
      map((x) => x.toRepresentation()).toList();
}
