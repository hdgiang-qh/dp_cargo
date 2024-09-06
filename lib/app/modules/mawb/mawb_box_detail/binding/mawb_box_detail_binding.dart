import 'package:get/get.dart';
import '../controller/mawb_box_detail_controller.dart';

class MawbBoxDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MawbBoxDetailController>(
            () => MawbBoxDetailController(),
        fenix: true);
  }
}