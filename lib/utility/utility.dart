import 'dart:math';

extension Case on String {
  bool get isUpper => this == toUpperCase();
  bool get isLower => this == toLowerCase();

  // fails on empty strings
  bool get isCapitalized =>
      this[0].isUpper && (length == 1 || substring(1).isLower);
}

extension RandomChoice<T> on Iterable<T> {
  T randomChoice() {
    final l = toList();
    return l[Random().nextInt(l.length)];
  }
}
