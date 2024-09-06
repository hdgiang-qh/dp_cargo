import 'package:get/get.dart';

import '../controller/detail_transaction_controller.dart';
import '../controller/transaction_controller.dart';


class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
            () => TransactionController(),
        fenix: true);
    Get.lazyPut<DetailTransactionController>(
            () => DetailTransactionController(),
        fenix: true);
  }
}