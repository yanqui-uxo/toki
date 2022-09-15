import '../representation/complex_representation.dart';
import '../representation/represent.dart';
import 'content_phrase_choice.dart';
import 'context_phrase.dart';
import 'word.dart';

class PrepPhrase implements ContextPhrase {
  final Word prep;
  final ContentPhraseChoice object;

  const PrepPhrase(this.prep, this.object);

  @override
  String toString() {
    return 'PrepPhrase(prep: $prep, object: $object)';
  }

  @override
  ComplexRepresentation toRepresentation() =>
      ComplexRepresentation(baseRepresentations: [
        Representation.wrap(
            baseRepresentation: prep.toRepresentation(),
            description: const Description('preposition')),
        Representation.wrap(
            baseRepresentation: object.toRepresentation(),
            description: const Description('prepositional object'))
      ], description: const Description('prepositional phrase'));
}
