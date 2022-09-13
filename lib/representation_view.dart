import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

import 'representation/represent.dart';

class RepresentationView extends StatelessWidget {
  final Representation representation;
  final bool firstPass;

  const RepresentationView(this.representation,
      {this.firstPass = true, Key? key})
      : super(key: key);

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
    if (representation.baseRepresentations.isEmpty) {
      final textStyle = TextStyle(color: representation.color, fontSize: 50);
      final descriptionStyle = TextStyle(color: representation.color);

      if (representation.description != null) {
        return IntrinsicWidth(
            child: Column(children: [
          Text(representation.text, style: textStyle, key: key),
          Text(representation.description!, style: descriptionStyle)
        ]));
      } else {
        return Text(representation.text, style: textStyle);
      }
    } else {
      List<Widget> recursed = representation.baseRepresentations
          .map((x) => RepresentationView(x, firstPass: false))
          .toList();

      final recursedRow = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: recursed
              .intersperse(const Text(' ', style: TextStyle(fontSize: 50)))
              .toList());
      if (representation.description != null) {
        return IntrinsicWidth(
            child: Column(
                children: [recursedRow, Text(representation.description!)]));
      } else {
        return recursedRow;
      }
    }
  }
}
