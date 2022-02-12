import 'dart:async';

import 'package:get/get.dart';
import 'package:organ_donation/modules/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  final isLoggedIn = false.obs;
  @override
  void onReady() {
    super.onReady();
    Timer(const Duration(seconds: 2), () async {
      Get.offAllNamed(AppRoutes.loginPage);
    });
  }
}
