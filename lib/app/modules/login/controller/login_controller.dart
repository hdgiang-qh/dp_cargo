import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../flavors/build_config.dart';
import '../../../core/base/base_controller.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../../data/model/response/token_entity.dart';
import '../../../data/repository/authentication_repository.dart';
import '../../../data/service/auth_service.dart';
import '../../../data/service/setting_service.dart';
import '../../../routes/app_pages.dart';

class LoginController extends BaseController {
  final rememberPassword = false.obs;
  final logger = BuildConfig.instance.config.logger;

  final authService = Get.find<AuthService>();
  final settingService = Get.find<SettingService>();
  final authRepo = Get.find<AuthenticationRepository>();

  void loginApi(String user, String pass) {
    callDataService<TokenEntity>(
      authRepo.login(user: user, pass: pass),
      onSuccess: (token) async {
        await authService.saveToken(token);
        try {
          final user = await authRepo.getUserInfo();
          await authService.saveUserInfo(user);
        } catch (e) {
          logger.e(e);
        }

        if (rememberPassword.value) {
          await saveLoginInfo(user, pass);
        } else {
          await clearLoginInfo();
        }

        Get.offAndToNamed(Routes.MAIN);
      },
      onError: (error) {
        // Xử lý lỗi ở đây
      },
    );
  }

  Future<void> saveLoginInfo(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('remember', true);
  }

  Future<void> clearLoginInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.setBool('remember', false);
  }

  Future<Map<String, String>> getLoginInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? '';
    final password = prefs.getString('password') ?? '';
    final remember = prefs.getBool('remember') ?? false;
    rememberPassword.value = remember;
    return {'email': email, 'password': password};
  }
  final gmailController = TextEditingController();
  final passController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    loadSavedLoginInfo();
  }



  Future<void> loadSavedLoginInfo() async {
    final loginInfo = await getLoginInfo();
    gmailController.text = loginInfo['email'] ?? '';
    passController.text = loginInfo['password'] ?? '';
  }
}