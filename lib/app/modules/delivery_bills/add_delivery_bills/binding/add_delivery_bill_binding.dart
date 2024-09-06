import 'package:get/get.dart';

import '../controller/add_delivery_bill_controller.dart';

class AddDeliveryBillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDeliveryBillController>(() => AddDeliveryBillController(),
        fenix: true);
  }
}
