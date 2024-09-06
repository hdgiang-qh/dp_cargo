import 'package:get/get.dart';
import 'package:vncss/app/modules/bill_of_lading/controller/bill_of_lading_controller.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/delivery_detail/controller/detail_delivery_controller.dart';

class DetailDeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailDeliveryController>(
            () => DetailDeliveryController(),
        fenix: true);
    Get.lazyPut<BillOfLadingController>(
            () => BillOfLadingController(),
        fenix: true);

  }
}