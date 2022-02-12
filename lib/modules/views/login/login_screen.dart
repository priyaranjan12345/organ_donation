import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_input_decoration.dart';
import '../../../core/constants/app_assets_path.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/helper/app_dialog.dart';
import '../../../core/theme/app_sizes.dart';
import '../../controller/login_controller/login_screen_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppDialog.showExitgDialog();
        return false;
      },
      child: SafeArea(
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
                  AppStrings.loginScreenTitle,
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
                  AppStrings.phoneNumberTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                ),
                Text(
                  AppStrings.phoneNumberSubTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: CustomInputDecoration.inputDecOne().copyWith(
                    prefix: const Text(AppStrings.countryCode),
                    label: const Text('Phone Number'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await controller.phoneNumberVerification();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(AppStrings.sendOtp),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  AppStrings.orSignInWith,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: SignInButton(
                    Buttons.Google,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    text: "Google Account",
                    elevation: 6,
                    onPressed: () async {
                      await controller.signInWithGoogle();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
