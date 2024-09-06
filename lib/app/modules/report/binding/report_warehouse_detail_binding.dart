

import 'package:get/get.dart';
import 'package:vncss/app/modules/report/controller/report_warehouse_detail_controller.dart';

class ReportWarehouseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportWarehouseDetailController>(() => ReportWarehouseDetailController(), fenix: true);
  }
}