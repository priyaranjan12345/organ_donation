import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organ_donation/core/theme/app_theme.dart';
import 'package:organ_donation/modules/bindings/initial_bindings.dart';
import 'package:organ_donation/routes/app_pages.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        mediaQueryData: MediaQuery.of(context).copyWith(
          devicePixelRatio: 1.0,
          textScaleFactor: 1.0,
        ),
        breakpoints: const [
          ResponsiveBreakpoint.autoScale(450, name: MOBILE),
          ResponsiveBreakpoint.resize(600, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.resize(2460, name: '4K'),
        ],
        breakpointsLandscape: const [
          ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE, scaleFactor: 1),
          ResponsiveBreakpoint.autoScaleDown(800, name: TABLET, scaleFactor: 1),
          ResponsiveBreakpoint.autoScaleDown(1000,
              name: TABLET, scaleFactor: 1),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP, scaleFactor: 1),
          ResponsiveBreakpoint.resize(2460, name: "4K", scaleFactor: 1),
        ],
        background: Container(
          color: Colors.transparent,
        ),
      ),
      initialBinding: InitialBindings(),
      theme: AppTheme.lightTheme,
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
    );
  }
}
