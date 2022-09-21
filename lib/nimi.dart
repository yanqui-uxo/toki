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

const Map<String, Set<Pronoun>> pronouns = {
  'mi': {Pronoun('I', 'me', 'my')},
  'sina': {Pronoun('you', 'you', 'your')},
  'ona': {
    Pronoun('it', 'it', 'its'),
    Pronoun('he', 'him', 'his'),
    Pronoun('she', 'her', 'her'),
    Pronoun('they', 'them', 'their')
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
