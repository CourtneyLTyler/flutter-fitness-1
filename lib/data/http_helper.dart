import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/weather.dart';

class HttpHelper {
  // https://api.openweathermap.org/data/2.5/weather?q=london&appid=ad501c79b4f2a840948b460f0f2a3360
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'ad501c79b4f2a840948b460f0f2a3360';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
