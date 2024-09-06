import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../values/app_colors.dart';

class Loaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  // static customToast({required message}) {
  //   ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
  //     elevation: 0,
  //     duration: const Duration(seconds: 2),
  //     backgroundColor: Colors.transparent,
  //     content: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 70),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: HelperFunctions.isDarkMode(Get.context!)
  //             ? ColorApp.dark.withOpacity(0.9)
  //             : ColorApp.grey.withOpacity(0.9),
  //       ),
  //       child: Center(
  //         child: Text(
  //           message,
  //           style: Theme.of(Get.context!).textTheme.bodyMedium,
  //         ),
  //       ),
  //     ),
  //   ));
  // }

  static successSnackBar({required title, message = '', duration = 500}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        backgroundColor: AppColors.black,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: duration),
        margin: const EdgeInsets.all(10),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ));
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.white,
        ));
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      padding: const EdgeInsets.symmetric(vertical: 4),
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(16),
        borderRadius: 4,
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.white,
        ));
  }


}
