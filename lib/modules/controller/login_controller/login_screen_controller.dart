import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:organ_donation/modules/routes/app_routes.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignin = GoogleSignIn();
  // String? _verificationId;
  // int? _resendToken;

  Future<void> phoneNumberVerification() async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91 ' + phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            log('The provided phone number is Invalid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          log('Check your phone');

          var data = {
            'resendToke': resendToken.toString(),
            'verificationId': verificationId,
            'phoneNumber': phoneNumberController.text,
          };
          Get.toNamed(AppRoutes.otpPage, parameters: data);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          //_verificationId = verificationId;
        },
      );
    } catch (e) {
      log('sign in phone : $e');
    }
  }

  Future<void> signInWithGoogle() async {
    await GetxFire.showProgressHud();

    try {
      if (await _googleSignin.isSignedIn()) {
        await _googleSignin.disconnect();
      }
    } catch (e) {
      log('error signin google : $e');
    }

    try {
      await GetxFire.signInWithGoogle(
        onSuccess: (userCredential) async {
          if (userCredential != null) {
            final user = userCredential.user;
            await GetxFire.hideProgressHud();
            if (user != null) {
              Get.offAllNamed(AppRoutes.homePage);
            }
          }
        },
        onError: (code, message) async {
          log('Error on firelogin');
        },
      );
      await GetxFire.hideProgressHud();
    } catch (e) {
      log('getxfire error: $e');
    }
  }
}
