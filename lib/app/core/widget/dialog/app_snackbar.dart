
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../values/app_colors.dart';

class AppSnackBar {
  static final FlutterTts _flutterTts = FlutterTts();

  static Future<void> speak(
      {required String text}) async {
    await _flutterTts.setLanguage("vi-VN");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);

    if (text.isNotEmpty) {
      await _flutterTts.speak(text);
    }
  }

  static final _audioPlayer = AudioPlayer();

  static Future<void> playSound(String filePath) async {
    try {
      await _audioPlayer.setAsset(filePath);
      await _audioPlayer.play();
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  static void showSuccess({String? title, String? message}) {
    Get.snackbar(
      title ?? "Thành công",
      message ?? "Empty message",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  static void showIsEmpty({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      messageText: Text(
        "$message",
        style: const TextStyle(color: AppColors.primary),
      ),
      backgroundColor: Colors.white,
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      borderRadius: 15,borderColor: AppColors.primary,
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }

  static void showUpdateSuccess({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.green,
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      borderRadius: 15,
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }

  static showWarning({String? title, String? message}) {
    Get.snackbar(
      title ?? "Warning",
      message ?? "Empty message",
      backgroundColor: Colors.amber,
      colorText: Colors.white,
    );
  }

  static void showError({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.red,
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      borderRadius: 15,
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }

  static void success({String? title, String? message, String? voiceText}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.white,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color(0xFF08B123),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Thêm thùng thành công',
                style: TextStyle(color: Color(0xFF08B123)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      borderColor: const Color(0xFF08B123),
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
    speak(text: 'Có');
  }

  static void failureCreate({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.white,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
               Text(
                title!,
                style: const TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      borderColor: AppColors.primary,
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }

  static void failure({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.white,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "Không tìm thấy thùng",
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      borderColor: AppColors.primary,
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }

  static void failureShipNote({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.white,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "Vui lòng điền đầy đủ thông tin",
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      borderColor: AppColors.primary,
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }

 static void successShipNote({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.white,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color(0xFF08B123),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Thêm ghi chú thành công',
                style: TextStyle(color: Color(0xFF08B123)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      borderColor: const Color(0xFF08B123),
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }


  static void notFoundBox({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.white,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Vui lòng quét ít nhất 1 mã để trả hàng',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      borderColor: AppColors.primary,
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }

  static void successAll({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.white,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color(0xFF08B123),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Trả hàng thành công',
                style: TextStyle(color: Color(0xFF08B123)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      borderColor: const Color(0xFF08B123),
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }

  static void receiveAll({String? title, String? message}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(GetSnackBar(
      message: message ?? "Empty message",
      backgroundColor: Colors.white,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color(0xFF08B123),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Nhận hàng thành công',
                style: TextStyle(color: Color(0xFF08B123)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(16),
      animationDuration: const Duration(milliseconds: 500),
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      borderColor: const Color(0xFF08B123),
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
    ));
  }
}
