import 'dart:convert';

import 'translation.dart';

class Name {
  final String short;
  final String long;
  final Translation transliteration;
  final Translation translation;
  Name({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  Map<String, dynamic> toMap() {
    return {
      'short': short,
      'long': long,
      'transliteration': transliteration.toMap(),
      'translation': translation.toMap(),
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      short: map['short'] ?? '',
      long: map['long'] ?? '',
      transliteration: Translation.fromMap(map['transliteration']),
      translation: Translation.fromMap(map['translation']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) => Name.fromMap(json.decode(source));
}
