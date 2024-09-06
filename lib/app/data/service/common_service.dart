import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../flavors/build_config.dart';
import '../../network/dio_provider.dart';
import '../../network/error_handlers.dart';
import '../../network/exceptions/base_exception.dart';
import '../model/model/config_data.dart';
import '../model/response/api_response_data.dart';
import '../remote/authentication_data_source.dart';

class CommonApi extends GetxService {
  final logger = BuildConfig.instance.config.logger;

  final AuthenticationDataSource source = AuthenticationDataSource(DioProvider.getDio());

  Future<CommonApi> init() async {
    try {
      await getConfigData();
    } catch (e) {
      if (kDebugMode) {
        print('lỗi');
      }
    }
    return this;
  }

  final configData = ConfigData().obs;

  Future<void> getConfigData() async {
    final result = await callApiWithErrorHandleApiData(source.getConfig());
    if (result.isNotEmpty) {
      configData.value = result.first;
    }
  }

   static phone(String phone) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: '0${phone.substring(1, phone.length)}',
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }


  Future<T> callApiWithErrorHandleRepo<T>(Future<T> api) async {
    try {
      T response = await api;
      if (response is ApiResponseData) {
        return response.data;
      }
      return response;
    } on DioException catch (dioError) {
      Exception exception = handleDioError(dioError);
      logger.e("Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");
      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }

  Future<T> callApiWithErrorHandleApiData<T>(Future<ApiResponseData<T>> api) async {
    try {
      T response = (await api).data;
      return response;
    } on DioException catch (dioError) {
      Exception exception = handleDioError(dioError);
      logger.e("Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");
      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
