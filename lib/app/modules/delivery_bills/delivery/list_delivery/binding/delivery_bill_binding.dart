

import 'package:get/get.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/list_delivery/controller/delivery_controller.dart';

class DeliveryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DeliveryController>(() => DeliveryController(),
        fenix: true);
  }

}