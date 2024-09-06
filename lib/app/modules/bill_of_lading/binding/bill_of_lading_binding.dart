

import 'package:get/get.dart';
import '../controller/bill_of_lading_controller.dart';

class BillOfLadingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BillOfLadingController>(() => BillOfLadingController(),
        fenix: true);
  }

}