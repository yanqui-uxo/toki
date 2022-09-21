import 'noun.dart';

enum Transitivity { transitive, intransitive, either }

// TODO: implement verb forms
class Verb {
  final String infinitive;
  final String? endAddition;
  final String? transitiveAttachment;
  final Transitivity transitivity;

  static String _clipE(String x) {
    String ret = x;
    if (ret.endsWith('e')) {
      ret = ret.substring(0, ret.length - 1);
    }

    return ret;
  }

  Noun get gerund {
    return Noun('${_clipE(infinitive)}ing');
  }

  const Verb(this.infinitive,
      {this.endAddition,
      this.transitivity = Transitivity.either,
      this.transitiveAttachment});
}
