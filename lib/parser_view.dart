import 'package:flutter/material.dart';
import 'package:petitparser/petitparser.dart';

import 'representation/represent.dart';
import 'representation_view.dart';

class ParserView extends StatefulWidget {
  final Parser parser;

  const ParserView(this.parser, {Key? key}) : super(key: key);

  @override
  State<ParserView> createState() => _ParserViewState();
}

class _ParserViewState extends State<ParserView> {
  List<Representable>? value;
  String text = '';

  void _parse(String x) {
    var result = widget.parser.parse(x);

    if (result.isSuccess) {
      value = result.value;
      text = '$value\n\n${value!.toRepresentationList()}\n';
    } else {
      value = null;
      text = '${result.toPositionString()}, ${result.message}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
          onChanged: (x) => setState(() {
                _parse(x.replaceAll(RegExp(r'(?<=\w),(?= )'), ''));
              })),
      if (value != null)
        FittedBox(
            child: RepresentationView(Representation(
                baseRepresentations: value!.toRepresentationList())))
    ]);
  }
}
