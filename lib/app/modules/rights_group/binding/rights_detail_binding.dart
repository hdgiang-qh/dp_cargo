

import 'package:get/get.dart';

import '../controller/rights_detail_controller.dart';

class RightsDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RightsDetailController>(() => RightsDetailController(),
        fenix: true);
  }

}