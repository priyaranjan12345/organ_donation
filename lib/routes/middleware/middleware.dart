import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:organ_donation/routes/app_routes.dart';

class AppMiddleware extends GetMiddleware {
  var fireauth = GetxFire.auth;

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (route == AppRoutes.loginPage) {
      return fireauth.currentUser == null
          ? null
          : const RouteSettings(name: AppRoutes.homePage);
    } else {
      return fireauth.currentUser == null
          ? const RouteSettings(name: AppRoutes.loginPage)
          : null;
    }
  }
}
