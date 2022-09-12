import '../representation/complex_representation.dart';
import '../representation/represent.dart';
import 'toki_content_phrase_choice.dart';
import 'toki_context_phrase.dart';
import 'toki_word.dart';

class TokiPrepPhrase implements TokiContextPhrase {
  final TokiWord prep;
  final TokiContentPhraseChoice object;

  const TokiPrepPhrase(this.prep, this.object);

  @override
  String toString() {
    return 'PrepPhrase(prep: $prep, object: $object)';
  }

  @override
  ComplexRepresentation toRepresentation() =>
      ComplexRepresentation(baseRepresentations: [
        Representation.wrap(
            baseRepresentation: prep.toRepresentation(),
            description: 'preposition'),
        Representation.wrap(
            baseRepresentation: object.toRepresentation(),
            description: 'prepositional object')
      ]);
}
