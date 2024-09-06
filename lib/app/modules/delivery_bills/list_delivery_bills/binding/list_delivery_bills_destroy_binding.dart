import 'package:get/get.dart';

import '../../add_delivery_bills/controller/add_delivery_bill_controller.dart';
import '../controller/list_delivery_bills_destroy_controller.dart';

class ListDeliveryBillsDestroyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDeliveryBillsDestroyController>(() => ListDeliveryBillsDestroyController(), fenix: true);
    Get.lazyPut<AddDeliveryBillController>(() => AddDeliveryBillController(), fenix: true);
  }
}
