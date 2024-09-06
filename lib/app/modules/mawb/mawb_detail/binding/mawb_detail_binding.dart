import 'package:get/get.dart';

import '../controller/mawb_detail_controller.dart';

class MawbDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AWBDetailController>(
            () => AWBDetailController(),
        fenix: true);
  }
}