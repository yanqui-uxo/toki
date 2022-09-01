import 'toki_content_phrase.dart';
import 'toki_word.dart';

class TokiPrepPhrase {
  final TokiWord prep;
  final TokiContentPhrase object;

  const TokiPrepPhrase(this.prep, this.object);

  @override
  String toString() {
    return "PrepPhrase(prep: $prep, object: $object)";
  }
}
