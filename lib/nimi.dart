import 'package:petitparser/petitparser.dart';

import 'validation/adjective.dart';
import 'validation/noun.dart';
import 'validation/pronoun.dart';
import 'validation/verb.dart';
import 'validation/word_definitions.dart';

const Map<String, WordDefinitions> definedWords = {
  'akesi': WordDefinitions(
      rootNouns: {Noun('lizard'), Noun('reptile')},
      verbs: {},
      adjectives: {Adjective('lizardlike'), Adjective('reptilian')}),
  'alasa': WordDefinitions(rootNouns: {
    Noun('hunt'),
    Noun('search')
  }, verbs: {
    Verb.either('hunt'),
    Verb.either('search'),
    Verb.either('forage')
  }, adjectives: {}),
  'ale': WordDefinitions(
      rootNouns: {Noun('everything')},
      verbs: {},
      adjectives: {Adjective('complete'), Adjective('all')}),
  'anpa': WordDefinitions(
      rootNouns: {Noun('defeat'), Noun('underneath')},
      verbs: {Verb.either('defeat'), Verb.either('lower')},
      adjectives: {Adjective('low'), Adjective('defeated')}),
  'ante': WordDefinitions(
      rootNouns: {Noun('difference')},
      verbs: {Verb.either('differentiate')},
      adjectives: {Adjective('different')}),
  'awen': WordDefinitions(rootNouns: {
    Noun('protection'),
    Noun('maintenance'),
    Noun('security')
  }, verbs: {
    Verb.either('protect'),
    Verb.either('secure'),
    Verb.either('maintain')
  }, adjectives: {
    Adjective('protected'),
    Adjective('secured'),
    Adjective('maintained')
  }),
  'esun': WordDefinitions(
      rootNouns: {Noun('exchange'), Noun('purchase')},
      verbs: {Verb.either('buy'), Verb.either('sell'), Verb.either('exchange')},
      adjectives: {}),
  'ijo': WordDefinitions(rootNouns: {
    Noun('something', hasPlural: false),
    Noun('thing', hasPlural: false),
    Noun('object')
  }, verbs: {}, adjectives: {}),
  'ike': WordDefinitions(rootNouns: {
    Noun('evil'),
    Noun('evilness'),
    Noun('badness'),
    Noun('complexity')
  }, verbs: {
    Verb.either('worsen'),
    Verb.either('complicate')
  }, adjectives: {
    Adjective('bad'),
    Adjective('evil'),
    Adjective('complex')
  }),
  'ilo': WordDefinitions(rootNouns: {Noun('tool')}, verbs: {}, adjectives: {}),
  'insa': WordDefinitions(rootNouns: {
    Noun('inside'),
    Noun('internal organ'),
    Noun('innards', hasPlural: false)
  }, verbs: {}, adjectives: {
    Adjective('inner')
  }),
  'jaki': WordDefinitions(rootNouns: {
    Noun('dirt'),
    Noun('poop'),
    Noun('disease'),
    Noun('dirtiness'),
    Noun('grossness')
  }, verbs: {
    Verb.either('dirty')
  }, adjectives: {
    Adjective('dirty'),
    Adjective('gross'),
    Adjective('diseased')
  }),
  'jan': WordDefinitions(
      rootNouns: {Noun('person'), Noun('sentient being')},
      verbs: {},
      adjectives: {Adjective('sapient')}),
  'jelo': WordDefinitions(
      rootNouns: {Noun('yellow')},
      verbs: {},
      adjectives: {Adjective('yellow')}),
  'jo': WordDefinitions(rootNouns: {}, verbs: {
    Verb.either('carry'),
    Verb.either('contain'),
    Verb.either('hold')
  }, adjectives: {}),
  'kala': WordDefinitions(
      rootNouns: {Noun('fish'), Noun('aquatic animal')},
      verbs: {},
      adjectives: {Adjective('aquatic')}),
  'kalama': WordDefinitions(rootNouns: {
    Noun('noise'),
    Noun('sound')
  }, verbs: {
    Verb.intransitive('make', endAddition: 'noise'),
    Verb.either('yell'),
    Verb.either('crash'),
    Verb.either('thump')
  }, adjectives: {}),
  'kama': WordDefinitions(
      rootNouns: {},
      verbs: {Verb.either('come'), Verb.either('arrive')},
      adjectives: {Adjective('future')}),
  'kasi':
      WordDefinitions(rootNouns: {Noun('plant')}, verbs: {}, adjectives: {}),
  'ken': WordDefinitions(
      rootNouns: {Noun('ability'), Noun('possibility')},
      verbs: {},
      adjectives: {Adjective('possible')}),
  'kepeken':
      WordDefinitions(rootNouns: {Noun('usage')}, verbs: {}, adjectives: {}),
  'kili': WordDefinitions(
      rootNouns: {Noun('fruit'), Noun('vegetable')},
      verbs: {},
      adjectives: {Adjective('fruity')}),
  'kiwen': WordDefinitions(
      rootNouns: {Noun('rock'), Noun('hard object')},
      verbs: {},
      adjectives: {Adjective('hard'), Adjective('stiff')}),
  'ko': WordDefinitions(
      rootNouns: {Noun('clay'), Noun('dough'), Noun('paste'), Noun('powder')},
      verbs: {},
      adjectives: {}),
  'kon': WordDefinitions(rootNouns: {
    Noun('air', hasPlural: false),
    Noun('unseen agent'),
    Noun('hidden reality'),
    Noun('spirit'),
    Noun('soul')
  }, verbs: {}, adjectives: {}),
  'kule': WordDefinitions(rootNouns: {
    Noun('color')
  }, verbs: {
    Verb.either('color')
  }, adjectives: {
    Adjective('colorful'),
    Adjective('gay'),
    Adjective('LGBTQ')
  }),
  'kulupu': WordDefinitions(
      rootNouns: {Noun('group'), Noun('community'), Noun('tribe')},
      verbs: {},
      adjectives: {Adjective('communal')}),
  'kute': WordDefinitions(
      rootNouns: {Noun('ear')},
      verbs: {Verb.either('hear'), Verb.either('listen'), Verb.either('obey')},
      adjectives: {}),
  'lape': WordDefinitions(
      rootNouns: {Noun('rest'), Noun('sleep')},
      verbs: {Verb.intransitive('rest'), Verb.intransitive('sleep')},
      adjectives: {}),
  'laso': WordDefinitions(
      rootNouns: {Noun('blue'), Noun('green')},
      verbs: {},
      adjectives: {Adjective('blue'), Adjective('green')}),
  'lawa': WordDefinitions(rootNouns: {
    Noun('mind'),
    Noun('brain'),
    Noun('ruler'),
    Noun('leader'),
    Noun('government'),
    Noun('authority')
  }, verbs: {
    Verb.either('control'),
    Verb.either('rule')
  }, adjectives: {}),
  'len': WordDefinitions(rootNouns: {
    Noun('clothing', hasPlural: false),
    Noun('fabric', hasPlural: false),
    Noun('privacy layer')
  }, verbs: {
    Verb.either('cover'),
    Verb.either('clothe'),
    Verb.either('hide')
  }, adjectives: {}),
  'lete': WordDefinitions(
      rootNouns: {Noun('cold')},
      verbs: {Verb.either('cool')},
      adjectives: {Adjective('cold'), Adjective('raw')}),
  'lili': WordDefinitions(rootNouns: {}, verbs: {
    Verb.either('shrink')
  }, adjectives: {
    Adjective('small'),
    Adjective('unimportant'),
    Adjective('little')
  }),
  'linja': WordDefinitions(
      rootNouns: {Noun('line'), Noun('string')},
      verbs: {},
      adjectives: {Adjective('stringy'), Adjective('thin')}),
  'lipu': WordDefinitions(rootNouns: {
    Noun('document'),
    Noun('paper'),
    Noun('flat bendable object')
  }, verbs: {
    Verb.either('flatten')
  }, adjectives: {
    Adjective('flat')
  }),
  'loje': WordDefinitions(
      rootNouns: {Noun('red')},
      verbs: {Verb.either('redden')},
      adjectives: {Adjective('red')}),
  'lon': WordDefinitions(
      rootNouns: {Noun('truth'), Noun('existence')},
      verbs: {Verb.either('summon')},
      adjectives: {Adjective('true'), Adjective('existent')}),
  'luka': WordDefinitions(
      rootNouns: {Noun('arm'), Noun('hand'), Noun('finger')},
      verbs: {},
      adjectives: {}),
  'lukin': WordDefinitions(rootNouns: {
    Noun('eye')
  }, verbs: {
    Verb.either('look'),
    Verb.either('see'),
    Verb.either('view'),
    Verb.either('read')
  }, adjectives: {}),
  'lupa': WordDefinitions(
      rootNouns: {Noun('hole'), Noun('window'), Noun('door')},
      verbs: {},
      adjectives: {}),
  'ma': WordDefinitions(
      rootNouns: {Noun('land'), Noun('soil'), Noun('country'), Noun('place')},
      verbs: {},
      adjectives: {}),
  'mama': WordDefinitions(rootNouns: {
    Noun('parent'),
    Noun('mother'),
    Noun('father'),
    Noun('creator'),
    Noun('originator')
  }, verbs: {
    Verb.either('create'),
    Verb.either('caretake'),
    Verb.either('parent'),
    Verb.either('originate')
  }, adjectives: {}),
  'mani': WordDefinitions(rootNouns: {
    Noun('money', hasPlural: false),
    Noun('currency', hasPlural: false),
    Noun('livestock', hasPlural: false)
  }, verbs: {}, adjectives: {}),
  'meli': WordDefinitions(
      rootNouns: {Noun('woman'), Noun('female'), Noun('femininity')},
      verbs: {},
      adjectives: {Adjective('female'), Adjective('feminine')}),
  'mije': WordDefinitions(
      rootNouns: {Noun('man'), Noun('male'), Noun('masculinity')},
      verbs: {},
      adjectives: {Adjective('male'), Adjective('masculine')}),
  'moku': WordDefinitions(
      rootNouns: {Noun('food'), Noun('consumable')},
      verbs: {Verb.either('eat'), Verb.either('consume')},
      adjectives: {Adjective('consumable')}),
  'moli': WordDefinitions(
      rootNouns: {Noun('death'), Noun('killing')},
      verbs: {Verb.intransitive('die'), Verb.either('kill')},
      adjectives: {Adjective('dead')}),
  'monsi': WordDefinitions(
      rootNouns: {Noun('back'), Noun('behind'), Noun('butt')},
      verbs: {},
      adjectives: {Adjective('back')}),
  'mu': WordDefinitions(rootNouns: {
    Noun('moo'),
    Noun('cheep'),
    Noun('caw'),
    Noun('chirp'),
    Noun('tweet'),
    Noun('woof'),
  }, verbs: {
    Verb.either('moo'),
    Verb.either('cheep'),
    Verb.either('caw'),
    Verb.either('chirp'),
    Verb.either('tweet'),
    Verb.either('woof')
  }, adjectives: {}),
  'mun': WordDefinitions(rootNouns: {
    Noun('moon'),
    Noun('planet'),
    Noun('comet'),
    Noun('star'),
    Noun('celestial object')
  }, verbs: {}, adjectives: {
    Adjective('celestial'),
    Adjective('cosmic'),
    Adjective('lunar')
  }),
  'musi': WordDefinitions(
      rootNouns: {Noun('game'), Noun('amusement')},
      verbs: {Verb.either('amuse')},
      adjectives: {Adjective('amusing')}),
  'mute': WordDefinitions(
      rootNouns: {Noun('amount')},
      verbs: {Verb.either('multiply')},
      adjectives: {Adjective('much', irregularPluralForm: 'many')}),
  'nanpa':
      WordDefinitions(rootNouns: {Noun('number')}, verbs: {}, adjectives: {}),
  'nasa': WordDefinitions(
      rootNouns: {Noun('strangeness'), Noun('intoxication')},
      verbs: {},
      adjectives: {Adjective('strange'), Adjective('intoxicated')}),
  'nasin': WordDefinitions(
      rootNouns: {Noun('path'), Noun('way'), Noun('method'), Noun('doctrine')},
      verbs: {},
      adjectives: {}),
  'nena': WordDefinitions(
      rootNouns: {Noun('bump'), Noun('hill'), Noun('mountain')},
      verbs: {},
      adjectives: {}),
  'ni': WordDefinitions(rootNouns: {
    Noun('this', irregularPluralForm: 'these'),
    Noun('that', irregularPluralForm: 'those')
  }, verbs: {}, adjectives: {
    Adjective('this', irregularPluralForm: 'these', demonstrative: true),
    Adjective('that', irregularPluralForm: 'those', demonstrative: true)
  }),
  'nimi': WordDefinitions(
      rootNouns: {Noun('word'), Noun('name')},
      verbs: {Verb.either('name')},
      adjectives: {}),
  'noka': WordDefinitions(
      rootNouns: {Noun('leg'), Noun('foot'), Noun('toe')},
      verbs: {},
      adjectives: {}),
  'olin': WordDefinitions(
      rootNouns: {Noun('love'), Noun('romance')},
      verbs: {Verb.either('love')},
      adjectives: {Adjective('loving')}),
  'open': WordDefinitions(
      rootNouns: {Noun('beginning'), Noun('opening')},
      verbs: {Verb.either('begin'), Verb.either('open')},
      adjectives: {}),
  'pakala': WordDefinitions(rootNouns: {
    Noun('destruction'),
    Noun('breakage'),
    Noun('harm'),
    Noun('damage')
  }, verbs: {
    Verb.either('break'),
    Verb.either('shatter'),
    Verb.either('harm'),
    Verb.either('damage'),
    Verb.either('destroy')
  }, adjectives: {
    Adjective('broken'),
    Adjective('harmed'),
    Adjective('destroyed'),
    Adjective('shattered'),
    Adjective('damaged')
  }),
  'pali': WordDefinitions(
      rootNouns: {Noun('work'), Noun('job')},
      verbs: {Verb.either('work'), Verb.either('make')},
      adjectives: {}),
  'palisa': WordDefinitions(
      rootNouns: {Noun('stick'), Noun('twig'), Noun('branch')},
      verbs: {},
      adjectives: {}),
  'pan': WordDefinitions(
      rootNouns: {Noun('bread'), Noun('grain'), Noun('rice')},
      verbs: {},
      adjectives: {}),
  'pana': WordDefinitions(
      rootNouns: {},
      verbs: {Verb.either('give'), Verb.either('emit'), Verb.either('release')},
      adjectives: {}),
  'pilin': WordDefinitions(
      rootNouns: {Noun('feeling')},
      verbs: {Verb.either('feel'), Verb.either('touch')},
      adjectives: {}),
  'pimeja': WordDefinitions(
      rootNouns: {Noun('black'), Noun('darkness', hasPlural: false)},
      verbs: {},
      adjectives: {Adjective('black'), Adjective('dark')}),
  'pini': WordDefinitions(rootNouns: {
    Noun('ending')
  }, verbs: {
    Verb.either('end'),
    Verb.either('stop')
  }, adjectives: {
    Adjective('ended'),
    Adjective('past'),
    Adjective('finished')
  }),
  'pipi': WordDefinitions(
      rootNouns: {Noun('bug'), Noun('insect'), Noun('arachnid')},
      verbs: {},
      adjectives: {}),
  'poka': WordDefinitions(
      rootNouns: {Noun('side'), Noun('vicinity')},
      verbs: {},
      adjectives: {Adjective('nearby')}),
  'poki': WordDefinitions(
      rootNouns: {Noun('container'), Noun('bowl'), Noun('cup')},
      verbs: {},
      adjectives: {}),
  'pona': WordDefinitions(rootNouns: {
    Noun('good'),
    Noun('goodness'),
    Noun('simplicity')
  }, verbs: {
    Verb.either('improve'),
    Verb.either('help'),
    Verb.either('simplify')
  }, adjectives: {
    Adjective('good'),
    Adjective('simple')
  }),
  'pu': WordDefinitions(rootNouns: {}, verbs: {
    Verb.intransitive('interact',
        endAddition: 'with "Toki Pona: The Language of Good" by Sonja Lang')
  }, adjectives: {}),
  'sama': WordDefinitions(
      rootNouns: {Noun('similarity')},
      verbs: {},
      adjectives: {Adjective('similar')}),
  'seli': WordDefinitions(
      rootNouns: {Noun('heat'), Noun('warmth')},
      verbs: {Verb.either('heat'), Verb.either('warm'), Verb.either('cook')},
      adjectives: {Adjective('hot'), Adjective('warm')}),
  'selo': WordDefinitions(
      rootNouns: {Noun('edge'), Noun('skin'), Noun('exterior')},
      verbs: {},
      adjectives: {}),
  'seme': WordDefinitions(rootNouns: {
    Noun('what', hasPlural: false)
  }, verbs: {
    Verb.either('do', endAddition: 'what', transitiveAttachment: 'to')
  }, adjectives: {
    Adjective('what', demonstrative: true)
  }),
  'sewi': WordDefinitions(rootNouns: {
    Noun('sky'),
    Noun('upper area'),
    Noun('god'),
    Noun('divinity'),
    Noun('divine being')
  }, verbs: {
    Verb.either('raise')
  }, adjectives: {
    Adjective('divine'),
    Adjective('upper'),
    Adjective('godly')
  }),
  'sijelo': WordDefinitions(
      rootNouns: {Noun('body')}, verbs: {}, adjectives: {Adjective('bodily')}),
  'sike': WordDefinitions(
      rootNouns: {Noun('circle'), Noun('cycle')},
      verbs: {},
      adjectives: {Adjective('circular'), Adjective('cyclical')}),
  'sin': WordDefinitions(
      rootNouns: {Noun('newness')}, verbs: {}, adjectives: {Adjective('new')}),
  'sinpin': WordDefinitions(
      rootNouns: {Noun('front'), Noun('wall'), Noun('vertical surface')},
      verbs: {},
      adjectives: {Adjective('front')}),
  'sitelen': WordDefinitions(
      rootNouns: {Noun('picture'), Noun('writing'), Noun('image')},
      verbs: {Verb.either('write'), Verb.either('draw')},
      adjectives: {}),
  'sona': WordDefinitions(
      rootNouns: {Noun('knowledge')},
      verbs: {Verb.either('know')},
      adjectives: {Adjective('knowledgable')}),
  'soweli': WordDefinitions(
      rootNouns: {Noun('animal'), Noun('land mammal')},
      verbs: {},
      adjectives: {Adjective('animal-like')}),
  'suli': WordDefinitions(
      rootNouns: {Noun('largeness'), Noun('importance')},
      verbs: {Verb.either('enlarge')},
      adjectives: {Adjective('large'), Adjective('important')}),
  'suno': WordDefinitions(
      rootNouns: {Noun('light'), Noun('sun')},
      verbs: {Verb.either('shine')},
      adjectives: {Adjective('bright')}),
  'supa': WordDefinitions(rootNouns: {
    Noun('furniture', hasPlural: false),
    Noun('table'),
    Noun('floor'),
    Noun('horizontal surface')
  }, verbs: {}, adjectives: {}),
  'suwi': WordDefinitions(
      rootNouns: {Noun('sweetness'), Noun('cuteness')},
      verbs: {},
      adjectives: {Adjective('sweet'), Adjective('cute')}),
  'tan': WordDefinitions(
      rootNouns: {Noun('origin'), Noun('cause')}, verbs: {}, adjectives: {}),
  'taso': WordDefinitions(
      rootNouns: {}, verbs: {}, adjectives: {Adjective('only')}),
  'tawa': WordDefinitions(
      rootNouns: {Noun('movement')},
      verbs: {Verb.either('move')},
      adjectives: {Adjective('moving')}),
  'telo': WordDefinitions(
      rootNouns: {Noun('water'), Noun('liquid')},
      verbs: {Verb.either('water')},
      adjectives: {Adjective('liquid')}),
  'tenpo': WordDefinitions(
      rootNouns: {Noun('time', hasPlural: false), Noun('moment')},
      verbs: {},
      adjectives: {}),
  'toki': WordDefinitions(
      rootNouns: {Noun('speech'), Noun('communicate')},
      verbs: {Verb.either('speak'), Verb.either('communicate')},
      adjectives: {}),
  'tomo': WordDefinitions(
      rootNouns: {Noun('house'), Noun('room'), Noun('indoor space')},
      verbs: {},
      adjectives: {}),
  'tonsi': WordDefinitions(rootNouns: {
    Noun('transgender person', irregularPluralForm: 'transgender people'),
    Noun('non-binary person', irregularPluralForm: 'non-binary people')
  }, verbs: {}, adjectives: {
    Adjective('transgender'),
    Adjective('non-binary')
  }),
  'tu': WordDefinitions(
      rootNouns: {Noun('two')},
      verbs: {Verb.either('divide')},
      adjectives: {Adjective('two')}),
  'unpa': WordDefinitions(rootNouns: {
    Noun('sex')
  }, verbs: {
    Verb.either('have', endAddition: 'sex', transitiveAttachment: 'with')
  }, adjectives: {
    Adjective('sexual')
  }),
  'uta': WordDefinitions(rootNouns: {Noun('mouth')}, verbs: {}, adjectives: {}),
  'utala': WordDefinitions(
      rootNouns: {Noun('battle'), Noun('fight'), Noun('war')},
      verbs: {Verb.either('fight'), Verb.either('war')},
      adjectives: {Adjective('fighting'), Adjective('warlike')}),
  'walo': WordDefinitions(
      rootNouns: {Noun('white')},
      verbs: {},
      adjectives: {Adjective('white'), Adjective('light')}),
  'wan': WordDefinitions(
      rootNouns: {Noun('one'), Noun('unity')},
      verbs: {Verb.either('unite')},
      adjectives: {Adjective('one'), Adjective('unified')}),
  'waso': WordDefinitions(
      rootNouns: {Noun('bird')},
      verbs: {},
      adjectives: {Adjective('birdlike')}),
  'wawa': WordDefinitions(
      rootNouns: {Noun('power')},
      verbs: {Verb.either('empower')},
      adjectives: {Adjective('powerful')}),
  'weka': WordDefinitions(
      rootNouns: {Noun('distance')},
      verbs: {Verb.transitive('get', endAddition: 'rid of')},
      adjectives: {Adjective('far away'), Adjective('gone')}),
  'wile': WordDefinitions(rootNouns: {
    Noun('want'),
    Noun('desire'),
    Noun('need')
  }, verbs: {
    Verb.either('want'),
    Verb.either('desire'),
    Verb.either('need')
  }, adjectives: {
    Adjective('wanted'),
    Adjective('desired'),
    Adjective('needed')
  })
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
