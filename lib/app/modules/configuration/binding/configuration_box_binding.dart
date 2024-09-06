



import 'package:get/get.dart';

import '../controller/configuration_box_controller.dart';

class ConfigurationBoxBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConfigurationBoxController>(() => ConfigurationBoxController(),
        fenix: true);
  }

}