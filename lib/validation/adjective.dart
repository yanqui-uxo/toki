class Adjective {
  final String word;
  final String? irregularPluralForm;
  final bool demonstrative;

  final String? irregularAdverb;
  String get adverb => irregularAdverb ?? '${word}ly';

  const Adjective(this.word,
      {this.irregularPluralForm,
      this.irregularAdverb,
      this.demonstrative = false});
}
