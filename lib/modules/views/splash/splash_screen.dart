import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/splash_screen_controller/splash_screen_controller.dart';
import '../../../core/constants/app_assets_path.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_sizes.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssetsPath.organDonationLogo,
            height: AppSizes.imageHeight,
          ),
          Text(
            AppStrings.splashScrrenTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            AppStrings.splashScrrenSubTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
