import 'package:get/get.dart';

import '../controller/staff_controller.dart';


class StaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffController>(() => StaffController(), fenix: true);
  }
}