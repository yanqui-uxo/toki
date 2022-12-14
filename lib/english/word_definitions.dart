import 'adjective.dart';
import 'noun.dart';
import 'verb.dart';

class WordDefinitions {
  final Set<Noun> rootNouns;
  Set<Noun> get nouns => rootNouns.union(verbs.map((x) => x.gerund).toSet());

  final Set<Verb> verbs;

  final Set<Adjective> adjectives;

  Set<String> get adverbs => adjectives.map((x) => x.adverb).toSet();

  const WordDefinitions(
      {required this.rootNouns, required this.verbs, required this.adjectives});
}
