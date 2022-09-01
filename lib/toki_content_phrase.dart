import 'toki_context_phrase.dart';
import 'toki_word.dart';

typedef ContentList = List<List<TokiWord>>;

class TokiContentPhrase implements TokiContextPhrase {
  final List<List<TokiWord>> contentGroups;
  const TokiContentPhrase(this.contentGroups);

  @override
  String toString() {
    return contentGroups.toString();
  }
}
