import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {

  Future<WeatherModel> ApiCall(String cityName) async {
    const apiKey = "67f6413fa7926480f0a1e48964103d7a";
    final Url = "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${apiKey}&units=metric";


    final uri = Uri.parse(Url);

    final response = await http.get(uri);


      if (response.statusCode == 200) {

          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final weatherModel = WeatherModel.fromJson(json);
          print("Hii");
          print("Dixita");
          return weatherModel;

      }
      else {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final weatherModel = WeatherModel.fromJson(json);
        return weatherModel;

        }


  }


}