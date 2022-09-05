import 'toki_content_phrase.dart';
import 'toki_prep_phrase.dart';
import 'toki_word.dart';

enum PredicateType { li, o }

class TokiPredicate {
  final List<TokiWord> preverbs;
  final TokiContentPhrase verb;
  final List<TokiContentPhrase> objects;
  final List<TokiPrepPhrase> prepPhrases;

  const TokiPredicate(
      {this.preverbs = const [],
      required this.verb,
      this.objects = const [],
      this.prepPhrases = const []});

  @override
  String toString() {
    return "Predicate(preverbs: $preverbs, verb: $verb, objects: $objects, prep phrases: $prepPhrases)";
  }
}
