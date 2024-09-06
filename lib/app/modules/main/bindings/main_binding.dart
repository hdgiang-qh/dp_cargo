import 'package:get/get.dart';
import 'package:vncss/app/modules/configuration/controller/partner_controller.dart';
import 'package:vncss/app/modules/customer/bill_customer_detail/controller/bill_customer_detail_controller.dart';
import 'package:vncss/app/modules/customer/customer_screen/controller/customer_controller.dart';
import 'package:vncss/app/modules/customer/customer_screen/controller/overview_controller.dart';
import 'package:vncss/app/modules/customer/customer_update/controller/config_price_controller.dart';
import 'package:vncss/app/modules/customer/tracking_customer_detail/controller/tracking_customer_detail_controller.dart';
import 'package:vncss/app/modules/delivery_bills/list_delivery_bills/controller/list_delivery_bills_destroy_controller.dart';

import '/app/modules/main/controllers/main_controller.dart';
import '../../bill_of_lading/controller/bill_of_lading_controller.dart';
import '../../customer/transaction_customer_detail/controller/transaction_customer_detail_controller.dart';
import '../../delivery_bills/delivery/list_delivery/controller/delivery_controller.dart';
import '../../delivery_bills/list_delivery_bills/controller/list_delivery_bills_controller.dart';
import '../../home/controller/home_controller.dart';
import '../../mawb/mawb_screen/controller/mawb_controller.dart';
import '../../mawb/mawb_screen/controller/mawb_status_controller.dart';
import '../../order/list_orders/controller/list_orders_controller.dart';
import '../../order/list_orders/controller/order_status_controller.dart';
import '../../report/controller/report_controller.dart';
import '../../search/controller/search_tracking_controller.dart';
import '../../staff/controller/staff_controller.dart';
import '../../tracking/tracking_screen/controller/tracking_controller.dart';
import '../../tracking/tracking_screen/controller/tracking_status_controller.dart';
import '../../transaction/controller/transaction_controller.dart';
import '../../user/controller/user_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ListDeliveryBillsDestroyController>(() => ListDeliveryBillsDestroyController());
    Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
    Get.lazyPut<DeliveryController>(() => DeliveryController(),fenix: true);
    Get.lazyPut<ListDeliveryBillController>(() => ListDeliveryBillController(),fenix: true);
    Get.lazyPut<UserController>(() => UserController(),fenix: true);
    Get.lazyPut<ListOrdersController>(() => ListOrdersController());
    Get.lazyPut<TrackingController>(() => TrackingController(), fenix: true);
    Get.lazyPut<CustomerController>(() => CustomerController(), fenix: true);
    Get.lazyPut<StaffController>(() => StaffController(),fenix: true);
    Get.lazyPut<TransactionController>(() => TransactionController(),fenix: true);
    Get.lazyPut<BillOfLadingController>(() => BillOfLadingController(),fenix: true);
    Get.lazyPut<ReportController>(() => ReportController( ),fenix: true);
    Get.lazyPut<BillCustomerDetailController>(() => BillCustomerDetailController(),fenix: true);
    Get.lazyPut<TransactionCustomerDetailController>(() => TransactionCustomerDetailController(),fenix: true);
    Get.lazyPut<TrackingCustomerDetailController>(() => TrackingCustomerDetailController(),fenix: true);
    Get.lazyPut<AWBController>(() => AWBController(),fenix: true);
    Get.lazyPut<TrackingStatusController>(() => TrackingStatusController(),fenix: true);
    Get.lazyPut<OverviewController>(() => OverviewController(),fenix: true);
    Get.lazyPut<ConfigPriceController>(() => ConfigPriceController(),fenix: true);
    Get.lazyPut<AwbStatusController>(() => AwbStatusController(),fenix: true);
    Get.lazyPut<SearchTrackingController>(() => SearchTrackingController());
    Get.lazyPut<TrackingTypeController>(() => TrackingTypeController(), fenix: true);
    Get.lazyPut<PartnerController>(() => PartnerController(), fenix: true);
  }
}
