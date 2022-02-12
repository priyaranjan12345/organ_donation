import 'package:flutter/material.dart';

class HomeAppBar {
  static AppBar homeAppBar() {
    return AppBar(
      title: const Text('Organ Donation'),
      centerTitle: true,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        },
      ),
    );
  }
}
