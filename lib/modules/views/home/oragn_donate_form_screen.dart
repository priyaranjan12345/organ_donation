import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxfire/getxfire.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_input_decoration.dart';
import '../../../modules/controller/organ_donate_form_controller/organ_donate_form_controller.dart';

class OrganDonateFormScreen extends GetView<OrganDonateFormController> {
  const OrganDonateFormScreen({Key? key}) : super(key: key);

  Widget _fab(BuildContext context) => SizedBox(
        width: Get.context!.width * 0.9,
        child: Obx(
          () => Visibility(
            visible: controller.showStepperButton.value,
            child: ElevatedButton(
              onPressed: () {
                if (controller.currentIndex < 3) {
                  controller.currentIndex.value++;
                } else {
                  //last step
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Obx(
                  () => Text(
                    controller.currentIndex.value == 3 ? 'Confirm' : 'Next',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  List<Step> _getSteps(BuildContext context) => [
        Step(
          title: const Text(''),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Persional Information',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      height: 0.4,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: CustomInputDecoration.inputDecOne().copyWith(
                  label: const Text('Enter Your Full Name'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: CustomInputDecoration.inputDecOne().copyWith(
                  prefix: const Text('+91 '),
                  label: const Text('Enter Your Contact Number'),
                ),
              ),
            ],
          ),
          isActive: controller.currentIndex.value == 0,
          state: controller.currentIndex.value > 0
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text(''),
          content: Column(
            children: [
              Text(
                'Like To Donate Organs',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      height: 0.4,
                      fontSize: 20,
                    ),
              ),
            ],
          ),
          isActive: controller.currentIndex.value == 1,
          state: controller.currentIndex.value > 1
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text(''),
          content: Column(
            children: [
              Text(
                'Health Information',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      height: 0.4,
                      fontSize: 20,
                    ),
              ),
            ],
          ),
          isActive: controller.currentIndex.value == 2,
          state: controller.currentIndex.value > 2
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text(''),
          content: Column(
            children: [
              Text(
                'Confirmation',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      height: 0.4,
                      fontSize: 20,
                    ),
              ),
            ],
          ),
          isActive: controller.currentIndex.value == 3,
          state: controller.currentIndex.value > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ];

  Widget _stepper(BuildContext context) => Obx(
        () => Stepper(
          elevation: 0.4,
          currentStep: controller.currentIndex.value,
          type: StepperType.horizontal,
          steps: _getSteps(context),
          onStepTapped: (value) {
            controller.currentIndex.value = value;
          },
          controlsBuilder: (context, _) {
            return const SizedBox();
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    controller.showStepperButton.value =
        !(MediaQuery.of(context).viewInsets.bottom > 0);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (controller.currentIndex > 0) {
            controller.currentIndex.value--;
          } else {
            Get.back();
          }
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Organ Donation Form'),
            centerTitle: true,
          ),
          body: _stepper(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: _fab(context),
        ),
      ),
    );
  }
}
