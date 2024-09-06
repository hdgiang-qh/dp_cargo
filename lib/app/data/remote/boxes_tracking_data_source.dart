import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vncss/app/data/model/response/list_awb_response.dart';

part 'boxes_tracking_data_source.g.dart';

@RestApi()
abstract class BoxesTrackingDataSource {
  factory BoxesTrackingDataSource(Dio dio, {String baseUrl}) = _BoxesTrackingDataSource;

  @GET('/api/boxes/{id}/trackings')
  Future<ListAWBDetailResponse> getAwbBoxesTracking(
      @Path('id') int id,
      @Query('exploitStatus') int? exploitStatus,
      @Query('code') String? code
      );
}