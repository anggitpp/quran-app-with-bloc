import 'dart:convert';

class Revelation {
  final String arab;
  final String id;
  final String en;
  Revelation({
    required this.arab,
    required this.id,
    required this.en,
  });

  Map<String, dynamic> toMap() {
    return {
      'arab': arab,
      'id': id,
      'en': en,
    };
  }

  factory Revelation.fromMap(Map<String, dynamic> map) {
    return Revelation(
      arab: map['arab'] ?? '',
      id: map['id'] ?? '',
      en: map['en'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Revelation.fromJson(String source) =>
      Revelation.fromMap(json.decode(source));
}
