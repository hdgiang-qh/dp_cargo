import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/data/model/model/report_detail_model.dart';
import 'package:vncss/app/data/repository/report_repository.dart';

import '../../../data/model/response/report_response.dart';

class ReportWarehouseDetailController extends BaseController {
  final reportRepo = Get.find<ReportRepository>();
  final listReportWarehouseDetail = <ReportWareHouseDetailModel>[].obs;
  String idValue = "";
  String idWarehouse = "";
  String fromDateRx = "";
  String toDateRx = "";
  String nameWh = "";

  var isLoading = false.obs;

  Future<List<ReportWareHouseDetailModel>>?
      getListReportWarehouseDetail() async {
    try {
      isLoading.value = true;
      final data = await reportRepo.getListReportWarehouseDetail(
          id: idValue,
          fromDate: fromDateRx,
          toDate: toDateRx,
          warehouseId: idWarehouse);
      listReportWarehouseDetail.value = data.listWarehouseDetail ?? [];
      return listReportWarehouseDetail;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    idValue = argument['id'];
    idWarehouse = argument['idWarehouse'];
    fromDateRx = argument['fromDate'];
    toDateRx = argument["toDate"];
    nameWh = argument['nameWh'];
    getListReportWarehouseDetail();
    super.onInit();
  }
}
