import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/firebase/auth/firebase_auth.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';

class AppDrawer {
  static Drawer appDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.red,
            ),
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: AppColors.lightGrey,
                    radius: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('App Drawer'),
                ),
              ],
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  'Options',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {},
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  'Accounts',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text('Edit Profile'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('SignOut'),
            onTap: () async {
              await FirebaseAuthentication().fireLogout();
              Get.offAllNamed(AppRoutes.loginPage);
            },
          ),
        ],
      ),
    );
  }
}
