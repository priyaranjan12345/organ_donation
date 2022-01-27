import 'package:get/get.dart';
import 'package:organ_donation/modules/bindings/home_bindings.dart';
import 'package:organ_donation/modules/bindings/login_bindings.dart';
import 'package:organ_donation/modules/bindings/otp_bindings.dart';
import 'package:organ_donation/routes/middleware/middleware.dart';
import 'package:organ_donation/views/home/home_screen.dart';

import '../routes/app_routes.dart';
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
  ];
}
