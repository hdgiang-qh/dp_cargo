import 'package:dio/dio.dart';
import '../../data/model/response/api_response_data.dart';
import '/app/network/dio_provider.dart';
import '/app/network/error_handlers.dart';
import '/app/network/exceptions/base_exception.dart';
import '/flavors/build_config.dart';

abstract class BaseRepoSource {
  Dio get dioClient => DioProvider.getDio();

  final logger = BuildConfig.instance.config.logger;

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
