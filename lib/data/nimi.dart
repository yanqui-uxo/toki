import 'package:petitparser/petitparser.dart';

import '../english/adjective.dart';
import '../english/pronoun.dart';
import '../english/regular_noun.dart';
import '../english/verb.dart';
import '../english/word_definitions.dart';

const Map<String, WordDefinitions> contentWords = {
  'akesi': WordDefinitions(
      rootNouns: {RegularNoun.plural('lizard'), RegularNoun.plural('reptile')},
      verbs: {},
      adjectives: {Adjective('lizardlike'), Adjective('reptilian')}),
  'ala': WordDefinitions(
      rootNouns: {RegularNoun.nonPlural('nothing')},
      verbs: {Verb.either('nullify')},
      adjectives: {Adjective('not')}),
  'alasa': WordDefinitions(rootNouns: {
    RegularNoun.plural('hunt'),
    RegularNoun.plural('search')
  }, verbs: {
    Verb.either('hunt'),
    Verb.either('search'),
    Verb.either('forage')
  }, adjectives: {}),
  'ale': WordDefinitions(
      rootNouns: {RegularNoun.plural('everything')},
      verbs: {},
      adjectives: {Adjective('complete'), Adjective('all')}),
  'anpa': WordDefinitions(rootNouns: {
    RegularNoun.plural('defeat'),
    RegularNoun.plural('underneath')
  }, verbs: {
    Verb.either('defeat'),
    Verb.either('lower')
  }, adjectives: {
    Adjective('low'),
    Adjective('defeated')
  }),
  'ante': WordDefinitions(
      rootNouns: {RegularNoun.plural('difference')},
      verbs: {Verb.either('differentiate')},
      adjectives: {Adjective('different')}),
  'awen': WordDefinitions(rootNouns: {
    RegularNoun.plural('protection'),
    RegularNoun.plural('maintenance'),
    RegularNoun.plural('security')
  }, verbs: {
    Verb.either('protect'),
    Verb.either('secure'),
    Verb.either('maintain')
  }, adjectives: {
    Adjective('protected'),
    Adjective('secured'),
    Adjective('maintained')
  }),
  'esun': WordDefinitions(rootNouns: {
    RegularNoun.plural('exchange'),
    RegularNoun.plural('purchase')
  }, verbs: {
    Verb.either('buy'),
    Verb.either('sell'),
    Verb.either('exchange')
  }, adjectives: {}),
  'ijo': WordDefinitions(rootNouns: {
    RegularNoun.nonPlural('something'),
    RegularNoun.nonPlural('thing'),
    RegularNoun.plural('object')
  }, verbs: {}, adjectives: {}),
  'ike': WordDefinitions(rootNouns: {
    RegularNoun.plural('evil'),
    RegularNoun.plural('evilness'),
    RegularNoun.plural('badness'),
    RegularNoun.plural('complexity')
  }, verbs: {
    Verb.either('worsen'),
    Verb.either('complicate')
  }, adjectives: {
    Adjective('bad'),
    Adjective('evil'),
    Adjective('complex')
  }),
  'ilo': WordDefinitions(
      rootNouns: {RegularNoun.plural('tool')}, verbs: {}, adjectives: {}),
  'insa': WordDefinitions(rootNouns: {
    RegularNoun.plural('inside'),
    RegularNoun.plural('internal organ'),
    RegularNoun.nonPlural('innards')
  }, verbs: {}, adjectives: {
    Adjective('inner')
  }),
  'jaki': WordDefinitions(rootNouns: {
    RegularNoun.plural('dirt'),
    RegularNoun.plural('poop'),
    RegularNoun.plural('disease'),
    RegularNoun.plural('dirtiness'),
    RegularNoun.plural('grossness')
  }, verbs: {
    Verb.either('dirty')
  }, adjectives: {
    Adjective('dirty'),
    Adjective('gross'),
    Adjective('diseased')
  }),
  'jan': WordDefinitions(rootNouns: {
    RegularNoun.plural('person'),
    RegularNoun.plural('sentient being')
  }, verbs: {}, adjectives: {
    Adjective('sapient')
  }),
  'jelo': WordDefinitions(
      rootNouns: {RegularNoun.plural('yellow')},
      verbs: {},
      adjectives: {Adjective('yellow')}),
  'jo': WordDefinitions(rootNouns: {}, verbs: {
    Verb.either('carry'),
    Verb.either('contain'),
    Verb.either('hold')
  }, adjectives: {}),
  'kala': WordDefinitions(rootNouns: {
    RegularNoun.plural('fish'),
    RegularNoun.plural('aquatic animal')
  }, verbs: {}, adjectives: {
    Adjective('aquatic')
  }),
  'kalama': WordDefinitions(rootNouns: {
    RegularNoun.plural('noise'),
    RegularNoun.plural('sound')
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
  'kasi': WordDefinitions(
      rootNouns: {RegularNoun.plural('plant')}, verbs: {}, adjectives: {}),
  'ken': WordDefinitions(rootNouns: {
    RegularNoun.plural('ability'),
    RegularNoun.plural('possibility')
  }, verbs: {}, adjectives: {
    Adjective('possible')
  }),
  'kepeken': WordDefinitions(
      rootNouns: {RegularNoun.plural('usage')}, verbs: {}, adjectives: {}),
  'kili': WordDefinitions(
      rootNouns: {RegularNoun.plural('fruit'), RegularNoun.plural('vegetable')},
      verbs: {},
      adjectives: {Adjective('fruity')}),
  'kiwen': WordDefinitions(rootNouns: {
    RegularNoun.plural('rock'),
    RegularNoun.plural('hard object')
  }, verbs: {}, adjectives: {
    Adjective('hard'),
    Adjective('stiff')
  }),
  'ko': WordDefinitions(rootNouns: {
    RegularNoun.plural('clay'),
    RegularNoun.plural('dough'),
    RegularNoun.plural('paste'),
    RegularNoun.plural('powder')
  }, verbs: {}, adjectives: {}),
  'kon': WordDefinitions(rootNouns: {
    RegularNoun.nonPlural('air'),
    RegularNoun.plural('unseen agent'),
    RegularNoun.plural('hidden reality'),
    RegularNoun.plural('spirit'),
    RegularNoun.plural('soul')
  }, verbs: {}, adjectives: {}),
  'kule': WordDefinitions(rootNouns: {
    RegularNoun.plural('color')
  }, verbs: {
    Verb.either('color')
  }, adjectives: {
    Adjective('colorful'),
    Adjective('gay'),
    Adjective('LGBTQ')
  }),
  'kulupu': WordDefinitions(rootNouns: {
    RegularNoun.plural('group'),
    RegularNoun.plural('community'),
    RegularNoun.plural('tribe')
  }, verbs: {}, adjectives: {
    Adjective('communal')
  }),
  'kute': WordDefinitions(
      rootNouns: {RegularNoun.plural('ear')},
      verbs: {Verb.either('hear'), Verb.either('listen'), Verb.either('obey')},
      adjectives: {}),
  'lape': WordDefinitions(
      rootNouns: {RegularNoun.plural('rest'), RegularNoun.plural('sleep')},
      verbs: {Verb.intransitive('rest'), Verb.intransitive('sleep')},
      adjectives: {}),
  'laso': WordDefinitions(
      rootNouns: {RegularNoun.plural('blue'), RegularNoun.plural('green')},
      verbs: {},
      adjectives: {Adjective('blue'), Adjective('green')}),
  'lawa': WordDefinitions(rootNouns: {
    RegularNoun.plural('mind'),
    RegularNoun.plural('brain'),
    RegularNoun.plural('ruler'),
    RegularNoun.plural('leader'),
    RegularNoun.plural('government'),
    RegularNoun.plural('authority')
  }, verbs: {
    Verb.either('control'),
    Verb.either('rule')
  }, adjectives: {}),
  'len': WordDefinitions(rootNouns: {
    RegularNoun.nonPlural('clothing'),
    RegularNoun.nonPlural('fabric'),
    RegularNoun.plural('privacy layer')
  }, verbs: {
    Verb.either('cover'),
    Verb.either('clothe'),
    Verb.either('hide')
  }, adjectives: {}),
  'lete': WordDefinitions(
      rootNouns: {RegularNoun.plural('cold')},
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
      rootNouns: {RegularNoun.plural('line'), RegularNoun.plural('string')},
      verbs: {},
      adjectives: {Adjective('stringy'), Adjective('thin')}),
  'lipu': WordDefinitions(rootNouns: {
    RegularNoun.plural('document'),
    RegularNoun.plural('paper'),
    RegularNoun.plural('flat bendable object')
  }, verbs: {
    Verb.either('flatten')
  }, adjectives: {
    Adjective('flat')
  }),
  'loje': WordDefinitions(
      rootNouns: {RegularNoun.plural('red')},
      verbs: {Verb.either('redden')},
      adjectives: {Adjective('red')}),
  'lon': WordDefinitions(
      rootNouns: {RegularNoun.plural('truth'), RegularNoun.plural('existence')},
      verbs: {Verb.either('summon')},
      adjectives: {Adjective('true'), Adjective('existent')}),
  'luka': WordDefinitions(rootNouns: {
    RegularNoun.plural('arm'),
    RegularNoun.plural('hand'),
    RegularNoun.plural('finger')
  }, verbs: {}, adjectives: {}),
  'lukin': WordDefinitions(rootNouns: {
    RegularNoun.plural('eye')
  }, verbs: {
    Verb.either('look'),
    Verb.either('see'),
    Verb.either('view'),
    Verb.either('read')
  }, adjectives: {}),
  'lupa': WordDefinitions(rootNouns: {
    RegularNoun.plural('hole'),
    RegularNoun.plural('window'),
    RegularNoun.plural('door')
  }, verbs: {}, adjectives: {}),
  'ma': WordDefinitions(rootNouns: {
    RegularNoun.plural('land'),
    RegularNoun.plural('soil'),
    RegularNoun.plural('country'),
    RegularNoun.plural('place')
  }, verbs: {}, adjectives: {}),
  'mama': WordDefinitions(rootNouns: {
    RegularNoun.plural('parent'),
    RegularNoun.plural('mother'),
    RegularNoun.plural('father'),
    RegularNoun.plural('creator'),
    RegularNoun.plural('originator')
  }, verbs: {
    Verb.either('create'),
    Verb.either('caretake'),
    Verb.either('parent'),
    Verb.either('originate')
  }, adjectives: {}),
  'mani': WordDefinitions(rootNouns: {
    RegularNoun.nonPlural('money'),
    RegularNoun.nonPlural('currency'),
    RegularNoun.nonPlural('livestock')
  }, verbs: {}, adjectives: {}),
  'meli': WordDefinitions(rootNouns: {
    RegularNoun.plural('woman'),
    RegularNoun.plural('female'),
    RegularNoun.plural('femininity')
  }, verbs: {}, adjectives: {
    Adjective('female'),
    Adjective('feminine')
  }),
  'mi': WordDefinitions(
      rootNouns: {Pronoun('I', 'me', 'we', 'us')},
      verbs: {},
      adjectives: {Adjective('my'), Adjective('our')}),
  'mije': WordDefinitions(rootNouns: {
    RegularNoun.plural('man'),
    RegularNoun.plural('male'),
    RegularNoun.plural('masculinity')
  }, verbs: {}, adjectives: {
    Adjective('male'),
    Adjective('masculine')
  }),
  'moku': WordDefinitions(
      rootNouns: {RegularNoun.plural('food'), RegularNoun.plural('consumable')},
      verbs: {Verb.either('eat'), Verb.either('consume')},
      adjectives: {Adjective('consumable')}),
  'moli': WordDefinitions(
      rootNouns: {RegularNoun.plural('death'), RegularNoun.plural('killing')},
      verbs: {Verb.intransitive('die'), Verb.either('kill')},
      adjectives: {Adjective('dead')}),
  'monsi': WordDefinitions(rootNouns: {
    RegularNoun.plural('back'),
    RegularNoun.plural('behind'),
    RegularNoun.plural('butt')
  }, verbs: {}, adjectives: {
    Adjective('back')
  }),
  'mu': WordDefinitions(rootNouns: {
    RegularNoun.plural('moo'),
    RegularNoun.plural('cheep'),
    RegularNoun.plural('caw'),
    RegularNoun.plural('chirp'),
    RegularNoun.plural('tweet'),
    RegularNoun.plural('woof'),
  }, verbs: {
    Verb.either('moo'),
    Verb.either('cheep'),
    Verb.either('caw'),
    Verb.either('chirp'),
    Verb.either('tweet'),
    Verb.either('woof')
  }, adjectives: {}),
  'mun': WordDefinitions(rootNouns: {
    RegularNoun.plural('moon'),
    RegularNoun.plural('planet'),
    RegularNoun.plural('comet'),
    RegularNoun.plural('star'),
    RegularNoun.plural('celestial object')
  }, verbs: {}, adjectives: {
    Adjective('celestial'),
    Adjective('cosmic'),
    Adjective('lunar')
  }),
  'musi': WordDefinitions(
      rootNouns: {RegularNoun.plural('game'), RegularNoun.plural('amusement')},
      verbs: {Verb.either('amuse')},
      adjectives: {Adjective('amusing')}),
  'mute': WordDefinitions(
      rootNouns: {RegularNoun.plural('amount')},
      verbs: {Verb.either('multiply')},
      adjectives: {Adjective('much', irregularPluralForm: 'many')}),
  'nanpa': WordDefinitions(
      rootNouns: {RegularNoun.plural('number')}, verbs: {}, adjectives: {}),
  'nasa': WordDefinitions(rootNouns: {
    RegularNoun.plural('strangeness'),
    RegularNoun.plural('intoxication')
  }, verbs: {}, adjectives: {
    Adjective('strange'),
    Adjective('intoxicated')
  }),
  'nasin': WordDefinitions(rootNouns: {
    RegularNoun.plural('path'),
    RegularNoun.plural('way'),
    RegularNoun.plural('method'),
    RegularNoun.plural('doctrine')
  }, verbs: {}, adjectives: {}),
  'nena': WordDefinitions(rootNouns: {
    RegularNoun.plural('bump'),
    RegularNoun.plural('hill'),
    RegularNoun.plural('mountain')
  }, verbs: {}, adjectives: {}),
  'ni': WordDefinitions(rootNouns: {
    RegularNoun.plural('this', irregularPluralForm: 'these'),
    RegularNoun.plural('that', irregularPluralForm: 'those')
  }, verbs: {}, adjectives: {
    Adjective('this', irregularPluralForm: 'these'),
    Adjective('that', irregularPluralForm: 'those')
  }),
  'nimi': WordDefinitions(
      rootNouns: {RegularNoun.plural('word'), RegularNoun.plural('name')},
      verbs: {Verb.either('name')},
      adjectives: {}),
  'noka': WordDefinitions(rootNouns: {
    RegularNoun.plural('leg'),
    RegularNoun.plural('foot'),
    RegularNoun.plural('toe')
  }, verbs: {}, adjectives: {}),
  'olin': WordDefinitions(
      rootNouns: {RegularNoun.plural('love'), RegularNoun.plural('romance')},
      verbs: {Verb.either('love')},
      adjectives: {Adjective('loving')}),
  'ona': WordDefinitions(rootNouns: {
    Pronoun('he', 'him', 'they', 'them'),
    Pronoun('she', 'her', 'they', 'them'),
    Pronoun('it', 'it', 'they', 'them')
  }, verbs: {}, adjectives: {
    Adjective('his'),
    Adjective('her'),
    Adjective('its')
  }),
  'open': WordDefinitions(rootNouns: {
    RegularNoun.plural('beginning'),
    RegularNoun.plural('opening')
  }, verbs: {
    Verb.either('begin'),
    Verb.either('open')
  }, adjectives: {}),
  'pakala': WordDefinitions(rootNouns: {
    RegularNoun.plural('destruction'),
    RegularNoun.plural('breakage'),
    RegularNoun.plural('harm'),
    RegularNoun.plural('damage')
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
      rootNouns: {RegularNoun.plural('work'), RegularNoun.plural('job')},
      verbs: {Verb.either('work'), Verb.either('make')},
      adjectives: {}),
  'palisa': WordDefinitions(rootNouns: {
    RegularNoun.plural('stick'),
    RegularNoun.plural('twig'),
    RegularNoun.plural('branch')
  }, verbs: {}, adjectives: {}),
  'pan': WordDefinitions(rootNouns: {
    RegularNoun.plural('bread'),
    RegularNoun.plural('grain'),
    RegularNoun.plural('rice')
  }, verbs: {}, adjectives: {}),
  'pana': WordDefinitions(
      rootNouns: {},
      verbs: {Verb.either('give'), Verb.either('emit'), Verb.either('release')},
      adjectives: {}),
  'pilin': WordDefinitions(
      rootNouns: {RegularNoun.plural('feeling')},
      verbs: {Verb.either('feel'), Verb.either('touch')},
      adjectives: {}),
  'pimeja': WordDefinitions(rootNouns: {
    RegularNoun.plural('black'),
    RegularNoun.nonPlural('darkness')
  }, verbs: {}, adjectives: {
    Adjective('black'),
    Adjective('dark')
  }),
  'pini': WordDefinitions(rootNouns: {
    RegularNoun.plural('ending')
  }, verbs: {
    Verb.either('end'),
    Verb.either('stop')
  }, adjectives: {
    Adjective('ended'),
    Adjective('past'),
    Adjective('finished')
  }),
  'pipi': WordDefinitions(rootNouns: {
    RegularNoun.plural('bug'),
    RegularNoun.plural('insect'),
    RegularNoun.plural('arachnid')
  }, verbs: {}, adjectives: {}),
  'poka': WordDefinitions(
      rootNouns: {RegularNoun.plural('side'), RegularNoun.plural('vicinity')},
      verbs: {},
      adjectives: {Adjective('nearby')}),
  'poki': WordDefinitions(rootNouns: {
    RegularNoun.plural('container'),
    RegularNoun.plural('bowl'),
    RegularNoun.plural('cup')
  }, verbs: {}, adjectives: {}),
  'pona': WordDefinitions(rootNouns: {
    RegularNoun.plural('good'),
    RegularNoun.plural('goodness'),
    RegularNoun.plural('simplicity')
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
      rootNouns: {RegularNoun.plural('similarity')},
      verbs: {},
      adjectives: {Adjective('similar')}),
  'seli': WordDefinitions(
      rootNouns: {RegularNoun.plural('heat'), RegularNoun.plural('warmth')},
      verbs: {Verb.either('heat'), Verb.either('warm'), Verb.either('cook')},
      adjectives: {Adjective('hot'), Adjective('warm')}),
  'selo': WordDefinitions(rootNouns: {
    RegularNoun.plural('edge'),
    RegularNoun.plural('skin'),
    RegularNoun.plural('exterior')
  }, verbs: {}, adjectives: {}),
  'seme': WordDefinitions(rootNouns: {
    RegularNoun.nonPlural('what')
  }, verbs: {
    Verb.either('do', endAddition: 'what', transitiveAttachment: 'to')
  }, adjectives: {
    Adjective('what')
  }),
  'sewi': WordDefinitions(rootNouns: {
    RegularNoun.plural('sky'),
    RegularNoun.plural('upper area'),
    RegularNoun.plural('god'),
    RegularNoun.plural('divinity'),
    RegularNoun.plural('divine being')
  }, verbs: {
    Verb.either('raise')
  }, adjectives: {
    Adjective('divine'),
    Adjective('upper'),
    Adjective('godly')
  }),
  'sijelo': WordDefinitions(
      rootNouns: {RegularNoun.plural('body')},
      verbs: {},
      adjectives: {Adjective('bodily')}),
  'sike': WordDefinitions(
      rootNouns: {RegularNoun.plural('circle'), RegularNoun.plural('cycle')},
      verbs: {},
      adjectives: {Adjective('circular'), Adjective('cyclical')}),
  'sin': WordDefinitions(
      rootNouns: {RegularNoun.plural('newness')},
      verbs: {},
      adjectives: {Adjective('new')}),
  'sina': WordDefinitions(
      rootNouns: {Pronoun('you', 'you', 'you', 'you')},
      verbs: {},
      adjectives: {Adjective('your')}),
  'sinpin': WordDefinitions(rootNouns: {
    RegularNoun.plural('front'),
    RegularNoun.plural('wall'),
    RegularNoun.plural('vertical surface')
  }, verbs: {}, adjectives: {
    Adjective('front')
  }),
  'sitelen': WordDefinitions(rootNouns: {
    RegularNoun.plural('picture'),
    RegularNoun.plural('writing'),
    RegularNoun.plural('image')
  }, verbs: {
    Verb.either('write'),
    Verb.either('draw')
  }, adjectives: {}),
  'sona': WordDefinitions(
      rootNouns: {RegularNoun.plural('knowledge')},
      verbs: {Verb.either('know')},
      adjectives: {Adjective('knowledgable')}),
  'soweli': WordDefinitions(rootNouns: {
    RegularNoun.plural('animal'),
    RegularNoun.plural('land mammal')
  }, verbs: {}, adjectives: {
    Adjective('animal-like')
  }),
  'suli': WordDefinitions(rootNouns: {
    RegularNoun.plural('largeness'),
    RegularNoun.plural('importance')
  }, verbs: {
    Verb.either('enlarge')
  }, adjectives: {
    Adjective('large'),
    Adjective('important')
  }),
  'suno': WordDefinitions(
      rootNouns: {RegularNoun.plural('light'), RegularNoun.plural('sun')},
      verbs: {Verb.either('shine')},
      adjectives: {Adjective('bright')}),
  'supa': WordDefinitions(rootNouns: {
    RegularNoun.nonPlural('furniture'),
    RegularNoun.plural('table'),
    RegularNoun.plural('floor'),
    RegularNoun.plural('horizontal surface')
  }, verbs: {}, adjectives: {}),
  'suwi': WordDefinitions(rootNouns: {
    RegularNoun.plural('sweetness'),
    RegularNoun.plural('cuteness')
  }, verbs: {}, adjectives: {
    Adjective('sweet'),
    Adjective('cute')
  }),
  'tan': WordDefinitions(
      rootNouns: {RegularNoun.plural('origin'), RegularNoun.plural('cause')},
      verbs: {},
      adjectives: {}),
  'taso': WordDefinitions(
      rootNouns: {}, verbs: {}, adjectives: {Adjective('only')}),
  'tawa': WordDefinitions(
      rootNouns: {RegularNoun.plural('movement')},
      verbs: {Verb.either('move')},
      adjectives: {Adjective('moving')}),
  'telo': WordDefinitions(
      rootNouns: {RegularNoun.plural('water'), RegularNoun.plural('liquid')},
      verbs: {Verb.either('water')},
      adjectives: {Adjective('liquid')}),
  'tenpo': WordDefinitions(
      rootNouns: {RegularNoun.nonPlural('time'), RegularNoun.plural('moment')},
      verbs: {},
      adjectives: {}),
  'toki': WordDefinitions(rootNouns: {
    RegularNoun.plural('speech'),
    RegularNoun.plural('communicate')
  }, verbs: {
    Verb.either('speak'),
    Verb.either('communicate')
  }, adjectives: {}),
  'tomo': WordDefinitions(rootNouns: {
    RegularNoun.plural('house'),
    RegularNoun.plural('room'),
    RegularNoun.plural('indoor space')
  }, verbs: {}, adjectives: {}),
  'tonsi': WordDefinitions(rootNouns: {
    RegularNoun.plural('transgender person',
        irregularPluralForm: 'transgender people'),
    RegularNoun.plural('non-binary person',
        irregularPluralForm: 'non-binary people')
  }, verbs: {}, adjectives: {
    Adjective('transgender'),
    Adjective('non-binary')
  }),
  'tu': WordDefinitions(
      rootNouns: {RegularNoun.plural('two')},
      verbs: {Verb.either('divide')},
      adjectives: {Adjective('two')}),
  'unpa': WordDefinitions(rootNouns: {
    RegularNoun.plural('sex')
  }, verbs: {
    Verb.either('have', endAddition: 'sex', transitiveAttachment: 'with')
  }, adjectives: {
    Adjective('sexual')
  }),
  'uta': WordDefinitions(
      rootNouns: {RegularNoun.plural('mouth')}, verbs: {}, adjectives: {}),
  'utala': WordDefinitions(rootNouns: {
    RegularNoun.plural('battle'),
    RegularNoun.plural('fight'),
    RegularNoun.plural('war')
  }, verbs: {
    Verb.either('fight'),
    Verb.either('war')
  }, adjectives: {
    Adjective('fighting'),
    Adjective('warlike')
  }),
  'walo': WordDefinitions(
      rootNouns: {RegularNoun.plural('white')},
      verbs: {},
      adjectives: {Adjective('white'), Adjective('light')}),
  'wan': WordDefinitions(
      rootNouns: {RegularNoun.plural('one'), RegularNoun.plural('unity')},
      verbs: {Verb.either('unite')},
      adjectives: {Adjective('one'), Adjective('unified')}),
  'waso': WordDefinitions(
      rootNouns: {RegularNoun.plural('bird')},
      verbs: {},
      adjectives: {Adjective('birdlike')}),
  'wawa': WordDefinitions(
      rootNouns: {RegularNoun.plural('power')},
      verbs: {Verb.either('empower')},
      adjectives: {Adjective('powerful')}),
  'weka': WordDefinitions(
      rootNouns: {RegularNoun.plural('distance')},
      verbs: {Verb.transitive('get', endAddition: 'rid of')},
      adjectives: {Adjective('far away'), Adjective('gone')}),
  'wile': WordDefinitions(rootNouns: {
    RegularNoun.plural('want'),
    RegularNoun.plural('desire'),
    RegularNoun.plural('need')
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

const Map<String, Set<String>> prepositions = {
  'kepeken': {'using'},
  'lon': {'in', 'at'},
  'sama': {'similar to', 'same as'},
  'tan': {'from', 'because of'},
  'tawa': {'for', 'to'}
};

const Map<String, Set<String>> preverbs = {
  'alasa': {'try'},
  'awen': {'continue'},
  'kama': {'start', 'become'},
  'ken': {'can'},
  'lukin': {'try'},
  'sona': {'know how'},
  'wile': {'want'},
};

const Map<String, int> numbers = {'wan': 1, 'tu': 2};

extension KeySet<K> on Map<K, void> {
  Set<K> keySet() => keys.toSet();
}

Parser<String> _createWordParser() {
  var sorted = List<String>.from(contentWords.keySet());
  sorted.sort((a, b) => b.length.compareTo(a.length));
  return sorted.map(string).toChoiceParser();
}

final Parser<String> contentWord = _createWordParser();
