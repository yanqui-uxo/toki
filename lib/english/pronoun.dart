import 'noun.dart';

class Pronoun implements Noun {
  @override
  final bool hasPluralForm = true;

  final String singularNominativeForm;
  final String singularAccusativeForm;
  final String pluralNominativeForm;
  final String pluralAccusativeForm;

  @override
  String nominativeForm(bool plural) =>
      plural ? pluralNominativeForm : singularNominativeForm;

  @override
  String accusativeForm(bool plural) =>
      plural ? pluralAccusativeForm : singularAccusativeForm;

  const Pronoun(this.singularNominativeForm, this.singularAccusativeForm,
      this.pluralNominativeForm, this.pluralAccusativeForm);
}
