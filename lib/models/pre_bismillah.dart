import 'package:quran_app/models/translation.dart';

import 'audio.dart';
import 'text.dart';

class PreBismillah {
  final Text text;
  final Translation translation;
  final Audio audio;
  PreBismillah({
    required this.text,
    required this.translation,
    required this.audio,
  });
}
