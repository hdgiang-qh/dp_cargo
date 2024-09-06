import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local/preference/preference_manager.dart';
import '../model/response/token_entity.dart';
import '../model/response/user.dart';

class AuthService extends GetxService {
  Rxn<UserInfo> userInfo = Rxn<UserInfo>();


  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());

  late SharedPreferences prefs;

  Future<AuthService> init() async {
    prefs = await SharedPreferences.getInstance();
    await getAuth();
    return this;
  }

  Future<void> getAuth() async {
    final currentTokenString =
        _preferenceManager.getString(PreferenceManager.userEntity);
    if (currentTokenString.isNotEmpty) {
      userInfo.value = UserInfo.fromJson(jsonDecode(currentTokenString));
    }
  }

  /// Handle save/remove Token
  Future<void> saveUserInfo(UserInfo user) async {
    try {
      userInfo.value = user;
      await _preferenceManager.setString(
          PreferenceManager.userEntity, jsonEncode(userInfo.value?.toJson()));
    } catch (e) {
      Logger().e(e.toString());
      throw Exception();
    }
  }

  Future<void> saveToken(TokenEntity _token) async {
    try {
      await _preferenceManager.setString(
          PreferenceManager.keyToken, _token.token);
    } catch (e) {
      Logger().e(e.toString());
      throw Exception();
    }
  }

  static Future<void> removeAll() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(directory.path);
    final isExists = await file.exists();
    if (isExists) {
      await file.delete(recursive: true);
    }
  }

  Future<bool> removeUser() {
    return _preferenceManager.remove(PreferenceManager.userEntity);
  }

  Future<bool> removeToken() {
    return _preferenceManager.remove(PreferenceManager.keyToken);
  }

  /// SignOut
  Future<void> signOut() async {
    userInfo.value = null;
    removeUser();
    removeToken();
  }
}
