

import 'package:get/get.dart';
import 'package:vncss/app/modules/search/controller/search_tracking_controller.dart';

class SearchTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchTrackingController>(() => SearchTrackingController(), fenix: true);
  }
}