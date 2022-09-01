import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petitparser/reflection.dart';

import 'package:toki/main.dart';
import 'package:toki/toki_grammar.dart';

void main() {
  test('detect common problems', () {
    final definition = TokiGrammar();
    final parser = definition.build();
    expect(linter(parser), isEmpty);
  });

  runApp(const App());
}
