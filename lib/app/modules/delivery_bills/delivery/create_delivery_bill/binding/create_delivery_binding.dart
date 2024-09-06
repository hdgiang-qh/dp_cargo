import 'package:get/get.dart';

import '../controller/create_delivery_bill_controller.dart';

class CreateDeliveryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CreateDeliveryController>(() => CreateDeliveryController(),
        fenix: true);
  }

}