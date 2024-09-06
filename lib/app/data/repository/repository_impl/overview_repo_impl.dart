import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/response/overview_response.dart';
import '../../remote/overview_data_source.dart';
import '../overview_repository.dart';

class OverviewRepoImpl extends BaseRepoSource
    implements OverviewRepository {
  final OverviewDataSource _dataSource = Get.find<OverviewDataSource>();

  @override
  Future<OverviewResponse> getOverview() {
    return callApiWithErrorHandleRepo(_dataSource.getOverview());
  }



}
