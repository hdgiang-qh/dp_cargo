import '../model/model/awb.dart';
import '../model/response/list_awb_response.dart';
import '../model/response/report_response.dart';

abstract class AwbRepository {
  Future<ListAWBResponse> getListAWB({
    int? page,
    int? pageSize,
    String? keyWords,
    int? exploitStatus,
    String? boxCode,
    String? trackingCode,
    String? warehouse_id
  });
  Future<AwbDetailModel> getAwbDetail({required int id});

  Future importProducts(
      {required int id, required Map<String, dynamic> updateFields});

  Future<AwbBoxData> getDetailAwbBox({required int? id});

  Future<ListWarehouseResponse> getWareHouse();


}
