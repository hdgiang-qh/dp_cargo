import 'package:get/get.dart';
import 'package:vncss/app/data/model/response/list_awb_response.dart';
import '../../../core/base/base_repo_handle.dart';
import '../../remote/boxes_tracking_data_source.dart';
import '../list_boxes_tracking_repository.dart';

class BoxesTrackingRepoImpl extends BaseRepoSource
    implements ListBoxesTrackingRepository {
  final BoxesTrackingDataSource _dataSource = Get.find<BoxesTrackingDataSource>();

  @override
  Future<ListAWBDetailResponse> getAwbBoxesTracking({required int id, int? exploitStatus, String? code}) async {
    return callApiWithErrorHandleRepo(_dataSource.getAwbBoxesTracking(id, exploitStatus, code));
  }
}
