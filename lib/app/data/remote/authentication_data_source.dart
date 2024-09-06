import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model/config_data.dart';
import '../model/response/api_response_data.dart';
import '../model/response/notify.dart';
import '../model/response/token_entity.dart';
import '../model/response/user.dart';

part 'authentication_data_source.g.dart';

@RestApi()
abstract class AuthenticationDataSource {
  factory AuthenticationDataSource(Dio dio, {String baseUrl}) = _AuthenticationDataSource;

  @POST('/api/auth/login')
  Future<TokenEntity> login(@Field('email') String phone, @Field('password') String pass);

  @POST('/api/auth/signup/')
  Future<TokenEntity> register(@Field('email') String email, @Field('password') String pass);

  @POST('/v1/mobile/users/sendotp')
  Future sendOtp(@Field('phone') String phone);

  ///TODO: Thiếu API send email
  @POST('')
  Future sendEmail(@Field('email') String email);

  @POST('/v1/mobile/users/verifyotp')
  Future<TokenEntity> verifyOtp(@Field('phone') String phone, @Field('otp') String otp);

  @PUT('/api/customer_accounts')
  Future updateUserInfo(
      {@Field('name') String? fullname,
      @Field('nickName') String? nickName,
      @Field('phone') String? phone,
      @Field('email') String? email,
      @Field('gender') String? gender,
      @Field('birthday') DateTime? birthday,
      @Field('avatar_url') String? avatar});

  @GET('/api/users/is_logged')
  Future<UserInfo> getUserInfo();

  @PATCH('/api/auth/change_password')
  Future changePassword(@Field('oldPassword') String oldPassword, @Field('newPassword') String newPassword);

  @GET('/v1/mobile/notifications')
  Future<ApiResponseData<List<Notify>>> listNotification();

  @POST('https://media.dp-cargo.com/file')
  Future<String> uploadFile(
    @Part(name: 'objectType') String objectType,
    @Part(name: 'objectId') String objectId,
    @Part(name: 'type') String type,
    @Part(name: 'file') File file,
  );

  @GET('/api/general_configs/public?key=CONTACT_INFORMATION_CONFIG')
  Future<ApiResponseData<List<ConfigData>>> getConfig();
}
