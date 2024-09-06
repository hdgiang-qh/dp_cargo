import 'package:get/get.dart';
import '../../customer_screen/controller/customer_controller.dart';
import '../controller/detail_customer_controller.dart';

class DetailCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCustomerController>(
            () => DetailCustomerController(),
        fenix: true);
  }
}