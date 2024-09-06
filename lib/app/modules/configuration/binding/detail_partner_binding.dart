

import 'package:get/get.dart';
import 'package:vncss/app/modules/configuration/controller/detail_partner_controller.dart';
import '../controller/partner_controller.dart';

class DetailPartnerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailPartnerController>(() => DetailPartnerController(),
        fenix: true);
  }

}