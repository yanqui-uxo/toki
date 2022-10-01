import 'regular_english_word.dart';

class Adjective implements RegularEnglishWord {
  @override
  final String rootWord;

  final String? irregularPluralForm;

  final String? irregularAdverb;
  String get adverb => irregularAdverb ?? '${rootWord}ly';

  const Adjective(this.rootWord,
      {this.irregularPluralForm, this.irregularAdverb});
}
