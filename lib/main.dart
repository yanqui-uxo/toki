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
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('toki!')),
            body: TokiParserView(TokiGrammar().build())));
  }
}
