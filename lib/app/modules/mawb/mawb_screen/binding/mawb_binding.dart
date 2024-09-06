import 'package:get/get.dart';

import '../controller/mawb_controller.dart';


class AWBBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AWBController>(() => AWBController(),
        fenix: true);
  }

}