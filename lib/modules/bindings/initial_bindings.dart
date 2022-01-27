import 'package:get/get.dart';
import 'package:organ_donation/modules/controller/common_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CommonController(),
    );
  }
}
