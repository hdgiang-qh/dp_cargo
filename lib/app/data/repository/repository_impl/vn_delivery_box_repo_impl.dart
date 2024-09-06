import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/model/vn_delivery_box.dart';
import '../../remote/vn_delivery_box_data_source.dart';
import '../vn_delivery_box_repository.dart';

class VnDeliveryBoxRepoImpl extends BaseRepoSource
    implements VnDeliveryBoxRepository {
  final VnDeliveryBoxDataSource _dataSource =
      Get.find<VnDeliveryBoxDataSource>();

  @override
  Future<List<VnDeliveryBox>> getListVnDeliveryBoxes() {
    return callApiWithErrorHandleApiData(_dataSource.getListVnDeliveryBoxes());
  }

  @override
  Future vnDeliveryBoxNote(int id, String note) {
    return callApiWithErrorHandleApiData(
        _dataSource.vnDeliveryBoxNote(id, note));
  }

  @override
  Future vnDeliveryBoxReceiving(List<String> codes) {
    return callApiWithErrorHandleApiData(
        _dataSource.vnDeliveryBoxReceiving(codes));
  }

}
