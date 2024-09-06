import 'package:get/get.dart';

import '../controller/tracking_customer_detail_controller.dart';

class BillCustomerDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackingCustomerDetailController>(
            () => TrackingCustomerDetailController(),
        fenix: true);
  }
}