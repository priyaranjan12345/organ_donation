import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organ_donation/data/firebase/auth/firebase_auth.dart';

class OtpScreenController extends GetxController {
  TextEditingController otpController = TextEditingController();
  final FirebaseAuthentication _firebaseAuthentication =
      FirebaseAuthentication();
  Future<bool> otpVerification() async {
    bool isValidOtp =
        await _firebaseAuthentication.verifyOtp(otpController.text);
    return isValidOtp;
  }
}
