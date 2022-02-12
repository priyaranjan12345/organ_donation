import 'package:get/get.dart';
import 'package:organ_donation/modules/controller/home_controller/home_controller.dart';

class HomeBondings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
    );
  }
}
