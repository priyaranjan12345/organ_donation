import 'package:getxfire/getxfire.dart';
import 'package:organ_donation/data/firebase/auth/firebase_auth.dart';

class HomeController extends GetxController {
  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();
  bool isSigninWithGoogleAccount = false;
  var fireauth = GetxFire.auth;
  final email = ''.obs;
  final name = ''.obs;
  final imageUrl = ''.obs;
  final phoneNumber = ''.obs;

  checkAccountType() {
    var user = fireauth.currentUser;
    if (user != null) {
      if (user.email != null) {
        isSigninWithGoogleAccount = true;
        email.value = user.email!;
        name.value = user.displayName!;
        imageUrl.value = user.photoURL!;
      } else {
        isSigninWithGoogleAccount = false;
        phoneNumber.value = user.phoneNumber!;
      }
    }
  }

  @override
  void onInit() {
    checkAccountType();
    super.onInit();
  }
}
