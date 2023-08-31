import 'package:flutter/material.dart';

const primaryColor = Colors.blue;
const secondColor = Colors.grey;
const colorGery2 = Colors.blueGrey;
const authBorderColor=Color(0xffF3F3F3);
const colorWhite2 = Color(0xffF1F1F1);
const colorLModeAccentGrey = Color(0xff707070);


final colorWhiteWithOpacity = const Color(0xffffffff).withOpacity(.6);
MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;

  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };

  return MaterialColor(color.value, shades);
}