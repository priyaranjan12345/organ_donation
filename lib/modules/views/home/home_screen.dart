import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helper/app_dialog.dart';
import '../../../modules/controller/home_controller/home_controller.dart';
import '../../../modules/routes/app_routes.dart';
import '../home/widgets/app_bar.dart';
import '../home/widgets/drawer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppDialog.showExitgDialog();
        return false;
      },
      child: Scaffold(
        drawer: AppDrawer.appDrawer(),
        appBar: HomeAppBar.homeAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (controller.isSigninWithGoogleAccount) email(context),
            if (!controller.isSigninWithGoogleAccount) phone(context),
          ],
        ),
      ),
    );
  }

  Widget email(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Image(
            image: NetworkImage(controller.imageUrl.value),
          ),
        ),
        Text(
          'Email : ${controller.email}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          'Name : ${controller.name}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.organDonationFomrScreen,
              );
            },
            child: const Text('goto'),
          ),
        )
      ],
    );
  }

  Widget phone(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Phone Number : ${controller.phoneNumber}',
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
