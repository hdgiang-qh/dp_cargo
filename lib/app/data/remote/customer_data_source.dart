import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../model/response/list_customer_response.dart';

part 'customer_data_source.g.dart';

@RestApi()
abstract class CustomerDataSource {
  factory CustomerDataSource(Dio dio, {String baseUrl}) =
  _CustomerDataSource;

  @GET('/api/customers/')
  Future<ListCustomerResponse> getListCustomer(
      @Query('page') int? page,
      @Query('pageSize') int? pageSize,
      @Query('fullname') String? fullname,
      @Query('nickName') String? nickName,
      @Query('isDebt') bool? isDebt,
      @Query('undefinedSale') bool? undefinedSale,
      @Query('isCard') bool? isCard,
      @Query('isBlocked') bool? isBlocked,
      );
}
