import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/list_order_response.dart';
import '../model/response/list_total_status.dart';

part 'orders_data_source.g.dart';

@RestApi()
abstract class OrderDataSource {
  factory OrderDataSource(Dio dio, {String baseUrl}) = _OrderDataSource;

  @GET('/api/orders/')
  Future<ListOrderResponse> getListOrder(
    @Query('fromDate') String? fromDate,
    @Query('toDate') String? toDate,
    @Query('code') String? code,
    @Query('trackingCode') String? trackingCode,
    @Query('exploitedBy') int? exploitedBy,
    @Query('filterDateBy') String? filterDateBy,
    @Query('customer') String? customer,
    @Query('exploitStatus') int? exploitStatus,
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
      @Query('warehouse_id') String? warehouse_id,

  );

  @GET('/api/orders/{id}/')
  Future<ListOrderDetailResponse> getOrderDetail(
    @Path('id') int id,
  );

  @DELETE('/api/orders/{id}')
  Future deletedOrder(@Path('id') int id);

  @PUT('/api/trackings/{id}')
  Future<ListOrderDetailResponse> updateOrderDetail(
      @Path('id') int id,
      @Body() Map<String, dynamic> updateFields,
      );

  @POST('/api/orders')
  Future createOrder(
      @Body() Map<String, dynamic> payload,
      );

  @GET('/api/trackings/status')
  Future<ListOrderStatusResponse> getOrderStatus(
      @Query('search[page]') int? page,
      @Query('search[pageSize]') int? pageSize,
      @Query('search[code]') String? code,
      @Query('search[trackingCode]') String? trackingCode,
      @Query('search[fromDate]') String? fromDate,
      @Query('search[toDate]') String? toDate,
      @Query('search[filterDateBy]') String? filterDateBy,
      @Query('search[exploitStatus]') int? exploitStatus,
      @Query('isGettingOrder') bool? isGettingOrder
      );
}
