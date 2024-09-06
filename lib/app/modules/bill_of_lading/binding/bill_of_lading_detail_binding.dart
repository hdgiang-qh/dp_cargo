

import 'package:get/get.dart';
import '../controller/bill_of_lading_detail_controller.dart';

class BillOfLadingDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BillOfLadingDetailController>(() => BillOfLadingDetailController(),
        fenix: true);
  }

}