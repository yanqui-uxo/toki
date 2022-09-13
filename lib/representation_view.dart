import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

import 'representation/represent.dart';

class RepresentationView extends StatelessWidget {
  final Representation representation;

  const RepresentationView(this.representation, {Key? key}) : super(key: key);

  // TODO: refactor
  @override
  Widget build(BuildContext context) {
    const double fontSize = 50;

    if (representation.baseRepresentations.isEmpty) {
      final textStyle =
          TextStyle(color: representation.color, fontSize: fontSize);
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
          .map(RepresentationView.new)
          .toList();
      recursed = recursed
          .intersperse(const Text(' ', style: TextStyle(fontSize: fontSize)))
          .toList();

      if (representation.punctuation != null) {
        recursed.add(Text(representation.punctuation!,
            style: const TextStyle(fontSize: fontSize)));
      }

      final recursedRow =
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: recursed);

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
