import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/response/list_total_status.dart';

part 'tracking_status_data_source.g.dart';

@RestApi()
abstract class TrackingStatusDataSource {
  factory TrackingStatusDataSource(Dio dio, {String baseUrl}) = _TrackingStatusDataSource;

  @GET('/api/trackings/status')
  Future<ListTrackingStatusResponse> getListTrackingStatus(
      @Query('exploitStatus') String? exploitStatus,
      @Query('code') String? code,
      @Query('customer') String? customer,
      @Query('undefinedCustomer') bool? undefinedCustomer,
      @Query('fromDate') DateTime? fromDate,
      @Query('toDate') DateTime? toDate,
      );

}