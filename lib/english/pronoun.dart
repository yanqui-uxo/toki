enum Plurality { singular, plural, either }

class Pronoun {
  final String nominative;
  final String accusative;
  final String possessive;
  final Plurality plurality;

  const Pronoun(
      this.nominative, this.accusative, this.possessive, this.plurality);
}
