import 'dart:convert';

import 'package:nimbus/Models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=e360a57ee321acaf083d45218a5c39ce&units=metric'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        return WeatherModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
