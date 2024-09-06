

import 'package:get/get.dart';
import '../controller/configuration_price_controller.dart';
import '../controller/partner_controller.dart';

class ConfigurationPriceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConfigurationPriceController>(() => ConfigurationPriceController(),
        fenix: true);
  }

}