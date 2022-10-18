import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'represent.dart';

class ComplexRepresentation extends StatelessWidget implements Representation {
  final List<Representation> baseRepresentations;

  @override
  final String? punctuation;

  @override
  final Description? description;

  ComplexRepresentation(
      {required this.baseRepresentations,
      this.punctuation,
      this.description,
      Key? key})
      : super(key: key) {
    if (baseRepresentations.isEmpty) {
      throw ArgumentError('baseRepresentations cannot be empty');
    }
  }

  @override
  ComplexRepresentation withPunctuation(String punctuation) =>
      ComplexRepresentation(
          baseRepresentations: baseRepresentations,
          punctuation: punctuation,
          description: description);

  @override
  ComplexRepresentation withDescription(Description description) =>
      ComplexRepresentation(
        baseRepresentations: baseRepresentations,
        punctuation: punctuation,
        description: description,
      );

  @override
  Widget build(BuildContext context) {
    final color = description?.color ?? defaultColor;

    List<Widget> recursed = List<Widget>.of(baseRepresentations)
        .intersperse(const Text(' ', style: TextStyle(fontSize: fontSize)))
        .toList();

    if (punctuation != null) {
      recursed
          .add(Text(punctuation!, style: const TextStyle(fontSize: fontSize)));
    }

    final recursedRow =
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: recursed);

    if (description != null) {
      return IntrinsicWidth(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Center(child: recursedRow),
        Highlighter(color: color),
        Center(child: Text(description!.text))
      ]));
    } else {
      return recursedRow;
    }
  }
}
