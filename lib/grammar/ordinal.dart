import '../data/nimi.dart';
import '../english/verb.dart';
import '../representation/basic_representation.dart';
import '../representation/complex_representation.dart';
import '../representation/represent.dart';
import '../translation/english_categorizable.dart';
import '../translation/grammar_category_exception.dart';
import 'wordinal.dart';

class Ordinal implements Wordinal {
  @override
  final bool aAttached;

  final List<String> numberStrings;
  String get numberString => numberStrings.join(' ');

  int get number =>
      numberStrings.map((x) => numbers[x]!).reduce((x, y) => x + y);

  Ordinal(this.numberStrings, [this.aAttached = false]);

  @override
  PluralString randomNounString(NounType type) =>
      throw GrammarCategoryException();

  @override
  String randomAdjectiveString(bool plural) => '#{number}';

  @override
  String randomVerbString(VerbSubject subject) =>
      throw GrammarCategoryException();

  @override
  String randomAdverbString() => throw GrammarCategoryException();

  @override
  Representation toRepresentation() {
    final rep = BasicRepresentation(
        text: 'nanpa $numberString', description: const Description('ordinal'));

    return aAttached
        ? ComplexRepresentation(baseRepresentations: [rep, aRepresentation])
        : rep;
  }
}
