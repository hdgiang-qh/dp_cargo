import '../model/model/bill_of_lading.dart';
import '../model/response/bill_of_lading_response.dart';

abstract class BillOfLadingRepository {
  Future<BillOfLadingResponse> getBillOfLading(
      {int? page,
      int? pageSize,
      String? code,
      String? status,
      String? warehouseId});

  Future<BolAdd> createBol({required Map<String, dynamic> payload});

  Future<BolAdd> updateBol(
      {required int id, required Map<String, dynamic> payload});

  Future updateBolShipper(
      {required int id, required Map<String, dynamic> payload});

  Future receivingBox({required Map<String, dynamic> payload});

  Future successBox({required Map<String, dynamic> payload});

  Future failedBox({required Map<String, dynamic> payload});

  Future changeDeliveringDetail(
      {required int id, required Map<String, dynamic> payload});

  Future<BolAdd> deleteBol({required int id});

  Future<DeliveryUnitsResponse> getDeliveryUnits({
    int? page,
    int? pageSize,
    String? status,
  });

  Future<DetailDeliveryUnitsResponse> detailDeliveryUnits({
    required int id
  });

  Future disposeDeliveryUnits({required int id});

  Future createDeliveryUnits({required Map<String, dynamic> payload});

  Future updateDeliveryUnits(
      {required int id, required Map<String, dynamic> payload});

  Future<BillOfLadingDetailResponse> getBillOfLadingDetail({int? id});
}
