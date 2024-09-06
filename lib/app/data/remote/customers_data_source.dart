import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../model/model/customers.dart';
import '../model/response/api_response_data.dart';
import '../model/response/list_customer_response.dart';

part 'customers_data_source.g.dart';

@RestApi()
abstract class CustomersDataSource {
  factory CustomersDataSource(Dio dio, {String baseUrl}) =
  _CustomersDataSource;

  @GET('/api/customers/')
  Future<ListDataCustomerResponse> getListCustomer(
      @Query('page') int? page,
      @Query('pageSize') int? pageSize,
      @Query('fullname') String? fullname,
      @Query('nickName') String? nickName,
      @Query('sale') String? sale,
      @Query('isDebt') bool? isDebt,
      @Query('undefinedSale') bool? undefinedSale,
      @Query('isCard') bool? isCard,
      @Query('isBlocked') bool? isBlocked,
      @Query('orderBy') String? orderBy,
      @Query('warehouse_id') String? warehouse_id,

      );
  @GET('/api/customers/{id}/')
  Future<ApiResponseData<Customers>> getCustomerDetail(
      @Path('id') int id,
      );
  @PUT('/api/customers/{id}')
  Future updateCustomerDetail(
      @Path('id') int id,
      @Body() Map<String, dynamic> payload
      );
  @POST('/api/customers/')
  Future createCustomer(
      @Body() Map<String, dynamic> payload
      );

  @DELETE('/api/customers/{id}')
  Future<String> deleteCustomer(@Path('id') int? id);
}
