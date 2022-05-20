import 'dart:convert';

import 'name.dart';
import 'revelation.dart';
import 'tafsir.dart';

class Surah {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final Name name;
  final Revelation revelation;
  final Tafsir tafsir;
  Surah({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'sequence': sequence,
      'numberOfVerses': numberOfVerses,
      'name': name.toMap(),
      'revelation': revelation.toMap(),
      'tafsir': tafsir.toMap(),
    };
  }

  factory Surah.fromMap(Map<String, dynamic> map) {
    return Surah(
      number: map['number']?.toInt() ?? 0,
      sequence: map['sequence']?.toInt() ?? 0,
      numberOfVerses: map['numberOfVerses']?.toInt() ?? 0,
      name: Name.fromMap(map['name']),
      revelation: Revelation.fromMap(map['revelation']),
      tafsir: Tafsir.fromMap(map['tafsir']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Surah.fromJson(String source) => Surah.fromMap(json.decode(source));
}
