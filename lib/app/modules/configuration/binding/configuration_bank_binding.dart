

import 'package:get/get.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_bank_controller.dart';
import 'package:vncss/app/modules/configuration/controller/detail_configuration_bank_controller.dart';



class ConfigurationBankBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConfigurationBankController>(() => ConfigurationBankController(),
        fenix: true);

    Get.lazyPut<DetailConfigurationBankController>(() => DetailConfigurationBankController(),
        fenix: true);
  }

}