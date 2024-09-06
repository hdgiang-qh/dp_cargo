import 'package:get/get.dart';

import '../controller/list_orders_controller.dart';

class ListOrdersBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ListOrdersController>(() => ListOrdersController(), fenix: true);
  }

}