import 'package:get/get.dart';
import '../../../core/base/base_repo_handle.dart';
import '../../../modules/barcode/model/receive_model.dart';
import '../../../modules/barcode/model/success_model.dart';
import '../../model/model/delivery_bill_detail.dart';
import '../../model/request/create_delivery_bill_request.dart';
import '../../model/response/list_delivery_bill.dart';
import '../../remote/delivery_bill_data_source.dart';
import '../delivery_bill_repository.dart';

class DeliveryBillRepoImpl extends BaseRepoSource
    implements DeliveryBillRepository {
  final DeliveryBillDataSource _dataSource = Get.find<DeliveryBillDataSource>();

  @override
  Future<ListDeliveryBillResponse> getListDeliveryBill(
      {String? deliveryBillStatus,
      String? code,
      int? page,
      int? pageSize,
      DateTime? fromDate,
      DateTime? toDate,
      String? customer,
        String? warehouseId}) {

    return callApiWithErrorHandleRepo(_dataSource.getListDeliveryBill(
        deliveryBillStatus, code, page, pageSize, fromDate, toDate, customer,warehouseId));
  }

  @override
  Future<ListCreateBillResponse> getListBillCreate(
      {int? page, int? pageSize, int? customId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getListBillCreate(page, pageSize, customId));
  }

  @override
  Future<TrackingCustomerDetailResponse> getBillCustomTracking(
      {required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.getBillCustomTracking(id));
  }

  @override
  Future<TotalDeliveryBill> getTotalDelivery(
      {int? page,
      int? pageSize,
      String? code,
      String? btnFilterStatus,
      String? deliveryBillStatus,
      DateTime? fromDate,
      DateTime? toDate,
      String? customer,
      String?  warehouseId}) {
    return callApiWithErrorHandleRepo(_dataSource.getTotalDelivery(
        page,
        pageSize,
        code,
        btnFilterStatus,
        deliveryBillStatus,
        fromDate,
        toDate,
        customer,warehouseId));
  }

  @override
  Future<DeliveryBillDetail> getDeliveryBillDetail({required int id,String? warehouseId}) async {
    return callApiWithErrorHandleRepo(_dataSource.getDeliveryBillDetail(id,warehouseId));
  }

  @override
  Future<DeliveryBillDetail> updateDeliveryBillDetail(
      {required int id, required Map<String, dynamic> updateFields}) {
    return callApiWithErrorHandleRepo(
        _dataSource.updateDeliveryBillDetail(id, updateFields));
  }

  @override
  Future<AddTrackingDeliveryBill> addTrackingDeliveryBill(
      {required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.addTrackingDeliveryBill(id, payload));
  }

  @override
  Future<AddTrackingDeliveryBill> deleteTrackingDeliveryBill(
      {required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.deleteTrackingDeliveryBill(id, payload));
  }

  @override
  Future<AddTrackingDeliveryBill> createDeliveryBill(
      {required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.createDeliveryBill(payload));
  }

  @override
  Future<ListTrackingCustomerDetail> getListTrackingCustomerDetail(
      {required int id}) async {
    return callApiWithErrorHandleRepo(
        _dataSource.getListTrackingCustomerDetail(id));
  }

  // @override
  // Future<List<TrackingsBill>> getDeliveryBillTracking() async {
  //   return callApiWithErrorHandleApiData(_dataSource.getDeliveryBillTracking());
  // }

  @override
  Future addDeliveryBill({required CreateDeliveryBillRequest request}) {
    return callApiWithErrorHandleRepo(_dataSource.addDeliveryBill(request));
  }

  @override
  Future<AddTrackingDeliveryBill> cancelDeliveryBill({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.cancelDeliveryBill(id));
  }

  @override
  Future<AddTrackingDeliveryBill> skipApproveDeliveryBill({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.skipApproveDeliveryBill(id));
  }

  @override
  Future<AddTrackingDeliveryBill> customApproveDeliveryBill({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.customApproveDeliveryBill(id));
  }

  @override
  Future<AddTrackingDeliveryBill> saleApproveDeliveryBill({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.saleApproveDeliveryBill(id));
  }

  @override
  Future<AddTrackingDeliveryBill> accountantApproveDeliveryBill(
      {required int id}) {
    return callApiWithErrorHandleRepo(
        _dataSource.accountantApproveDeliveryBill(id));
  }

  @override
  Future<AddTrackingDeliveryBill> packTrackingDeliveryBill(
      {required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.packTrackingDeliveryBill(id, payload));
  }

  @override
  Future<AddTrackingDeliveryBill> packDeliveryBill(
      {required int id}) {
    return callApiWithErrorHandleRepo(
        _dataSource.packDeliveryBill(id));
  }

  @override
  Future<AddTrackingDeliveryBill> exportDeliveryBill(
      {required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.exportDeliveryBill(id, payload));
  }

  @override
  Future assignShipper(
      {required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.assignShipper(id, payload));
  }

  @override
  Future<ListCodePackedResponse> searchKeyword({String? keyword}) {
    return callApiWithErrorHandleRepo(
        _dataSource.searchKeyword(keyword));
  }

  @override
  Future<String> failedDeliveryBill({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.failedDeliveryBill(id));
  }

  @override
  Future finishDeliveryBill({required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.finishDeliveryBill(id));
  }

  @override
  Future receive({required ReceiveModel receiveModel}) {
    return callApiWithErrorHandleRepo(_dataSource.receiveBox(receiveModel));
  }

  @override
  Future uploadDeliveredImage(
      {required int id,
      required String deliveredImageUrl,
      required String shipper_note}) {
    return callApiWithErrorHandleRepo(
        _dataSource.uploadDeliveredImage(id, deliveredImageUrl, shipper_note));
  }

  @override
  Future success({required SuccessModel successModel}) {
    return callApiWithErrorHandleRepo(_dataSource.successBox(successModel));
  }

  @override
  Future<ListDeliveryBillCustomerResponse> getBillCustomerDetail(
      {required int id}) {
    return callApiWithErrorHandleRepo(_dataSource.getBillCustomerDetail(id));
  }


}
