abstract class Noun {
  bool get hasPluralForm;

  String nominativeForm(bool plural);

  String accusativeForm(bool plural);
}
