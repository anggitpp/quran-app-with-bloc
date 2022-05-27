import 'dart:convert';

Ayat ayatFromJson(String str) => Ayat.fromJson(json.decode(str));

String ayatToJson(Ayat data) => json.encode(data.toJson());

class Ayat {
  Ayat({
    this.number,
    this.meta,
    this.text,
    this.translation,
    this.audio,
    this.tafsir,
  });

  Number? number;
  Meta? meta;
  SurahText? text;
  Translation? translation;
  Audio? audio;
  AyatTafsir? tafsir;

  factory Ayat.fromJson(Map<String, dynamic>? json) => Ayat(
        number: Number.fromJson(json?["number"]),
        meta: Meta.fromJson(json?["meta"]),
        text: SurahText.fromJson(json?["text"]),
        translation: Translation.fromJson(json?["translation"]),
        audio: Audio.fromJson(json?["audio"]),
        tafsir: AyatTafsir.fromJson(json?["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number?.toJson(),
        "meta": meta?.toJson(),
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "audio": audio?.toJson(),
        "tafsir": tafsir?.toJson(),
      };
}

class Audio {
  Audio({
    this.primary,
    this.secondary,
  });

  String? primary;
  List<String>? secondary;

  factory Audio.fromJson(Map<String, dynamic>? json) => Audio(
        primary: json?["primary"],
        secondary: List<String>.from(json?["secondary"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary == null
            ? null
            : List<dynamic>.from(secondary!.map((x) => x)),
      };
}

class Meta {
  Meta({
    this.juz,
    this.page,
    this.manzil,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  int? juz;
  int? page;
  int? manzil;
  int? ruku;
  int? hizbQuarter;
  Sajda? sajda;

  factory Meta.fromJson(Map<String, dynamic>? json) => Meta(
        juz: json?["juz"],
        page: json?["page"],
        manzil: json?["manzil"],
        ruku: json?["ruku"],
        hizbQuarter: json?["hizbQuarter"],
        sajda: Sajda.fromJson(json?["sajda"]),
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda?.toJson(),
      };
}

class Sajda {
  Sajda({
    this.recommended,
    this.obligatory,
  });

  bool? recommended;
  bool? obligatory;

  factory Sajda.fromJson(Map<String, dynamic>? json) => Sajda(
        recommended: json?["recommended"],
        obligatory: json?["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
      };
}

class Number {
  Number({
    this.inQuran,
    this.inSurah,
  });

  int? inQuran;
  int? inSurah;

  factory Number.fromJson(Map<String, dynamic>? json) => Number(
        inQuran: json?["inQuran"],
        inSurah: json?["inSurah"],
      );

  Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
      };
}

class Name {
  Name({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  String? short;
  String? long;
  Translation? transliteration;
  Translation? translation;

  factory Name.fromJson(Map<String, dynamic>? json) => Name(
        short: json?["short"],
        long: json?["long"],
        transliteration: Translation.fromJson(json?["transliteration"]),
        translation: Translation.fromJson(json?["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration?.toJson(),
        "translation": translation?.toJson(),
      };
}

class Translation {
  Translation({
    this.en,
    this.id,
  });

  String? en;
  String? id;

  factory Translation.fromJson(Map<String, dynamic>? json) => Translation(
        en: json?["en"],
        id: json?["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
      };
}

class Revelation {
  Revelation({
    this.arab,
    this.en,
    this.id,
  });

  String? arab;
  String? en;
  String? id;

  factory Revelation.fromJson(Map<String, dynamic>? json) => Revelation(
        arab: json?["arab"],
        en: json?["en"],
        id: json?["id"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id,
      };
}

class SurahTafsir {
  SurahTafsir({
    this.id,
  });

  String? id;

  factory SurahTafsir.fromJson(Map<String, dynamic>? json) => SurahTafsir(
        id: json?["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class AyatTafsir {
  AyatTafsir({
    this.id,
  });

  Id? id;

  factory AyatTafsir.fromJson(Map<String, dynamic>? json) => AyatTafsir(
        id: Id.fromJson(json?["id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id?.toJson(),
      };
}

class Id {
  Id({
    this.short,
    this.long,
  });

  String? short;
  String? long;

  factory Id.fromJson(Map<String, dynamic>? json) => Id(
        short: json?["short"],
        long: json?["long"],
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
      };
}

class SurahText {
  SurahText({
    this.arab,
    this.transliteration,
  });

  String? arab;
  Transliteration? transliteration;

  factory SurahText.fromJson(Map<String, dynamic>? json) => SurahText(
        arab: json?["arab"],
        transliteration: Transliteration.fromJson(json?["transliteration"]),
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "transliteration": transliteration?.toJson(),
      };
}

class Transliteration {
  Transliteration({
    this.en,
  });

  String? en;

  factory Transliteration.fromJson(Map<String, dynamic>? json) =>
      Transliteration(
        en: json?["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}
