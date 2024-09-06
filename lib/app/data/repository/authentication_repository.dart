import 'dart:io';

import '../model/response/notify.dart';
import '../model/response/token_entity.dart';
import '../model/response/user.dart';

abstract class AuthenticationRepository {
  Future<TokenEntity> login({required String user, required String pass});

  Future register({required String email, required String pass});

  Future sentOtp({required String phone});

  Future sentEmail({required String email});

  Future<TokenEntity> verifyOtp({required String phone, required String otp});

  Future updateUserInfo(
      {String? fullname,
      String? email,
      String? gender,
      DateTime? birthday,
      String? avatar});

  Future<UserInfo> getUserInfo();

  Future changePassword({required String password, required String newPass});

  Future<List<Notify>> getListNotification();

  Future<String> uploadFile(
      {required String objectType,
      required String objectId,
      required String type,
      required File file});
}
