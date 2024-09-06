import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/response/list_order_response.dart';
import '../../model/response/sync_awb_response.dart';
import '../../remote/awb_data_source.dart';
import '../../remote/orders_data_source.dart';
import '../order_repository.dart';
import '../sync_awb_repository.dart';

class SyncAwbRepoImpl extends BaseRepoSource implements SyncAwbRepository {
  final AWBDataSource _dataSource = Get.find<AWBDataSource>();

  @override
  Future<SyncAwbResponse> getSyncAwb() {
    return callApiWithErrorHandleRepo(_dataSource.getSyncAwb());
  }

  @override
  Future postSyncAwb({required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.postSyncAwb(payload));
  }
}
