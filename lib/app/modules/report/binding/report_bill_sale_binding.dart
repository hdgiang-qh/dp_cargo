

import 'package:get/get.dart';
import 'package:vncss/app/modules/report/controller/report_bill_sale_detail_controller.dart';

class ReportBillSaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportBillSaleDetailController>(() => ReportBillSaleDetailController(), fenix: true);
  }
}