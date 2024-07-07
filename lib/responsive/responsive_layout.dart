import 'package:flutter/material.dart';
import 'package:weatherapp/responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobilebody;
  final Widget tabletbody;
  
  const ResponsiveLayout({super.key, required this.mobilebody, required this.tabletbody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth<mobileWidth){
        return mobilebody;
      }
      else if(constraints.maxWidth<tabWidth){
        return tabletbody;
      }
      else
        {
          return const Text("Desktop");
        }
    });
  }
}
