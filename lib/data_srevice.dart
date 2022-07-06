import 'dart:convert';

import 'package:clima_android/json_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    // 1fb8dd4869f49b28d128e3bcf0c6165a

    final queryparameter = {
      'q': city,
      'appid': '1fb8dd4869f49b28d128e3bcf0c6165a',
      'units': 'imperial'
    };

    final uri =
        Uri.http('api.openweathermap.org', '/data/2.5/weather', queryparameter);
    final response = await http.get(uri);
    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
