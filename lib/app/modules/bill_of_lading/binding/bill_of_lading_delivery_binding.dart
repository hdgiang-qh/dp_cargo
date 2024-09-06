

import 'package:get/get.dart';
import '../controller/bill_of_lading_controller.dart';
import '../controller/bill_of_lading_delivery_controller.dart';

class BillOfLadingDeliveryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BillOfLadingDeliveryController>(() => BillOfLadingDeliveryController(),
        fenix: true);
  }

}