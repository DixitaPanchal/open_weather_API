import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/responsive/dimensions.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/style/textStyle.dart';

class WeatherDetails extends StatefulWidget {
  const WeatherDetails({super.key});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  bool isLoading = false;

  // Widget _dateTime()  {
  //   DateTime? now = weather!.date;
  //   return Column(
  //     children: [
  //       Text(DateFormat("h.mm a").format(now!))
  //
  //     ],
  //   );
  //
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Details Screen"),
      ),
      body: provider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<WeatherProvider>(builder: (context, value, child) {
              final weather = value.weatherModel!;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        weather.cityName,
                        style: AppWidget.HeadTextingBold(),
                      ),
                      Text("${weather.temp.round().toString()} °C", style: AppWidget.HeadTexting2()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.network(
                              "http://openweathermap.org/img/wn/${weather.icon}@4x.png" ?? " ",
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Text(weather.condition, style: AppWidget.SimpleText2(),),

                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.water_drop, size: 18,),
                              const SizedBox(width: 10,),
                              Text("Humidity: ${weather.humidity.toString()} %", style: AppWidget.SimpleText2(),),

                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.wind_power, size: 18),
                              const SizedBox(width: 10,),
                              Text("Windspeed: ${weather.windSpeed.toString()} m/s", style: AppWidget.SimpleText2(),),

                            ],
                          ),
                          SizedBox(height: 50,),

                          ElevatedButton(
                              onPressed: () {
                                provider.getAllData(weather.cityName);
                              },
                              child: Text("Refresh"))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
    );
  }
}
