
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/Pages/WeatherDetail.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/responsive/dimensions.dart';
import 'package:weatherapp/services/sharedpref_service.dart';
import 'package:weatherapp/style/textStyle.dart';
import 'package:weatherapp/widgets/textField.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  final TextEditingController _cityName = TextEditingController();

  SharedPref pref = SharedPref();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final prov =  Provider.of<WeatherProvider>(context, listen: false).getAllData(_cityName.text);
    });

  }

  void _validateCity() {
    final regex = RegExp(r'^[a-zA-Z\s-]+$');
    if (_cityName.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Pleas enter the city name")));
    } else if (!regex.hasMatch(_cityName.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter the correct name")));
    } else if (_cityName.text.isNotEmpty && regex.hasMatch(_cityName.text)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WeatherDetails()));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen", style: AppWidget.HeadTexting2()),
      ),
      body: Column(
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFieldWidget(controller: _cityName, hintTxt: "Enter the city"),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () async {

                await Provider.of<WeatherProvider>(context, listen: false)
                    .getAllData(_cityName.text);

                _validateCity();
              },


              child: Text("Get Weather")),
        ],
      ),
    );
  }
}
