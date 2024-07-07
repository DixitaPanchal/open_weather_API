import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/Screens/mobile_screen_layout.dart';
import 'package:weatherapp/Screens/tablet_screen_layout.dart';
import 'package:weatherapp/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(mobilebody: MobileScreenLayout(), tabletbody: TabScreenLayout()),
    );
  }

}
