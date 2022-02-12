import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organ_donation/core/helper/loading_dialog.dart';
import 'package:organ_donation/modules/controller/home_controller.dart';

import '../home/widgets/app_bar.dart';
import '../home/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.find();
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
            if (_homeController.isSigninWithGoogleAccount) email(),
            if (!_homeController.isSigninWithGoogleAccount) phone(),
          ],
        ),
      ),
    );
  }

  Widget email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Image(
            image: NetworkImage(_homeController.imageUrl.value),
          ),
        ),
        Text(
          'Email : ${_homeController.email}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          'Name : ${_homeController.name}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  Widget phone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Phone Number : ${_homeController.phoneNumber}',
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
