import 'package:intl/intl.dart';

class WeatherModel {
  final String cityName;
  final double temp;
  final String condition;
  final String icon;
  final int humidity;
  final double windSpeed;
  final int dt;


  WeatherModel( 
      {required this.cityName,
      required this.temp,
      required this.condition,
      required this.icon,
      required this.humidity,
      required this.windSpeed, required this.dt});


  factory WeatherModel.fromJson(Map<String, dynamic> json, ) {
    return WeatherModel(
        cityName: json['name'],
        temp: json['main']['temp'],
        condition: json['weather'][0]['main'],
        icon: json['weather'][0]['icon'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'],
        dt: json['dt'],


    );
  }
}
