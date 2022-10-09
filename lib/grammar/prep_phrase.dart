import '../representation/complex_representation.dart';
import '../representation/represent.dart';
import 'content_phrase_choice.dart';
import 'context_phrase.dart';
import 'grammar_word.dart';

class PrepPhrase implements ContextPhrase {
  final GrammarWord prep;
  final ContentPhraseChoice object;

  const PrepPhrase(this.prep, this.object);

  @override
  String toString() {
    return 'PrepPhrase(prep: $prep, object: $object)';
  }

  @override
  ComplexRepresentation toRepresentation() =>
      ComplexRepresentation(baseRepresentations: [
        prep.toRepresentation(),
        Representation.wrap(
            baseRepresentation: object.toRepresentation(),
            description: const Description('prepositional object'))
      ], description: const Description('prepositional phrase'));
}
