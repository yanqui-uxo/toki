enum Plurality { singular, plural, either }

enum Pronoun {
  i('I', 'me', 'my', Plurality.singular),
  we('we', 'us', 'our', Plurality.plural),
  you('you', 'you', 'your', Plurality.either),
  he('he', 'him', 'his', Plurality.singular),
  she('she', 'her', 'her', Plurality.singular),
  it('it', 'it', 'its', Plurality.singular),
  they('they', 'them', 'their', Plurality.either);

  final String nominative;
  final String accusative;
  final String possessive;
  final Plurality plurality;

  const Pronoun(
      this.nominative, this.accusative, this.possessive, this.plurality);
}
