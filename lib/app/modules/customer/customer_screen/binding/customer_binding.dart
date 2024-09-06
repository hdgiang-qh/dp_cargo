import 'package:get/get.dart';

import '../controller/customer_controller.dart';

class CustomerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(() => CustomerController(),
        fenix: true);
  }

}