import 'package:get/get.dart';

import '../bindings/home_bindings/home_bindings.dart';
import '../bindings/login_bindings/login_bindings.dart';
import '../bindings/organ_donate_form_bindings/organ_donate_form_bindings.dart';
import '../bindings/otp_bindings/otp_bindings.dart';
import '../bindings/splash_screen_bindings/splash_screen_bindings.dart';
import '../routes/middleware/middleware.dart';
import '../views/home/oragn_donate_form_screen.dart';
import '../routes/app_routes.dart';
import '../views/home/home_screen.dart';
import '../views/login/login_screen.dart';
import '../views/login/verify_otp_screen.dart';
import '../views/splash/splash_screen.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.splashPage;

  static final pages = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      binding: SplashScreenBindings(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
      binding: LoginBindings(),
      middlewares: [AppMiddleware()],
    ),
    GetPage(
      name: AppRoutes.otpPage,
      page: () => const VerifyOTPScreen(),
      transition: Transition.fadeIn,
      binding: OtpBindings(),
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      binding: HomeBondings(),
      middlewares: [AppMiddleware()],
    ),
    GetPage(
      name: AppRoutes.organDonationFomrScreen,
      page: () => const OrganDonateFormScreen(),
      transition: Transition.fadeIn,
      binding: OrganDonationFormBindings(),
    ),
  ];
}
