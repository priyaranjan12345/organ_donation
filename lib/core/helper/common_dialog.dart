import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialog {
  static void showErrorDialog({
    String? title,
    String? description,
    DialogType? dialogType,
    int? backTimes = 1,
    VoidCallback? callback,
    String? buttonName,
  }) {
    Get.defaultDialog(
      content: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: Get.context!.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 16,
                  right: 16,
                  bottom: 12,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description ?? '',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    const Divider(
                      thickness: 1.4,
                    ),
                    TextButton(
                      onPressed: () {
                        if (callback != null) {
                          Get.back();
                          callback();
                        } else {
                          Get.back();
                        }
                      },
                      child: Text(
                        buttonName ?? 'OK',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -38,
                //right: 80,
                // child: CircleAvatar(
                //   minRadius: 16,
                //   maxRadius: 34,
                //   backgroundColor: _getStatusColor(dialogType!),
                child: CircleAvatar(
                  child: _getStatusIcon(dialogType!),
                  minRadius: 16,
                  maxRadius: 34,
                  // size: 28,
                  backgroundColor: Colors.transparent,
                ),
              ),
              //)
            ],
          ),
        ),
      ),
    );
  }

  static void showToast({@required String? title, @required String? message}) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.snackbar(
      title!,
      message!,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[700],
      borderRadius: 20,
      margin: const EdgeInsets.all(10),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      //dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void showLoading() {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 8),
            Text('Loading...')
          ],
        ),
      ),
    ));
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}

enum DialogType {
  // ignore: constant_identifier_names
  SUCCESS,
  // ignore: constant_identifier_names
  ERROR,
  // ignore: constant_identifier_names
  WARNING,
}

// Color _getStatusColor(DialogType customData) {
//   if (customData is DialogType) {
//     switch (customData) {
//       case DialogType.ERROR:
//         return Colors.red;
//       case DialogType.WARNING:
//         return Colors.amber;
//       default:
//         return Colors.green;
//     }
//   } else {
//     return Colors.green;
//   }
// }

_getStatusIcon(DialogType dialogType) {
  switch (dialogType) {
    case DialogType.ERROR:
      return Image.asset("assets/img/error.png");
    case DialogType.WARNING:
      return Image.asset("assets/img/warning.png");

    default:
      return Image.asset("assets/img/success.png");
  }
}
