import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/model/exploit_tracking.dart';
import '../model/model/tracking.dart';
import '../model/model/tracking_new.dart';
import '../model/request/create_tracking_request.dart';
import '../model/response/api_response_data.dart';
import '../model/response/list_total_status.dart';
import '../model/response/list_trackings_response.dart';

part 'tracking_data_source.g.dart';

@RestApi()
abstract class TrackingsDataSource {
  factory TrackingsDataSource(Dio dio, {String baseUrl}) = _TrackingsDataSource;

  @GET('/api/trackings/')
  Future<ListTrackingsResponse> getListTrackings(
      @Query('exploitStatus') String? exploitStatus,
      @Query('code') String? code,
      @Query('page') int? page,
      @Query('pageSize') int? pageSize,
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate,
      @Query('customer') String? customer,
      @Query('undefinedCustomer') bool? undefinedCustomer,
      @Query('filterDateBy') String? filterDateBy,
      @Query('warehouse_id') String? warehouse_id,
      );

  @GET('/api/trackings/find-from-warehouse')
  Future<SearchTrackingResponse> getListSearchTracking(
      @Query('code') String? code,
      @Query('warehouse_id') String? warehouseID,
      );

  @GET('/api/trackings/status')
  Future<ListTrackingStatusResponse> getListTrackingStatus(
      @Query('exploitStatus') String? exploitStatus,
      @Query('code') String? code,
      @Query('customer') String? customer,
      @Query('undefinedCustomer') bool? undefinedCustomer,
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate,
      @Query('filterDateBy') String? filterDateBy,

      );

  @GET('/api/trackings/public')
  Future<ListTrackingsResponse> getListPublicTrackings(
      @Query('code') String? code,
      @Query('customerPhoneNumber') String? customerPhoneNumber,
      @Query('page') int? page,
      @Query('pageSize') int? pageSize,
      );

  @GET('/api/trackings/{id}/')
  Future<ListDetailTrackingResponse> getTrackingsDetail(
      @Path('id') int id,
      );

  @PUT('/api/trackings/{id}/')
  Future<UpdateTracking> updateTrackingDelivery(
      @Path('id') int id,
      @Body() Map<String, dynamic> updateFields,
      );

  @PUT('/api/trackings/{id}/exploit')
  Future<ExploitTracking> exploitTracking(
      @Path('id') int id,
      @Body() Map<String, dynamic> exploitFields,
      );

  @PUT('/api/trackings/{id}')
  Future updateTrackingDetail(
      @Path('id') int id,
      @Body() Map<String, dynamic> updateFields,
      );

  @PUT('/api/trackings/{id}')
  Future<Trackings> updateBoxTracking(
      @Path('id') int id,
      @Body() Map<String, dynamic> updateFields,
      );

  @POST('/api/trackings/{id}/check-request')
  Future checkRequest(
      @Path('id') int id,
      @Body() Map<String, dynamic> payload);

  @POST('/api/trackings/create_many/{id}')
  Future createBoxTracking(
      @Path('id') int id,
      @Body() Map<String, dynamic> createFields);

  @POST('/api/trackings/create_many')
  Future createTracking(
      @Body() dynamic createFields);

  @POST('/api/trackings/sync-tracking')
  Future syncTracking();

  @DELETE('/api/trackings/{id}')
  Future deleteTracking(
      @Path('id') int? id,);


  @GET('/api/trackings/{id}/')
  Future<ListDetailTrackingResponse> getAwbTracking(
      @Path('id') int id,
      );

  @GET('/api/trackings/{id}/detail-customer')
  Future<ApiResponseData<ListTrackingCustomerResponse>> getTrackingsCustomerDetail(
      @Path('id') int id,
      );

  @GET('/api/trackings/type')
  Future<ListTrackingTypeResponse> getTrackingType();

  @POST('/api/orders/')
  Future<String> addTracking(@Body() CreateTrackingRequest request);

  @DELETE('/api/orders/{id}')
  Future<String> deletedTracking(@Path('id') int? id);
}