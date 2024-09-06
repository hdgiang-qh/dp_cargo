import 'package:get/get.dart';
import '../controller/bill_customer_detail_controller.dart';

class BillCustomerDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillCustomerDetailController>(
            () => BillCustomerDetailController(),
        fenix: true);
  }
}