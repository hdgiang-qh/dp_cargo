import 'package:get/get.dart';

import '../controller/detail_transaction_controller.dart';
import '../controller/transaction_controller.dart';


class TransactionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTransactionController>(
            () => DetailTransactionController(),
        fenix: true);
  }
}