import 'noun.dart';
import 'regular_english_word.dart';

class RegularNoun implements Noun, RegularEnglishWord {
  @override
  final String rootWord;

  @override
  final bool hasPluralForm;

  final String? irregularPluralForm;

  String get _pluralForm {
    if (!hasPluralForm) {
      throw UnsupportedError('No plural form');
    }

    if (irregularPluralForm != null) {
      return irregularPluralForm!;
    }

    var ret = rootWord;

    if (rootWord.endsWith('s')) {
      ret += 'e';
    }

    return '${ret}s';
  }

  @override
  String nominativeForm(bool plural) => plural ? _pluralForm : rootWord;

  @override
  String accusativeForm(bool plural) => nominativeForm(plural);

  const RegularNoun.plural(this.rootWord, {this.irregularPluralForm})
      : hasPluralForm = true;

  const RegularNoun.nonPlural(this.rootWord)
      : irregularPluralForm = null,
        hasPluralForm = false;
}
