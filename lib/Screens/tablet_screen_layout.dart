import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/style/textStyle.dart';
import 'package:weatherapp/widgets/textField.dart';

import '../Pages/WeatherDetail.dart';
import '../provider/weather_provider.dart';
import '../services/sharedpref_service.dart';

class TabScreenLayout extends StatefulWidget {
  const TabScreenLayout({super.key});

  @override
  State<TabScreenLayout> createState() => _TabScreenLayoutState();
}

class _TabScreenLayoutState extends State<TabScreenLayout> {

  final TextEditingController _cityName = TextEditingController();

  SharedPref pref = SharedPref();

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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final prov =  Provider.of<WeatherProvider>(context, listen: false).getAllData(_cityName.text);
    });

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



