import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/constants/app_assets_path.dart';
import '../../core/constants/app_strings.dart';
import '../../modules/controller/otp_screen_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';

class VerifyOTPScreen extends GetView<OtpScreenController> {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.verticalPadding,
            horizontal: AppSizes.horizentalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.verifyOtpScreenTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                AppAssetsPath.otpVerifyLogo,
                height: AppSizes.verifyOtpLogoImageHeight,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.otpTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
              ),
              Text(
                AppStrings.otpSubTitle +
                    Get.parameters['phoneNumber'].toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 20,
              ),
              PinCodeTextField(
                errorTextSpace: 0,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                appContext: context,
                length: 6,
                obscureText: true,
                controller: controller.otpController,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  borderWidth: 1.4,
                  fieldHeight: 46,
                  fieldWidth: 40,
                  activeFillColor: AppColors.lightGrey,
                ),
                keyboardType: TextInputType.number,
                //enableActiveFill: true,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onChanged: (v) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    AppStrings.resendOtp,
                    style: TextStyle(
                      color: AppColors.purple,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      letterSpacing: 0.4,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      height: 1.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  bool status = await controller.otpVerification();
                  if (status) {
                    Get.offAllNamed(AppRoutes.homePage);
                  } else {}
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(AppStrings.verifyOtpButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
