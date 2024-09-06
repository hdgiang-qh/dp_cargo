import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../data/model/response/token_entity.dart';
import '../../../data/repository/authentication_repository.dart';
import '../../../data/service/auth_service.dart';
import '../../../routes/app_pages.dart';

class OtpController extends BaseController {
  final authRepo = Get.find<AuthenticationRepository>();

  final authService = Get.find<AuthService>();

  void verifyOtp(String phone, String otp) {
    callDataService<TokenEntity>(authRepo.verifyOtp(phone: phone, otp: otp), onSuccess: (_token) async {
      await authService.saveToken(_token);
      Get.toNamed(Routes.USER);
    });
  }

  void reSentOtp(String phone) {
    callDataService(authRepo.sentOtp(phone: phone), onSuccess: (_) {}, onError: (error) {});
  }
}
