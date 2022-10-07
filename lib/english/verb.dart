import 'regular_english_word.dart';
import 'regular_noun.dart';

enum Transitivity { transitive, intransitive, either }

enum VerbSubject { firstPerson, singular, plural }

class Verb implements RegularEnglishWord {
  final String infinitive;

  @override
  String get rootWord => infinitive;

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

  String randomForm(VerbSubject subject) {
    // TODO: add more forms
    final infForm =
        subject == VerbSubject.singular ? '${infinitive}es' : infinitive;

    return infForm;
  }

  RegularNoun get gerund {
    return RegularNoun.plural('${_clipE(infinitive)}ing');
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
