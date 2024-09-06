import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../data/repository/authentication_repository.dart';
import '../../../data/service/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../view/change_pass_sucess_view.dart';

class ForgetPasswordController extends BaseController {
  final authService = Get.find<AuthService>();
  final authRepo = Get.find<AuthenticationRepository>();
  final gmailController = TextEditingController();
  final gmailKey = GlobalKey<FormState>();

  final pinController = TextEditingController();
  final pinKey = GlobalKey<FormState>();

  final passController = TextEditingController();
  final passKey = GlobalKey<FormState>();
  final cfPassController = TextEditingController();
  final cfPassKey = GlobalKey<FormState>();

  void sendEmail() {
    // callDataService(authRepo.sentEmail(email: gmailController.text), onSuccess: (token) async {
    // }, onError: (error) {});
    Get.toNamed(Routes.FORGET_PASS_OTP, arguments: gmailController.text );
  }

  void checkValidRegister() {
    if (gmailKey.currentState?.validate() == false) {
      return;
    }
    if (passKey.currentState?.validate() == false) {
      return;
    }
    if (cfPassKey.currentState?.validate() == false) {
      return;
    }
  }

  void confirm() {
    checkValidRegister();
    Get.to(ChangePassSuccessView());
  }
}
