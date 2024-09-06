import 'package:get/get.dart';

import '../controller/returns_order_controller.dart';

class ReturnsOrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReturnsOrderController>(() => ReturnsOrderController());
  }

}