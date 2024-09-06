import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model/bill_of_lading.dart';
import '../model/response/bill_of_lading_response.dart';

part 'bill_of_lading_data_source.g.dart';

@RestApi()
abstract class BillOfLadingDataSource {
  factory BillOfLadingDataSource(Dio dio, {String baseUrl}) =
      _BillOfLadingDataSource;

  @GET('/api/vn_delivery_orders')
  Future<BillOfLadingResponse> getBillOfLading(
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('code') String? code,
    @Query('status') String? status,
    @Query('warehouse_id') String? warehouseId,
  );

  @POST('/api/vn_delivery_orders')
  Future<BolAdd> createBol(@Body() Map<String, dynamic> payload);

  @DELETE('/api/vn_delivery_orders/{id}')
  Future<BolAdd> deleteBol(@Path("id") int id);

  @PUT('/api/vn_delivery_orders/{id}')
  Future<BolAdd> updateBol(
      @Path("id") int id, @Body() Map<String, dynamic> payload);

  @PUT('/api/vn_delivery_orders/assign/{id}')
  Future updateBolShipper(
      @Path("id") int id, @Body() Map<String, dynamic> payload);

  @PUT('/api/vn_delivery_boxes/receiving')
  Future receivingBox(@Body() Map<String, dynamic> payload);

  @PUT('/api/vn_delivery_boxes/success')
  Future successBox(@Body() Map<String, dynamic> payload);

  @PUT('/api/vn_delivery_boxes/failed')
  Future failedBox(@Body() Map<String, dynamic> payload);

  @PUT('/api/vn_delivery_orders/delivering-status/{id}')
  Future changeDeliveringDetail(
      @Path("id") int id, @Body() Map<String, dynamic> payload);

  @GET('/api/delivery_units')
  Future<DeliveryUnitsResponse> getDeliveryUnits(
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('status') String? status,
  );

  @GET('/api/delivery_units/{id}')
  Future<DetailDeliveryUnitsResponse> detailDeliveryUnits(
      @Path("id") int id
  );

  @POST('/api/delivery_units')
  Future createDeliveryUnits(
      @Body() Map<String, dynamic> payload
  );

  @DELETE('/api/delivery_units/{id}')
  Future disposeDeliveryUnits(
      @Path("id") int id
  );

  @PUT('/api/delivery_units/{id}')
  Future updateDeliveryUnits(
      @Path("id") int id,
      @Body() Map<String, dynamic> payload
  );

  @GET('/api/vn_delivery_orders/{id}')
  Future<BillOfLadingDetailResponse> getBillOfLadingDetail(@Path("id") int? id);
}
