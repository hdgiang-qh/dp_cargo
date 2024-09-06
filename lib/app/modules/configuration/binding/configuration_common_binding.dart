

import 'package:get/get.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_common_controller.dart';

class ConfigurationCommonBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConfigurationCommonController>(() => ConfigurationCommonController());
  }

}