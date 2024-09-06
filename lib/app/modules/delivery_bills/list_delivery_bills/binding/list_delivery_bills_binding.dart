import 'package:get/get.dart';

import '../../add_delivery_bills/controller/add_delivery_bill_controller.dart';
import '../controller/list_delivery_bills_controller.dart';

class ListDeliveryBillsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDeliveryBillController>(() => ListDeliveryBillController(), fenix: true);
    Get.lazyPut<AddDeliveryBillController>(() => AddDeliveryBillController(), fenix: true);
  }
}
