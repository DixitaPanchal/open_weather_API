import 'package:flutter/material.dart';
import 'package:weatherapp/style/textStyle.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintTxt;

  const TextFieldWidget({super.key, required this.controller, required this.hintTxt});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppWidget.HeadTexting2(),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_pin,),
          hintText: hintTxt,
          hintStyle: AppWidget.SimpleText(),
          filled: true,
          fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.black12, width: 2,)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),

            borderSide: BorderSide(
              color: Colors.black,
            ),

          )


      ),




    );
  }
}
