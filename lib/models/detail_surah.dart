import 'name.dart';
import 'pre_bismillah.dart';
import 'revelation.dart';
import 'tafsir.dart';
import 'verse.dart';

class DetailSurah {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final Name name;
  final Revelation revelation;
  final Tafsir tafsir;
  final PreBismillah preBismillah;
  final List<Verse> verses;
  DetailSurah({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
    required this.preBismillah,
    required this.verses,
  });
}
