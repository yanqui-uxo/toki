import 'representation/basic_representation.dart';
import 'representation/complex_representation.dart';
import 'toki_content_phrase_choice.dart';
import 'toki_context_phrase.dart';
import 'toki_word.dart';

class TokiPrepPhrase implements TokiContextPhrase {
  final TokiWord prep;
  final TokiContentPhraseChoice object;

  const TokiPrepPhrase(this.prep, this.object);

  @override
  String toString() {
    return "PrepPhrase(prep: $prep, object: $object)";
  }

  @override
  ComplexRepresentation toRepresentation() => ComplexRepresentation(baseReps: [
        BasicRepresentation.fromRep(
            rep: prep.toRepresentation(), description: 'preposition'),
        ComplexRepresentation.wrap(
            baseRep: object.toRepresentation(),
            description: 'prepositional object')
      ]);
}
