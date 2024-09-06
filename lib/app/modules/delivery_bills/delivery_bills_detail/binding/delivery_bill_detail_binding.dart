import 'package:get/get.dart';

import '../controller/delivery_bill_detail_controller.dart';

class DeliveryBillDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryBillDetailController>(
        () => DeliveryBillDetailController(),
        fenix: true);
  }
}
