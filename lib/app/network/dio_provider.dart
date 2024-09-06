import 'package:dio/dio.dart';

import '/app/network/pretty_dio_logger.dart';
import '/app/network/request_headers.dart';
import '/flavors/build_config.dart';

class DioProvider {
  static final String baseUrl = BuildConfig.instance.config.baseUrl;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      //responseBody: BuildConfig.instance.environment == Environment.DEVELOPMENT,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio(_options);
      dio!.interceptors.add(_prettyDioLogger);
      dio!.interceptors.add(RequestHeaderInterceptor());
    }
    return dio!;
  }

  static String _buildContentType(String version) {
    return "user_defined_content_type+$version";
  }

  DioProvider.setContentType(String version) {
    dio?.options.contentType = _buildContentType(version);
  }

  DioProvider.setContentTypeApplicationJson() {
    dio?.options.contentType = "application/json";
  }
}
