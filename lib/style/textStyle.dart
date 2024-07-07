

import 'package:flutter/material.dart';

class AppWidget{

  static TextStyle HeadTextingBold() {
    return TextStyle(
        color: Colors.white,
        fontFamily: "LeagueSpartan",
        fontSize: 30,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle ButtonText() {
    return TextStyle(
        color: Colors.white,
        fontFamily: "LeagueSpartan",
        fontSize: 22,
        fontWeight: FontWeight.bold
    );
  }
  static TextStyle HeadTexting2(){
    return TextStyle(
        color: Colors.white,
        fontFamily: "LeagueSpartan-Black",
        fontSize: 22,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle SimpleText(){
    return TextStyle(
      color: Colors.grey,
      fontSize: 18,
    );
  }

  static TextStyle hintstlye(){
    return TextStyle(
      color: Colors.white,
      fontSize: 15,
    );

  }

  static TextStyle SimpleText2(){
    return TextStyle(
      color: Colors.white,
      fontSize: 20,
    );

  }

  static TextStyle SimpleTextBold(){
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );

  }


}