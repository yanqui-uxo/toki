import 'package:flutter/material.dart';
import 'toki_grammar.dart';
import 'toki_parser_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(fontSize: 50);
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('toki!')),
            body: Column(children: [
              TokiParserView(TokiGrammar().build()),
              Row(children: [
                Text('testing ', style: style),
                Text('one two', style: style),
                Text(' three', style: style)
              ])
            ])));
  }
}
