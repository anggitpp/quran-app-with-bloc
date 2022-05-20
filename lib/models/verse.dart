import 'package:quran_app/models/audio.dart';
import 'package:quran_app/models/tafsir.dart';
import 'package:quran_app/models/text.dart';
import 'package:quran_app/models/translation.dart';

import 'meta.dart';
import 'number.dart';

class Verse {
  final Number number;
  final Meta meta;
  final Text text;
  final Translation translation;
  final Audio audio;
  final Tafsir tafsir;
  Verse({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });
}
