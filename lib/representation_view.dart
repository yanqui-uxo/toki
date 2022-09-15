import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

import 'representation/represent.dart';

class _Highlighter extends StatelessWidget {
  final Color color;

  const _Highlighter([this.color = Colors.black]);

  @override
  Widget build(BuildContext build) {
    final side = BorderSide(color: color, width: 3);
    final border = Border(left: side, right: side, bottom: side);
    return Container(height: 10, decoration: BoxDecoration(border: border));
  }
}

class RepresentationView extends StatelessWidget {
  final Representation representation;

  const RepresentationView(this.representation, {Key? key}) : super(key: key);

  // TODO: refactor
  @override
  Widget build(BuildContext context) {
    const double fontSize = 50;

    final Color color = representation.description?.color ?? Colors.black;

    if (representation.baseRepresentations.isEmpty) {
      final textStyle = TextStyle(color: color, fontSize: fontSize);
      final descriptionStyle = TextStyle(color: color);

      Widget ret;

      if (representation.description != null) {
        ret = IntrinsicWidth(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Center(
                  child: Text(representation.text, style: textStyle, key: key)),
              _Highlighter(representation.description!.color),
              Center(
                  child: Text(representation.description!.text,
                      style: descriptionStyle))
            ]));
      } else {
        ret = Text(representation.text, style: textStyle);
      }

      if (representation.punctuation != null) {
        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ret,
          Text(representation.punctuation!,
              style: const TextStyle(fontSize: fontSize))
        ]);
      } else {
        return ret;
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Center(child: recursedRow),
              _Highlighter(color),
              Center(child: Text(representation.description!.text))
            ]));
      } else {
        return recursedRow;
      }
    }
  }
}
