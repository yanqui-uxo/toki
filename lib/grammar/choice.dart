import 'package:intersperse/intersperse.dart';
import '../representation/represent.dart';

abstract class Choice<T extends Representable> implements Representable {
  List<T> get choices;

  const Choice();

  @override
  Representation toRepresentation() {
    List<Representation> choiceRepresentations = choices.toRepresentationList();
    if (choiceRepresentations.length > 1) {
      choiceRepresentations = choiceRepresentations
          .map((x) => Representation.wrap(
              baseRepresentation: x, description: choiceDescription))
          .intersperse(anuRepresentation)
          .toList();
    }

    return Representation(baseRepresentations: choiceRepresentations);
  }
}
