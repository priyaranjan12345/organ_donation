import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organ_donation/modules/routes/app_routes.dart';

class OtpScreenController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController otpController = TextEditingController();
  String? verificationIdOTP;
  int? resendTokenOTP;
  int isSecondTime = 0;

  Future<void> verifyOTP(String verificationId) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text,
      );
      await _firebaseAuth.signInWithCredential(credential);

      Get.offAllNamed(AppRoutes.homePage);
    } catch (e) {
      log('error verify otp: $e');
    }
  }

  Future<void> resendOtp(String phoneNumber, int resendTokenR) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+91 " + phoneNumber,
      timeout: const Duration(seconds: 10),
      forceResendingToken: isSecondTime == 0 ? resendTokenR : resendTokenOTP,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException authException) {
        log(
          'Phone number verification failed. Code: '
          '${authException.code.toString()} Message: ${authException.message.toString()}',
        );
      },
      codeSent: (String verificationId, int? resentId) async {
        resendTokenOTP = resentId;
        verificationIdOTP = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationIdOTP = verificationId;
      },
    );

    isSecondTime++;
  }
}
