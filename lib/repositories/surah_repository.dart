import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/config/constant.dart';

import '../models/detail_surah.dart';
import '../models/surah.dart';

class SurahRepository {
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("$apiURL/surah");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    return data.map((e) => Surah.fromJson(e)).toList();
  }

  Future<DetailSurah> getDetailSurah(int numberSurah) async {
    Uri url = Uri.parse("$apiURL/surah/$numberSurah");
    var res = await http.get(url);

    var data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    DetailSurah detailSurah = DetailSurah.fromJson(data);

    return detailSurah;
  }
}
