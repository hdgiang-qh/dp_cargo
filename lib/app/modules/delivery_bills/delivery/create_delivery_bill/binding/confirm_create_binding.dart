

import 'package:get/get.dart';

import '../controller/confirm_create_controller.dart';



class ConfirmCreateBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ConfirmCreateController>(() => ConfirmCreateController(),
        fenix: true);
  }

}