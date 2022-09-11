import 'package:intersperse/intersperse.dart';
import 'representation/basic_representation.dart';
import 'representation/complex_representation.dart';
import 'representation/represent.dart';
import 'toki_content_phrase.dart';
import 'toki_context_phrase.dart';

class TokiContentPhraseChoice implements TokiContextPhrase {
  final List<TokiContentPhrase> phrases;

  const TokiContentPhraseChoice(this.phrases);

  @override
  ComplexRepresentation toRepresentation() => ComplexRepresentation(
      baseReps: phrases
          .toRepresentationList()
          .intersperse(
              const BasicRepresentation(text: 'anu', description: 'particle'))
          .toList());

  @override
  String toString() {
    return 'TokiContentPhraseChoice(phrases: $phrases)';
  }
}
