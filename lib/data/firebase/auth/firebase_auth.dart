import 'dart:developer';

import 'package:getxfire/getxfire.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignin = GoogleSignIn();
  String? _verificationId;
  int? _resendToken;

  // make this class as singletone class
  static final FirebaseAuthentication _firebaseAuthentication =
      FirebaseAuthentication._internal();
  FirebaseAuthentication._internal();

  factory FirebaseAuthentication() {
    return _firebaseAuthentication;
  }

  //getxfire
  Future<bool> fireLogin() async {
    bool isSucess = false;
    await GetxFire.showProgressHud();

    try {
      if (await _googleSignin.isSignedIn()) {
        await _googleSignin.disconnect();
      }
    } catch (_) {}
    try {
      await GetxFire.signInWithGoogle(
        //isErrorDialog: true,
        //isSuccessDialog: true,
        onSuccess: (userCredential) async {
          if (userCredential != null) {
            final user = userCredential.user;
            await GetxFire.hideProgressHud();
            if (user != null) {
              //sucess
              isSucess = true;
            } else {
              isSucess = false;
            }
          }
        },
        onError: (code, message) async {
          log('Error on firelogin');
          isSucess = false;
        },
      );
      await GetxFire.hideProgressHud();
    } catch (e) {
      isSucess = false;
    }
    return isSucess;
  }

  Future<bool> fireLogout() async {
    bool isSuccessfullyLogout = false;
    await GetxFire.showProgressHud();
    try {
      await GetxFire.signOut(isSocialLogout: true);
      //sucess
      isSuccessfullyLogout = true;
    } catch (e) {
      isSuccessfullyLogout = false;
    }

    await GetxFire.hideProgressHud();
    return isSuccessfullyLogout;
  }

  //phone number
  Future<bool> verifyPhoneNumber(String phoneNumvber) async {
    bool isSucess = true;
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91 ' + phoneNumvber,
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
          //sucess
          _verificationId = verificationId;
          _resendToken = resendToken;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          //_verificationId = verificationId;
        },
      );
    } catch (e) {
      isSucess = false;
    }

    return isSucess;
  }

  Future<bool> verifyOtp(String otp) async {
    bool isSucess = false;
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );
      await _firebaseAuth.signInWithCredential(credential);

      isSucess = true;
    } catch (e) {
      isSucess = false;
    }
    return isSucess;
  }

  void resendOTP(String phoneNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+91 " + phoneNumber,
      timeout: const Duration(seconds: 10),
      forceResendingToken: _resendToken,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException authException) {
        log('Phone number verification failed. Code: '
            '${authException.code.toString()} Message: ${authException.message.toString()}');
      },
      codeSent: (String verificationId, int? resentId) async {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }
}
