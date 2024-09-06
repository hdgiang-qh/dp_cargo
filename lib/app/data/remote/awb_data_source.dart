import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model/awb.dart';
import '../model/response/api_response_data.dart';
import '../model/response/list_awb_response.dart';
import '../model/response/list_total_status.dart';
import '../model/response/report_response.dart';
import '../model/response/sync_awb_response.dart';
part 'awb_data_source.g.dart';

@RestApi()
abstract class AWBDataSource {
  factory AWBDataSource(Dio dio, {String baseUrl}) = _AWBDataSource;

  @GET('/api/awbs/list')
  Future<ListAWBResponse> getListAWB({
    @Query('page') int? page,
    @Query('pageSize') int? pageSize,
    @Query('keyWords') String? keyWords,
    @Query('exploitStatus') int? exploitStatus,
    @Query('box_code') String? boxCode,
    @Query('tracking_code') String? trackingCode,
    @Query('warehouse_id') String? warehouse_id,

  });

  @GET('/api/awbs/{id}')
  Future<ApiResponseData<AwbDetailModel>> getAwbDetail(
      @Path('id') int id,
      );

  @GET('/api/boxes/{id}/trackings')
  Future<ApiResponseData<AwbBoxData>> getDetailAwbBox(
      @Path('id') int? id,
      );

  @PUT('/api/boxes/{id}/import')
  Future importProducts(
      @Path('id') int id,
      @Body() Map<String, dynamic> updateFields,
      );

  @POST('/api/awbs/sync')
  Future postSyncAwb(
      @Body() Map<String, dynamic> payload,
      );

  @GET('/api/awbs/check-ready')
  Future<SyncAwbResponse> getSyncAwb();

  @GET('/api/warehouses/warehouse-config')
  Future<ListWarehouseResponse> getWareHouse();

  @GET('/api/awbs/status')
  Future<ListAwbStatusResponse> getListAwbStatus(
      @Query('keyWords') String? keyWords,
      @Query('exploitStatus') int? exploitStatus,
      @Query('box_code') String? boxCode,
      @Query('tracking_code') String? trackingCode,
      );
}