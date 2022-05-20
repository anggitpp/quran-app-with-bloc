import 'dart:convert';

class Tafsir {
  final String id;
  Tafsir({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory Tafsir.fromMap(Map<String, dynamic> map) {
    return Tafsir(
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tafsir.fromJson(String source) => Tafsir.fromMap(json.decode(source));
}
