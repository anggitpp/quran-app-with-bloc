import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/ayat.dart';
import 'package:quran_app/models/detail_surah.dart';
import 'package:quran_app/models/surah.dart';

void main() async {
  Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/1/1");
  var res = await http.get(url);

  Map<String, dynamic> data = json.decode(res.body)["data"];

  Ayat ayat = Ayat.fromJson(data);

  print(ayat.number!.inSurah);
}
