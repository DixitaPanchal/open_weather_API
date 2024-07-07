import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/sharedpref_service.dart';
import 'package:weatherapp/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier{

  WeatherService service = WeatherService();
  WeatherModel? _weather;
  bool isLoading = false;
  String _lastSearchedCity = "";
  SharedPref pref = SharedPref();


  WeatherModel? get weatherModel => _weather;
  String? get lastSearchedCity => _lastSearchedCity;

  WeatherProvider() {
    pref.getLastSearchedCity();
  }


  Future<void> getAllData(String cityName) async {

      isLoading = true;
      notifyListeners();
      print("Provider");

    try {
      _weather = await service.ApiCall(cityName);
      _lastSearchedCity = cityName;
      await pref.saveLastSearchedCity(cityName);
      final prov = await pref.getLastSearchedCity();
      print("Hello");
      print(prov);
      print("Provide");
    }
    catch(E){
      print(E.toString());
    }

    finally {
      isLoading = false;
      notifyListeners();
    }


  }





}