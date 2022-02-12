import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganDonateFormController extends GetxController {
  final currentIndex = 0.obs;
  final showStepperButton = true.obs;
  final checkBoxValue = false.obs;

  void showTermsAndConditions() {
    Get.defaultDialog(
      barrierDismissible: false,
      radius: 4,
      title: 'Terms and Conditions',
      titleStyle: Theme.of(Get.context!).textTheme.subtitle2!,
      onWillPop: () async {
        return false;
      },
      content: Row(
        children: [
          Obx(
            () => Checkbox(
              value: checkBoxValue.value,
              onChanged: (value) {
                checkBoxValue.value = value!;
              },
            ),
          ),
          const Text('Please accepts our terms and conditions. '),
        ],
      ),
      actions: [
        Obx(
          () => Visibility(
            visible: checkBoxValue.value,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Confirm'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onReady() {
    showTermsAndConditions();
    super.onReady();
  }
}
