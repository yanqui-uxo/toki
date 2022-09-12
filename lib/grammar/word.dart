import '../representation/basic_representation.dart';
import '../representation/complex_representation.dart';
import '../representation/particle_representation.dart';
import '../representation/represent.dart';

class Word implements Representable {
  final String word;
  final bool aAttached;
  final bool isName;

  const Word(this.word, {this.aAttached = false, this.isName = false});

  @override
  String toString() {
    var ret = word;
    if (aAttached) ret += '+a';
    if (isName) ret += ' (name)';
    return ret;
  }

  @override
  Representation toRepresentation() {
    if (isName) {
      var nameRepresentation =
          BasicRepresentation(text: word, description: 'name');

      if (aAttached) {
        return ComplexRepresentation(baseRepresentations: [
          nameRepresentation,
          const ParticleRepresentation('a')
        ]);
      } else {
        return nameRepresentation;
      }
    } else {
      return BasicRepresentation(text: word);
    }
  }
}
