import 'representation/basic_representation.dart';
import 'representation/complex_representation.dart';
import 'representation/represent.dart';
import 'toki_content_phrase.dart';
import 'toki_word.dart';

class TokiPrepPhrase implements Representable {
  final TokiWord prep;
  final TokiContentPhrase object;

  const TokiPrepPhrase(this.prep, this.object);

  @override
  String toString() {
    return "PrepPhrase(prep: $prep, object: $object)";
  }

  @override
  Representation get representation => ComplexRepresentation(baseReps: [
        BasicRepresentation.fromRep(
            rep: prep.representation, description: 'preposition'),
        BasicRepresentation.fromRep(
            rep: object.representation, description: 'prepositional object')
      ]);
}
