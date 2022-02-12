import 'package:flutter/material.dart';
import 'package:organ_donation/core/theme/app_colors.dart';

class CustomInputDecoration {
  static final _outlinedBorderLight = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: AppColors.red,
      width: 1.4,
      style: BorderStyle.solid,
    ),
  );
  static InputDecoration inputDecOne() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.veryLightGrey,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 20.0,
      ),
      border: _outlinedBorderLight,
      enabledBorder: _outlinedBorderLight,
      focusedBorder: _outlinedBorderLight,
      hintStyle: const TextStyle(
        color: AppColors.grey,
        fontSize: 16,
      ),
      labelStyle: const TextStyle(
        color: AppColors.red,
      ),
    );
  }
}
