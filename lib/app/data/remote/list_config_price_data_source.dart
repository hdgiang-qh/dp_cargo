import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/response/list_config_price_response.dart';
import '../model/response/list_config_response.dart';

part 'list_config_price_data_source.g.dart';

@RestApi()
abstract class ListConfigPriceDataSource {
  factory ListConfigPriceDataSource(Dio dio, {String baseUrl}) = _ListConfigPriceDataSource;

  @GET('/api/general_configs/list?key=PRICING_CONFIG')
  Future<ListConfigPriceResponse> getListConfigPrice();

  @GET('/api/general_configs/list?key=BOX_COEFFICIENT_CONFIG')
  Future<ListeBoxCoeffecientConfigResponse> getListBoxCoefficientConfig();

}