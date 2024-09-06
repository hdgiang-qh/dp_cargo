

import 'package:get/get.dart';

import '../controller/rights_controller.dart';

class RightsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RightsController>(() => RightsController(),
        fenix: true);
  }

}