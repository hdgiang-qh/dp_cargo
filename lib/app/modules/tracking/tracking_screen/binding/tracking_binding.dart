import 'package:get/get.dart';
import 'package:vncss/app/modules/tracking/tracking_screen/controller/tracking_status_controller.dart';

import '../controller/tracking_controller.dart';

class TrackingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TrackingController>(() => TrackingController(),
        fenix: true);
    Get.lazyPut<TrackingStatusController>(() => TrackingStatusController(),fenix: true);
  }
}