

import 'package:get/get.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_interface_controller.dart';



class ConfigurationInterfaceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConfigurationInterfaceController>(() => ConfigurationInterfaceController(),
        fenix: true);
  }

}