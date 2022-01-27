import 'package:get/get.dart';
import 'package:organ_donation/modules/controller/otp_screen_controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      OtpScreenController(),
    );
  }
}
