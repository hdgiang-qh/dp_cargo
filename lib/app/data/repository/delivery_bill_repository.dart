import '../../modules/barcode/model/receive_model.dart';
import '../../modules/barcode/model/success_model.dart';
import '../model/model/delivery_bill_detail.dart';
import '../model/request/create_delivery_bill_request.dart';
import '../model/response/list_delivery_bill.dart';

abstract class DeliveryBillRepository {
  Future<ListDeliveryBillResponse> getListDeliveryBill(
      {String? deliveryBillStatus,
      String? code,
      int? page,
      int? pageSize,
      DateTime? fromDate,
      DateTime? toDate,
      String? customer,
      String? warehouseId});

  Future<TrackingCustomerDetailResponse> getBillCustomTracking(
      {required int id});

  Future<ListCreateBillResponse> getListBillCreate(
      {int? page, int? pageSize, int? customId});

  Future<TotalDeliveryBill> getTotalDelivery(
      {int? page,
      int? pageSize,
      String? code,
      String? btnFilterStatus,
      String? deliveryBillStatus,
      DateTime? fromDate,
      DateTime? toDate,
      String? customer,
      String? warehouseId});

  Future<DeliveryBillDetail> getDeliveryBillDetail(
      {required int id, String? warehouseId});

  Future<DeliveryBillDetail> updateDeliveryBillDetail(
      {required int id, required Map<String, dynamic> updateFields});

  Future<AddTrackingDeliveryBill> addTrackingDeliveryBill(
      {required int id, required Map<String, dynamic> payload});

  Future<AddTrackingDeliveryBill> deleteTrackingDeliveryBill(
      {required int id, required Map<String, dynamic> payload});

  Future<AddTrackingDeliveryBill> createDeliveryBill(
      {required Map<String, dynamic> payload});

  Future<AddTrackingDeliveryBill> packTrackingDeliveryBill(
      {required int id, required Map<String, dynamic> payload});

  Future<AddTrackingDeliveryBill> packDeliveryBill({required int id});

  Future<AddTrackingDeliveryBill> exportDeliveryBill(
      {required int id, required Map<String, dynamic> payload});

  Future assignShipper(
      {required int id, required Map<String, dynamic> payload});

  Future<ListCodePackedResponse> searchKeyword({String? keyword});

  Future<ListTrackingCustomerDetail> getListTrackingCustomerDetail(
      {required int id});

  Future<ListDeliveryBillCustomerResponse> getBillCustomerDetail(
      {required int id});

  // Future<List<TrackingsBill>> getDeliveryBillTracking();

  Future addDeliveryBill({required CreateDeliveryBillRequest request});

  Future receive({required ReceiveModel receiveModel});

  Future success({required SuccessModel successModel});

  Future<AddTrackingDeliveryBill> cancelDeliveryBill({required int id});

  Future<AddTrackingDeliveryBill> saleApproveDeliveryBill({required int id});

  Future<AddTrackingDeliveryBill> accountantApproveDeliveryBill(
      {required int id});

  Future<AddTrackingDeliveryBill> skipApproveDeliveryBill({required int id});

  Future<AddTrackingDeliveryBill> customApproveDeliveryBill({required int id});

  Future<String> failedDeliveryBill({required int id});

  Future finishDeliveryBill({required int id});

  Future uploadDeliveredImage(
      {required int id,
      required String deliveredImageUrl,
      required String shipper_note});
}
