import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../../data/repository/authentication_repository.dart';
import '../../../data/service/setting_service.dart';

class ChangePasswordController extends BaseController {
  final authService = Get.find<AuthenticationRepository>();

  void changePassword(String oldPass,String newPass) {
    callDataService(authService.changePassword(password: oldPass,newPass: newPass), onSuccess: (_) {
      Get.find<SettingService>().savePassword(newPass);
      AppSnackBar.showSuccess(title: "Thay đổi mật khẩu thành công");
    });
  }
}
