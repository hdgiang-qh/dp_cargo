import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/model/bill_of_lading.dart';
import '../../model/response/bill_of_lading_response.dart';
import '../../remote/bill_of_lading_data_source.dart';
import '../bill_of_lading_reponsitory.dart';

class BillOfLadingRepoImpl extends BaseRepoSource
    implements BillOfLadingRepository {
  final BillOfLadingDataSource _dataSource = Get.find<BillOfLadingDataSource>();

  @override
  Future<BillOfLadingResponse> getBillOfLading({
    int? page,
    int? pageSize,
    String? code,
    String? status,
    String? warehouseId
  }) {
    return callApiWithErrorHandleRepo(
        _dataSource.getBillOfLading(page, pageSize, code, status,warehouseId));
  }

  @override
  Future<BolAdd> createBol(
      {required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.createBol(payload));
  }

  @override
  Future<BillOfLadingDetailResponse> getBillOfLadingDetail({int? id}) {
    return callApiWithErrorHandleRepo(_dataSource.getBillOfLadingDetail(id));
  }

  @override
  Future<DeliveryUnitsResponse> getDeliveryUnits({int? page, int? pageSize, String? status}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getDeliveryUnits(page, pageSize, status));
  }

  @override
  Future<DetailDeliveryUnitsResponse> detailDeliveryUnits({required int id}) {
    return callApiWithErrorHandleRepo(
        _dataSource.detailDeliveryUnits(id));
  }
  @override
  Future disposeDeliveryUnits({required int id}) {
    return callApiWithErrorHandleRepo(
        _dataSource.disposeDeliveryUnits(id));
  } @override
  Future createDeliveryUnits({required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.createDeliveryUnits(payload));
  }

  @override
  Future updateDeliveryUnits({required int id,required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.updateDeliveryUnits(id,payload));
  }

  @override
  Future<BolAdd> deleteBol({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.deleteBol(id));
  }

  @override
  Future<BolAdd> updateBol({required int id,required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.updateBol(id,payload));
  }

  @override
  Future updateBolShipper({required int id,required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.updateBolShipper(id,payload));
  }

  @override
  Future receivingBox({required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.receivingBox(payload));
  }

  @override
  Future successBox({required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.successBox(payload));
  }

  @override
  Future failedBox({required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.failedBox(payload));
  }

  @override
  Future changeDeliveringDetail({required int id,required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.changeDeliveringDetail(id,payload));
  }
}
