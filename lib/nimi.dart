import 'package:petitparser/petitparser.dart';

import 'definitions.dart';
import 'validation/pronoun.dart';

const Set<String> prepositions = {'kepeken', 'lon', 'sama', 'tan', 'tawa'};
const Set<String> preverbs = {
  'alasa',
  'awen',
  'kama',
  'ken',
  'lukin',
  'sona',
  'wile',
};

// of course you have green comments
// and pronouns
const Map<String, Set<Pronoun>> pronouns = {
  'mi': {
    Pronoun('I', 'me', 'my', Plurality.singular),
    Pronoun('we', 'us', 'our', Plurality.plural)
  },
  'sina': {Pronoun('you', 'you', 'your', Plurality.either)},
  'ona': {
    Pronoun('it', 'it', 'its', Plurality.singular),
    Pronoun('he', 'him', 'his', Plurality.singular),
    Pronoun('she', 'her', 'her', Plurality.singular),
    Pronoun('they', 'them', 'their', Plurality.either)
  }
};

// ala is a funny word and ought to be handled specially
// TODO: handle ala
final Set<String> contentWords =
    definedWords.keys.toSet().union(pronouns.keys.toSet()).union({'ala'});

Parser<String> _createWordParser() {
  var sorted = List<String>.from(contentWords);
  sorted.sort((a, b) => b.length.compareTo(a.length));
  return sorted.map(string).toChoiceParser();
}

final Parser<String> contentWord = _createWordParser();

//final Parser<String> contentWord = contentWords.map(string).toChoiceParser();
