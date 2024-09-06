import 'dart:async';

import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../data/service/auth_service.dart';
import '../../../routes/app_pages.dart';

class AuthenticationController extends BaseController {
  final auth = Get.find<AuthService>();

  @override
  Future<void> onInit() async {
    await Future.delayed(Duration.zero);
    if (auth.userInfo.value != null) {
      Get.offAndToNamed(Routes.MAIN);
    } else {
      Get.offAndToNamed(Routes.HOME_INTRO);
    }
    super.onInit();
  }
}
