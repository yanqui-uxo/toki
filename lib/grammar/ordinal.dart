import '../data/nimi.dart';
import '../english/verb.dart';
import '../representation/basic_representation.dart';
import '../representation/complex_representation.dart';
import '../representation/represent.dart';
import '../translation/grammar_category_exception.dart';
import '../translation/utility.dart';
import 'wordinal.dart';

class Ordinal implements Wordinal {
  @override
  final bool aAttached;

  final List<String> numberStrings;
  String get numberStringsJoined => numberStrings.join(' ');

  int get number =>
      numberStrings.map((x) => numbers[x]!).reduce((x, y) => x + y);

  String get numberString => '#$number';

  Ordinal(this.numberStrings, [this.aAttached = false]);

  @override
  PluralString randomNounString(NounType type) =>
      throw GrammarCategoryException();

  @override
  String randomAdjectiveString(bool plural) => numberString;

  @override
  String randomVerbString(VerbSubject subject) => numberString;

  @override
  String randomAdverbString() => numberString;

  @override
  Representation toRepresentation() {
    final rep = BasicRepresentation(
        text: 'nanpa $numberStringsJoined',
        description: const Description('ordinal'));

    if (aAttached) {
      return ComplexRepresentation(baseRepresentations: [rep, aRepresentation]);
    } else {
      return rep;
    }
  }

  @override
  String toString() => ['nanpa', ...numberStrings].join(' ');
}
