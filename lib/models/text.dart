import 'package:quran_app/models/translation.dart';

import 'transliteration.dart';

class Text {
  final String arab;
  final Transliteration transliteration;
  Text({
    required this.arab,
    required this.transliteration,
  });
}
