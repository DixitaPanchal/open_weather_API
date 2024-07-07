import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/Pages/WeatherDetail.dart';
import 'package:weatherapp/models/weather_model.dart';

class SharedPref {
  late SharedPreferences preferences;

  Future<void> saveLastSearchedCity(String city) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('last_searched_city', city);
  }

  Future<String?> getLastSearchedCity() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('last_searched_city');
  }

  // Future<void> saveWeatherData(WeatherModel weatherData) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final encodeData = jsonEncode(weatherData);
  //   await prefs.setString('weatherData', encodeData);
  // }

  // Future<WeatherModel?> getWeatherData() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   final encodeData = preferences.getString('weatherData');
  //   if (encodeData != null) {
  //     return WeatherModel.fromJson(jsonDecode(encodeData));
  //   }
  //   else{
  //     return null;
  //   }
  // }
}