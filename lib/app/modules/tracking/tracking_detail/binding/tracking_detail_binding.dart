import 'package:get/get.dart';
import '../controller/tracking_detail_controller.dart';

class DetailTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackingDetailController>(
            () => TrackingDetailController(),
        fenix: true);
  }
}