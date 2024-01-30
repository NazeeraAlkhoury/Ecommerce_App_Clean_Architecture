import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColorsLight {
  //static Color primaryColor = HexColor('#a50b5e');
  static const MaterialColor primaryColor = MaterialColor(
    0xffc71585, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffce5641), //10%
      100: Color(0xffb74c3a), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );
  static Color ligtGrey = HexColor('#9E9E9E');
  static Color grey = HexColor('#737477');
  static Color darkGrey = HexColor('#525252');
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static Color scaffoldColor = HexColor('#ffffff');
}

//#c71585 | rgb(199,21,133)
// const Color(0xFFc71585);

//#c154c1 | rgb(193,84,193)
//#a50b5e | rgb(165,11,94)