

import 'package:get/get.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_mail_controller.dart';



class ConfigurationMailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConfigurationMailController>(() => ConfigurationMailController(),
        fenix: true);
  }

}