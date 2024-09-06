import 'package:get/get.dart';

import '../controller/detail_staff_controller.dart';

class DetailStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailStaffController>(
            () => DetailStaffController(),
        fenix: true);
  }
}