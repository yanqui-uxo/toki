import 'toki_prep_phrase.dart';
import 'toki_word.dart';

typedef ContentPhrase = List<List<TokiWord>>;

enum PredicateType { li, o }

class TokiPredicate {
  final ContentPhrase verb;
  final List<ContentPhrase> objects;
  final List<TokiPrepPhrase> prepPhrases;

  const TokiPredicate(
      {required this.verb,
      this.objects = const [],
      this.prepPhrases = const []});

  @override
  String toString() {
    return "Predicate(verb: $verb, objects: $objects, prep phrases: $prepPhrases)";
  }
}
