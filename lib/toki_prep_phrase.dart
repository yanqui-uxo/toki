import 'toki_predicate.dart';
import 'toki_word.dart';

class TokiPrepPhrase {
  final TokiWord prep;
  final ContentPhrase object;

  const TokiPrepPhrase(this.prep, this.object);

  @override
  String toString() {
    return "PrepPhrase(prep: $prep, object: $object)";
  }
}
