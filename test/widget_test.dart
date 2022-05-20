import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
  var res = await http.get(url);

  print(res.body);
}
