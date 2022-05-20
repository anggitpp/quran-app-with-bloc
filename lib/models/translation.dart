import 'dart:convert';

class Translation {
  final String en;
  final String id;
  Translation({
    required this.en,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'en': en,
      'id': id,
    };
  }

  factory Translation.fromMap(Map<String, dynamic> map) {
    return Translation(
      en: map['en'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Translation.fromJson(String source) =>
      Translation.fromMap(json.decode(source));
}
