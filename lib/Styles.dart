import 'dart:ui';
import 'package:flutter/cupertino.dart';

const Color backGround = Color(0xFFDEEAF7);
const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);

class ThemeText {
  static const TextStyle Degree = TextStyle(
    color: black,
    fontSize: 64,
    height: 1.5,
    fontWeight: FontWeight.w100,
  );
  static const TextStyle weather_condition = TextStyle(
    fontFamily: 'Montserrat',
    color: black,
    fontSize: 36,
    height: 1,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle Place = TextStyle(
    fontFamily: 'Montserrat',
    color: black,
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle info = TextStyle(
    fontFamily: 'Montserrat',
    color: black,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle values = TextStyle(
    fontFamily: 'Montserrat',
    color: black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
}
