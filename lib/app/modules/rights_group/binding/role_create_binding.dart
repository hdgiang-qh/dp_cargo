

import 'package:get/get.dart';
import 'package:vncss/app/modules/rights_group/controller/role_create_controller.dart';

import '../controller/rights_controller.dart';

class RoleCreateBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RoleCreateController>(() => RoleCreateController(),
        fenix: true);
  }

}