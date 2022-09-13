import 'package:flutter/material.dart';

import 'representation/represent.dart';

class RepresentationView extends StatelessWidget {
  final Representation representation;

  const RepresentationView(this.representation, {Key? key}) : super(key: key);

  static String textFromRepresentation(Representation representation) {
    if (representation.baseRepresentations.isNotEmpty) {
      return representation.baseRepresentations
          .map(textFromRepresentation)
          .join(' ');
    } else {
      return representation.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(textFromRepresentation(representation));
  }
}
