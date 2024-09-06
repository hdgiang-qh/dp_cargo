import 'dart:io';

import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../data/repository/authentication_repository.dart';
import '../../../data/service/auth_service.dart';

class UserController extends BaseController {
  final userInfo = Get.find<AuthService>().userInfo;

  final AuthenticationRepository authenticationRepository = Get.find();

  final authService = Get.find<AuthService>();

  void updateUser(
      {String? fullname,
      String? email,
      String? gender,
      DateTime? birthday,
      String? avatar}) {
    callDataService(
        authenticationRepository.updateUserInfo(
            fullname: fullname,
            email: email,
            gender: gender,
            birthday: birthday,
            avatar: avatar), onSuccess: (data) async {
      final user = await authenticationRepository.getUserInfo();
      await authService.saveUserInfo(user);
      showSuccessMessage('Cập nhật thông tin tài khoản thành công');
    });
  }

  void uploadAvatar({required File file}) {
    callDataService(
        authenticationRepository.uploadFile(
            objectType: 'customer_transaction_images',
            objectId: 'customer_${authService.userInfo.value?.customer?.id}',
            type: 'regular_image',
            file: file), onSuccess: (url) {
      updateUser(avatar: url);
    });
  }
}
