import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/model/exploit_tracking.dart';
import '../../model/model/tracking.dart';
import '../../model/model/tracking_new.dart';
import '../../model/request/create_tracking_request.dart';
import '../../model/response/list_trackings_response.dart';
import '../../remote/tracking_data_source.dart';
import '../tracking_repository.dart';

class TrackingRepoImpl extends BaseRepoSource implements TrackingsRepository {
  final TrackingsDataSource _dataSource = Get.find<TrackingsDataSource>();

  @override
  Future<ListTrackingsResponse> getListTracking(
      {String? exploitStatus,
      String? code,
      int? page,
      int? pageSize,
      String? fromDate,
      String? toDate,
      String? customer,
      bool? undefinedCustomer,
      String? filterDateBy,
      String? warehouse_id
      }) {
    return callApiWithErrorHandleRepo(_dataSource.getListTrackings(
        exploitStatus,
        code,
        page,
        pageSize,
        fromDate,
        toDate,
        customer,
        undefinedCustomer,
        filterDateBy,
        warehouse_id
    ));
  }

  @override
  Future<SearchTrackingResponse> getListSearchTracking({
    String? code,String? warehouseID
  }) {
    return callApiWithErrorHandleRepo(_dataSource.getListSearchTracking(code,warehouseID));
  }
  @override
  Future<ListDetailTrackingResponse> getAwbTracking({
    required int id,
  }) {
    return callApiWithErrorHandleRepo(_dataSource.getAwbTracking(id));
  }

  @override
  Future<ListTrackingsResponse> getListPublicTrackings({
    String? code,
    String? customerPhoneNumber,
    int? page,
    int? pageSize,
  }) {
    return callApiWithErrorHandleRepo(_dataSource.getListPublicTrackings(
        code, customerPhoneNumber, page, pageSize));
  }

  @override
  Future<ListDetailTrackingResponse> getTrackingsDetail({required int id}) async {
    return callApiWithErrorHandleRepo(_dataSource.getTrackingsDetail(id));
  }

  @override
  Future updateTrackingDetail(
      {required int id, required Map<String, dynamic> updateFields}) {
    return callApiWithErrorHandleRepo(
        _dataSource.updateTrackingDetail(id, updateFields));
  }

  @override
  Future checkRequest(
      {required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.checkRequest(id, payload));
  }

  @override
  Future createBoxTracking(
      {required int id, required Map<String, dynamic> createFields}) {
    return callApiWithErrorHandleRepo(
        _dataSource.createBoxTracking(id, createFields));
  }

  @override
  Future syncTracking() {
    return callApiWithErrorHandleRepo(
        _dataSource.syncTracking());
  }

  @override
  Future createTracking(
      {required dynamic createFields}) {
    return callApiWithErrorHandleRepo(
        _dataSource.createTracking(createFields));
  }

  @override
  Future deleteTracking(
      {required int? id}) {
    return callApiWithErrorHandleRepo(
        _dataSource.deleteTracking(id));
  }

  @override
  Future<Trackings> updateBoxTracking(
      {required int id, required Map<String, dynamic> updateFields}) {
    return callApiWithErrorHandleRepo(
        _dataSource.updateBoxTracking(id, updateFields));
  }

  @override
  Future<ExploitTracking> exploitTracking(
      {required int id, required Map<String, dynamic> exploitFields}) {
    return callApiWithErrorHandleRepo(
        _dataSource.exploitTracking(id, exploitFields));
  }

  @override
  Future<UpdateTracking> updateTrackingDelivery(
      {required int id, required Map<String, dynamic> updateFields}) {
    return callApiWithErrorHandleRepo(
        _dataSource.updateTrackingDelivery(id, updateFields));
  }

  @override
  Future<ListTrackingTypeResponse> getTrackingType() async {
    return callApiWithErrorHandleRepo(_dataSource.getTrackingType());
  }

  @override
  Future<String> addTracking({required CreateTrackingRequest request}) {
    return callApiWithErrorHandleRepo(_dataSource.addTracking(request));
  }

  @override
  Future<String> deletedTracking({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.deletedTracking(id));
  }

  @override
  Future<ListTrackingCustomerResponse> getTrackingCustomerDetail(
      {required int id}) async {
    return callApiWithErrorHandleApiData(
        _dataSource.getTrackingsCustomerDetail(id));
  }
}
