import 'package:get/get.dart';
import 'package:organ_donation/modules/controller/login_screen_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(),
    );
  }
}
