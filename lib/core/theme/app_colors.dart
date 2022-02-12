import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const purple = Color(0xFF5117AC);
  static const green = Color(0xFF20D0C4);
  static const dark = Color(0xFF03011E);
  static const grey = Color(0xFF212738);
  static const lightGrey = Color(0xFFBBBBBB);
  static const veryLightGrey = Color(0xFFF3F3F3);
  static const white = Color(0xFFFFFFFF);
  static const pink = Color(0xFFF56388);
  static const cyan = Color(0xFF0D998C);
  static const red = Color(0xFFD81212);
}

Map<int, Color> materialRedCode = {
  50: const Color(0xFFD81212),
  100: const Color(0xFFD81212),
  200: const Color(0xFFD81212),
  300: const Color(0xFFD81212),
  400: const Color(0xFFD81212),
  500: const Color(0xFFD81212),
  600: const Color(0xFFD81212),
  700: const Color(0xFFD81212),
  800: const Color(0xFFD81212),
  900: const Color(0xFFD81212),
};

MaterialColor materialRed = MaterialColor(0xFFD81212, materialRedCode);