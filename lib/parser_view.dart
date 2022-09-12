import 'package:flutter/material.dart';
import 'package:petitparser/petitparser.dart';

import 'representation/represent.dart';

class ParserView extends StatefulWidget {
  final Parser parser;

  const ParserView(this.parser, {Key? key}) : super(key: key);

  @override
  State<ParserView> createState() => _ParserViewState();
}

class _ParserViewState extends State<ParserView> {
  String text = '';

  void _parse(String x) {
    var result = widget.parser.parse(x);

    if (result.isSuccess) {
      List<Representable> value = result.value;
      text = '$value\n\n${value.toRepresentationList()}';
    } else {
      text = '${result.toPositionString()}, ${result.message}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
          onChanged: (x) => setState(() {
                _parse(x);
              })),
      Text(text)
    ]);
  }
}
