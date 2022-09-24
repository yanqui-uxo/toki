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

  const Verb.transitive(this.infinitive,
      {this.endAddition, this.transitiveAttachment})
      : transitivity = Transitivity.transitive;

  const Verb.intransitive(this.infinitive, {this.endAddition})
      : transitiveAttachment = null,
        transitivity = Transitivity.intransitive;

  const Verb.either(this.infinitive,
      {this.endAddition, this.transitiveAttachment})
      : transitivity = Transitivity.either;
}
