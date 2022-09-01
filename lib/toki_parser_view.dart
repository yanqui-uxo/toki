import 'package:flutter/material.dart';
import 'package:petitparser/petitparser.dart';

class TokiParserView extends StatefulWidget {
  final Parser parser;

  const TokiParserView(this.parser, {Key? key}) : super(key: key);

  @override
  State<TokiParserView> createState() => _TokiParserViewState();
}

class _TokiParserViewState extends State<TokiParserView> {
  String text = "";

  void _parse(String x) {
    var result = widget.parser.parse(x);

    if (result.isSuccess) {
      text = result.value.toString();
    } else {
      text = "${result.toPositionString()}, ${result.message}";
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
