import '../representation/basic_representation.dart';
import '../representation/represent.dart';
import 'sentence_root.dart';

enum GrammarWordType { preposition, preverb }

class GrammarWord implements SentenceRoot {
  final String word;
  final GrammarWordType type;

  @override
  final bool aAttached;

  final bool alaAttached;
  final bool aAttachedToAla;

  final bool questioned;

  GrammarWord.ala(this.word, this.type,
      {this.aAttached = false,
      this.aAttachedToAla = false,
      this.questioned = false})
      : alaAttached = true;

  GrammarWord.noAla(this.word, this.type,
      {this.aAttached = false, this.questioned = false})
      : alaAttached = false,
        aAttachedToAla = false;

  @override
  Representation toRepresentation() {
    final Representation wordRep;

    if (questioned) {
      wordRep = BasicRepresentation(
          text: '$word ala $word',
          description: Description('${type.name}, questioning $word'));
    } else {
      wordRep =
          BasicRepresentation(text: word, description: Description(type.name));
    }

    List<Representation> after = [];

    if (aAttached) {
      after.add(aRepresentation);
    }

    if (alaAttached) {
      after.add(const BasicRepresentation(text: 'ala'));

      if (aAttachedToAla) {
        after.add(aRepresentation);
      }
    }

    return Representation(baseRepresentations: [
      wordRep,
      if (after.isNotEmpty) Representation(baseRepresentations: after)
    ]);
  }
}
