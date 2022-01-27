import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organ_donation/data/firebase/auth/firebase_auth.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  final FirebaseAuthentication _firebaseAuthentication =
      FirebaseAuthentication();

  Future<bool> phoneNumberVerification() async {
    bool isValidPhoneNumber = await _firebaseAuthentication
        .verifyPhoneNumber(phoneNumberController.text);
    return isValidPhoneNumber;
  }

  // Future<bool> resendOtp() async{
  //   _firebaseAuthentication.resendOTP(phoneNumberController.text);
  // }

  Future<bool> signInWithGoogle() async {
    bool isSucessfullyLogin = await _firebaseAuthentication.fireLogin();
    return isSucessfullyLogin;
  }
}
