

import 'package:get/get.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_prefix_controller.dart';


class ConfigurationPrefixBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConfigurationPrefixController>(() => ConfigurationPrefixController(),
        fenix: true);
  }

}