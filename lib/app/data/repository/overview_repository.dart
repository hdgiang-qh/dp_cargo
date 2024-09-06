import '../model/response/overview_response.dart';

abstract class OverviewRepository {
  Future<OverviewResponse> getOverview();

}
