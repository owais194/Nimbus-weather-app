import 'package:flutter/material.dart';
import 'package:nimbus/Controllers/service_controller.dart';
import 'package:nimbus/Models/weather_model.dart';

class WeatherController with ChangeNotifier {
  final TextEditingController searchInput =
      TextEditingController(text: "Search City");
  WeatherService weatherService = WeatherService();
  WeatherModel model = WeatherModel();
  Future<void> getData() async {
    model = await weatherService.getWeather(searchInput.text);
  }

  bool initial = true;
  void searchCity() {
    initial = false;

    notifyListeners();
  }
}
