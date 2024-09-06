import 'dart:io';

import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/response/notify.dart';
import '../../model/response/token_entity.dart';
import '../../model/response/user.dart';
import '../../remote/authentication_data_source.dart';
import '../authentication_repository.dart';

class AuthenticationRepoImpl extends BaseRepoSource
    implements AuthenticationRepository {
  final AuthenticationDataSource _dataSource =
      Get.find<AuthenticationDataSource>();

  @override
  Future<TokenEntity> login(
      {required String user, required String pass}) async {
    return callApiWithErrorHandleRepo(_dataSource.login(user, pass));
  }

  @override
  Future register({required String email, required String pass}) async {
    return callApiWithErrorHandleRepo(_dataSource.register(email, pass));
  }

  @override
  Future sentOtp({required String phone}) {
    return callApiWithErrorHandleRepo(_dataSource.sendOtp(phone));
  }

  @override
  Future sentEmail({required String email}) {
    return callApiWithErrorHandleRepo(_dataSource.sendEmail(email));
  }

  @override
  Future<UserInfo> getUserInfo() async {
    return callApiWithErrorHandleRepo<UserInfo>(_dataSource.getUserInfo());
  }

  @override
  Future<TokenEntity> verifyOtp({required String phone, required String otp}) {
    return callApiWithErrorHandleRepo(_dataSource.verifyOtp(phone, otp));
  }

  @override
  Future changePassword({required String password, required String newPass}) {
    return callApiWithErrorHandleRepo(
        _dataSource.changePassword(password, newPass));
  }

  @override
  Future<List<Notify>> getListNotification() {
    return callApiWithErrorHandleApiData(_dataSource.listNotification());
  }

  @override
  Future updateUserInfo(
      {String? fullname,
      String? email,
      String? gender,
      DateTime? birthday,
      String? avatar}) {
    return callApiWithErrorHandleRepo(_dataSource.updateUserInfo(
        fullname: fullname,
        email: email,
        gender: gender,
        birthday: birthday,
        avatar: avatar));
  }

  @override
  Future<String> uploadFile(
      {required String objectType,
      required String objectId,
      required String type,
      required File file}) {
    return callApiWithErrorHandleRepo(
        _dataSource.uploadFile(objectType, objectId, type, file));
  }
}
