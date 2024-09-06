import 'package:get/get.dart';
import '../controller/transaction_customer_detail_controller.dart';

class TransactionCustomerDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionCustomerDetailController>(
            () => TransactionCustomerDetailController(),
        fenix: true);
  }
}