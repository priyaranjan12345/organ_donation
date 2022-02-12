import 'package:get/get.dart';
import 'package:organ_donation/modules/controller/splash_screen_controller/splash_screen_controller.dart';

class SplashScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashScreenController(),
    );
  }
}
