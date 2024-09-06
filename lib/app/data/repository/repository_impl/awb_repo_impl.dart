import 'package:get/get.dart';
import '../../../core/base/base_repo_handle.dart';
import '../../model/model/awb.dart';
import '../../model/response/list_awb_response.dart';
import '../../model/response/report_response.dart';
import '../../remote/awb_data_source.dart';
import '../awb_repository.dart';

class AwbRepoImpl extends BaseRepoSource
    implements AwbRepository {
  final AWBDataSource _dataSource = Get.find<AWBDataSource>();

  @override
  Future<ListAWBResponse> getListAWB(
      {int? page,
        int? pageSize,
        String? keyWords,
        int? exploitStatus,
        String? boxCode,
        String? trackingCode,
        String? warehouse_id
      }) {
    return callApiWithErrorHandleRepo(_dataSource.getListAWB(
      page: page,
      pageSize: pageSize,
      keyWords: keyWords,
      exploitStatus: exploitStatus,
      boxCode: boxCode,
      trackingCode: trackingCode,
        warehouse_id: warehouse_id
    ));
  }
  @override
  Future<AwbDetailModel> getAwbDetail({required int id}) async {
    return callApiWithErrorHandleApiData(_dataSource.getAwbDetail(id));
  }

  @override
  Future importProducts(
      {required int id, required Map<String, dynamic> updateFields}) {
    return callApiWithErrorHandleRepo(
        _dataSource.importProducts(id, updateFields));
  }

  Future<AwbBoxData> getDetailAwbBox({required int? id}) async {
    return callApiWithErrorHandleApiData(_dataSource.getDetailAwbBox(id));
  }

  @override
  Future<ListWarehouseResponse> getWareHouse() async {
    return callApiWithErrorHandleRepo(_dataSource.getWareHouse());
  }
}
