import 'package:get/get.dart';
import 'package:organ_donation/modules/controller/organ_donate_form_controller/organ_donate_form_controller.dart';

class OrganDonationFormBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      OrganDonateFormController(),
    );
  }
}
