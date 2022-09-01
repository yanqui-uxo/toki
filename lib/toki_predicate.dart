import 'toki_content_phrase.dart';
import 'toki_prep_phrase.dart';

enum PredicateType { li, o }

class TokiPredicate {
  final TokiContentPhrase verb;
  final List<TokiContentPhrase> objects;
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
