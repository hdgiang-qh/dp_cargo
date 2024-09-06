import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/response/overview_response.dart';

part 'overview_data_source.g.dart';

@RestApi()
abstract class OverviewDataSource {
  factory OverviewDataSource(Dio dio, {String baseUrl}) = _OverviewDataSource;

  @GET('/api/report/overview')
  Future<OverviewResponse> getOverview();

}
