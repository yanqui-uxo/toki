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
    BasicRepresentation rep;
    if (isName) {
      rep = BasicRepresentation(text: word, description: 'name');
    } else {
      rep = BasicRepresentation(text: word);
    }

    if (aAttached) {
      return ComplexRepresentation(
          baseRepresentations: [rep, const ParticleRepresentation('a')]);
    } else {
      return rep;
    }
  }
}
