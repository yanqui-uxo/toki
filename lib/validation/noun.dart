class Noun {
  final String word;
  final bool hasPlural;

  final String? irregularPluralForm;
  String get plural {
    if (irregularPluralForm != null) {
      return irregularPluralForm!;
    }

    var ret = word;

    if (!word.endsWith('e')) {
      ret += 'e';
    }

    return '${ret}s';
  }

  const Noun(this.word, {this.hasPlural = true, this.irregularPluralForm});
}
