import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/detail_surah.dart';
import 'package:quran_app/models/surah.dart';

void main() async {
  Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
  var res = await http.get(url);

  List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
  Surah surah = Surah.fromJson(data[0]);

  Uri urlSurah =
      Uri.parse("https://api.quran.sutanlab.id/surah/${surah.number}");
  var resSurah = await http.get(urlSurah);

  var dataSurah = (json.decode(resSurah.body) as Map<String, dynamic>)["data"];
  DetailSurah detail = DetailSurah.fromJson(dataSurah);

  print(detail.verses![0].text!.arab);
}
