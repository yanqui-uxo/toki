import 'package:flutter/material.dart';
import 'represent.dart';

class BasicRepresentation extends StatelessWidget implements Representation {
  final String text;

  @override
  final String? punctuation;

  @override
  final Description? description;

  const BasicRepresentation(
      {required this.text, this.punctuation, this.description, super.key});

  @override
  BasicRepresentation withPunctuation(String punctuation) =>
      BasicRepresentation(
          text: text, punctuation: punctuation, description: description);

  @override
  BasicRepresentation withDescription(Description description) =>
      BasicRepresentation(
          text: text, punctuation: punctuation, description: description);

  @override
  Widget build(BuildContext context) {
    final color = description?.color ?? defaultColor;
    final textStyle = TextStyle(color: color, fontSize: fontSize);
    final descriptionStyle = TextStyle(color: color);

    Widget ret;

    if (description != null) {
      ret = IntrinsicWidth(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Center(child: Text(text, style: textStyle, key: key)),
        Highlighter(color: description!.color),
        Center(child: Text(description!.text, style: descriptionStyle))
      ]));
    } else {
      ret = Text(text, style: textStyle);
    }

    if (punctuation != null) {
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ret,
        Text(punctuation!, style: const TextStyle(fontSize: fontSize))
      ]);
    } else {
      return ret;
    }
  }
}
