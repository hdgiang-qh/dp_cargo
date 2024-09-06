import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/receive_order_controller.dart';

class ReceiveOrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReceiveOrderController>(() => ReceiveOrderController());
  }

}