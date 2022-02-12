import 'package:flutter/material.dart';
import 'package:organ_donation/core/theme/app_colors.dart';

final _otlinedBorderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: AppColors.red,
    width: 1.4,
    style: BorderStyle.solid,
  ),
);

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    primaryColor: materialRed,
    primarySwatch: materialRed,
    scaffoldBackgroundColor: AppColors.white,
    bottomAppBarColor: AppColors.red,
    appBarTheme: const AppBarTheme(
      color: AppColors.red,
      elevation: 1,
      toolbarTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(color: AppColors.green),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: AppColors.veryLightGrey,
    //   contentPadding: const EdgeInsets.symmetric(
    //     vertical: 16,
    //     horizontal: 20.0,
    //   ),
    //   border: _otlinedBorderLight,
    //   enabledBorder: _otlinedBorderLight,
    //   focusedBorder: _otlinedBorderLight,
    //   hintStyle: const TextStyle(
    //     color: AppColors.grey,
    //     fontSize: 16,
    //   ),
    //   labelStyle: const TextStyle(
    //     color: AppColors.red,
    //   ),
    // ),
    iconTheme: const IconThemeData(
      color: AppColors.cyan,
    ),
    textTheme: _lightTextTheme,
  );

  final darkTheme = ThemeData(
    textTheme: _darkTextTheme,
  );

  // Text themeing
  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _titleLight,
    headline2: _title2Light,
    subtitle1: _subTitleLight,
    subtitle2: _subTitle2Light,
    bodyText1: _bodyTextLight,
    button: _buttonLight,
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _titleDark,
    subtitle1: _subTitleDark,
    bodyText1: _bodyTextDark,
    button: _buttonDark,
  );

  static const TextStyle _titleLight = TextStyle(
    color: AppColors.cyan,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontSize: 22,
    height: 1.5,
  );
  static const TextStyle _title2Light = TextStyle(
    color: AppColors.red,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    height: 1.5,
  );
  static const TextStyle _subTitleLight = TextStyle(
    color: AppColors.cyan,
    fontFamily: 'Roboto',
    height: 1.5,
  );
  static const TextStyle _subTitle2Light = TextStyle(
    color: AppColors.cyan,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 1.5,
  );
  static const TextStyle _buttonLight = TextStyle(
      // color: Colors.black,
      // fontSize: 2.5 * 1,
      );
  static const TextStyle _bodyTextLight = TextStyle(
    // color: Colors.black,
    fontWeight: FontWeight.bold,
    // fontSize: 2 * 1,
  );

  static final TextStyle _buttonDark = _buttonLight.copyWith(
      // color: Colors.white70,
      );
  static final TextStyle _subTitleDark = _subTitleLight.copyWith(
      // color: Colors.white70,
      );
  static final TextStyle _titleDark = _titleLight.copyWith(
      // color: Colors.white70,
      );
  static final TextStyle _bodyTextDark = _bodyTextLight.copyWith(
      // color: Colors.white70,
      );
}
