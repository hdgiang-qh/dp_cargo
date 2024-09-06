import 'package:get/get.dart';
import 'package:vncss/app/modules/bill_of_lading/view/bill_of_lading_detail.dart';
import 'package:vncss/app/modules/bill_of_lading/view/create_bol_scr.dart';
import 'package:vncss/app/modules/bill_of_lading/view/update_bol_scr.dart';
import 'package:vncss/app/modules/configuration/binding/coefficient_mail_binding.dart';
import 'package:vncss/app/modules/configuration/binding/configuration_bank_binding.dart';
import 'package:vncss/app/modules/configuration/binding/configuration_interface_binding.dart';
import 'package:vncss/app/modules/configuration/binding/configuration_prefix_binding.dart';
import 'package:vncss/app/modules/configuration/binding/configuration_price_binding.dart';
import 'package:vncss/app/modules/configuration/binding/detail_partner_binding.dart';
import 'package:vncss/app/modules/configuration/common_information.dart';
import 'package:vncss/app/modules/configuration/configuration_coefficient_box.dart';
import 'package:vncss/app/modules/configuration/configuration_price.dart';
import 'package:vncss/app/modules/configuration/configuration_screen.dart';
import 'package:vncss/app/modules/configuration/conflig_prefix.dart';
import 'package:vncss/app/modules/configuration/information_mail_server.dart';
import 'package:vncss/app/modules/configuration/shipping_partner.dart';
import 'package:vncss/app/modules/configuration/widget/add_configuration_bank.dart';
import 'package:vncss/app/modules/configuration/widget/add_configuration_price.dart';
import 'package:vncss/app/modules/configuration/widget/add_configuration_shipping.dart';
import 'package:vncss/app/modules/configuration/widget/update_configuration_shipping.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/create_delivery_bill/binding/confirm_create_binding.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/create_delivery_bill/view/create_delivery_bill_scr.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/delivery_detail/binding/detail_delivery_binding.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/delivery_detail/view/detail_delivery_bill_scr.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/delivery_detail/view/widget/create_bol_delivery.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/list_delivery/binding/delivery_bill_binding.dart';
import 'package:vncss/app/modules/report/binding/report_binding.dart';
import 'package:vncss/app/modules/rights_group/binding/role_create_binding.dart';
import 'package:vncss/app/modules/rights_group/right_group_add_screen.dart';
import 'package:vncss/app/modules/search/view/barcode_delivery_tracking_check.dart';
import 'package:vncss/app/modules/search/view/search_screen.dart';
import 'package:vncss/app/modules/staff/detali_staff/binding/detail_staff_binding.dart';
import 'package:vncss/app/modules/staff/detali_staff/view/detail_staff_scr.dart';
import 'package:vncss/app/modules/staff/detali_staff/view/edit_staff_scr.dart';
import 'package:vncss/app/modules/transaction/binding/transaction_detail_binding.dart';
import 'package:vncss/app/modules/transaction/view/add_transaction_scr.dart';
import '../modules/authencation/views/auth_view.dart';
import '../modules/barcode/ui/barcode_screen.dart';
import '../modules/bill_of_lading/binding/bill_of_lading_binding.dart';
import '../modules/bill_of_lading/binding/bill_of_lading_delivery_binding.dart';
import '../modules/bill_of_lading/binding/bill_of_lading_detail_binding.dart';
import '../modules/bill_of_lading/view/bill_of_lading_scr.dart';
import '../modules/change_password/binding/change_password_binding.dart';
import '../modules/change_password/view/change_password_page.dart';
import '../modules/configuration/acoount_bank.dart';
import '../modules/configuration/binding/configuration_box_binding.dart';
import '../modules/configuration/binding/configuration_common_binding.dart';
import '../modules/configuration/binding/partner_binding.dart';
import '../modules/configuration/widget/update_configuration_bank.dart';
import '../modules/customer/customer_detail/binding/detail_customer_binding.dart';
import '../modules/customer/customer_detail/view/customer_detail_screen.dart';
import '../modules/customer/customer_screen/binding/customer_binding.dart';
import '../modules/customer/customer_screen/view/customer_screen.dart';
import '../modules/delivery_bills/add_delivery_bills/binding/add_delivery_bill_binding.dart';
import '../modules/delivery_bills/add_delivery_bills/view/add_delivery_bills_view.dart';
import '../modules/delivery_bills/delivery/create_delivery_bill/binding/create_delivery_binding.dart';
import '../modules/delivery_bills/delivery/create_delivery_bill/view/confirm_create_delivery_scr.dart';
import '../modules/delivery_bills/delivery/delivery_detail/view/widget/detail_bol_delivery.dart';
import '../modules/delivery_bills/delivery/update_delivery_bill/view/edit_delivery_bill_scr.dart';
import '../modules/delivery_bills/delivery/list_delivery/view/delivery_bill_scr.dart';
import '../modules/delivery_bills/delivery/update_delivery_bill/view/edit_tracking_bill_scr.dart';
import '../modules/delivery_bills/delivery_bills_detail/binding/delivery_bill_detail_binding.dart';
import '../modules/delivery_bills/delivery_bills_detail/view/delivery_bill_detail_view.dart';
import '../modules/delivery_bills/list_delivery_bills/binding/list_delivery_bills_binding.dart';
import '../modules/delivery_bills/list_delivery_bills/binding/list_delivery_bills_destroy_binding.dart';
import '../modules/delivery_bills/list_delivery_bills/view/list_complete_delivery_view.dart';
import '../modules/delivery_bills/list_delivery_bills/view/list_delivery_bill_view.dart';
import '../modules/forget_password/binding/forget_password_binding.dart';
import '../modules/forget_password/view/forget_pass_otp_view.dart';
import '../modules/forget_password/view/forget_password_view.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_view.dart';
import '../modules/intro/view/login_view.dart';
import '../modules/login/binding/login_binding.dart';

import '../modules/authencation/binding/auth_binding.dart';
import '../modules/login/view/login_view.dart';
import '../modules/mawb/add_box_tracking/view/add_box_tracking.dart';
import '../modules/mawb/mawb_box_detail/binding/mawb_box_detail_binding.dart';
import '../modules/mawb/mawb_box_detail/view/mawb_box_detail_screen.dart';
import '../modules/mawb/mawb_box_detail/widget/search_box_tracking.view.dart';
import '../modules/mawb/mawb_screen/binding/mawb_binding.dart';
import '../modules/mawb/mawb_screen/view/mawb_screen.dart';
import '../modules/mawb/mawb_screen/widget/search_awb_tracking_view.dart';
import '../modules/mawb/mawb_detail/binding/mawb_detail_binding.dart';
import '../modules/mawb/mawb_detail/view/mawb_detail.dart';
import '../modules/mawb/mawb_detail/widget/exploit_awb_tracking_view.dart';
import '../modules/mawb/mawb_detail/widget/update_awb_tracking_view.dart';
import '../modules/mawb/sync_awb/binding/sync_awb_binding.dart';
import '../modules/mawb/sync_awb/view/sync_awb_screen.dart';
import '../modules/mawb/tracking_box_detail/view/tracking_box_detail.dart';
import '../modules/order/list_orders/binding/list_orders_binding.dart';
import '../modules/order/list_orders/view/list_orders_view.dart';
import '../modules/order/order_detail/binding/order_detail_binding.dart';
import '../modules/order/order_detail/view/order_detail_view.dart';
import '../modules/order/receive_order/binding/receive_order_binding.dart';
import '../modules/order/receive_order/view/receive_order_view.dart';
import '../modules/order/returns_order/binding/returns_order_binding.dart';
import '../modules/order/returns_order/view/returns_order_view.dart';
import '../modules/otp/binding/otp_binding.dart';
import '../modules/otp/view/otp_view.dart';
import '../modules/report/binding/report_bill_sale_binding.dart';
import '../modules/report/binding/report_warehouse_detail_binding.dart';
import '../modules/report/view/report_bill_sale_detail.dart';
import '../modules/report/view/report_item.dart';
import '../modules/report/view/report_warehouse_detail.dart';
import '../modules/rights_group/binding/rights_binding.dart';
import '../modules/rights_group/binding/rights_detail_binding.dart';
import '../modules/rights_group/right_group_edit_screen.dart';
import '../modules/rights_group/rights_group_screen.dart';
import '../modules/search/binding/search_tracking_binding.dart';
import '../modules/search/view/search_barecode.dart';
import '../modules/staff/view/add_staff_scr.dart';
import '../modules/staff/binding/staff_binding.dart';
import '../modules/staff/view/staff_scr.dart';
import '../modules/tracking/tracking_add/view/add_tracking.dart';
import '../modules/tracking/tracking_detail/binding/tracking_detail_binding.dart';
import '../modules/tracking/tracking_detail/view/tracking_detail.dart';
import '../modules/tracking/tracking_exploit/view/tracking_exploit.dart';
import '../modules/tracking/tracking_screen/binding/tracking_binding.dart';
import '../modules/tracking/tracking_screen/view/tracking_screen.dart';
import '../modules/tracking/tracking_update/view/update_tracking.dart';
import '../modules/transaction/binding/transaction_binding.dart';
import '../modules/transaction/view/detail_transaction_scr.dart';
import '../modules/transaction/view/transaction_scr.dart';
import '../modules/user/binding/user_binding.dart';
import '../modules/user/view/user_view.dart';
import '/app/modules/main/bindings/main_binding.dart';
import '/app/modules/main/views/main_view.dart';
import '/app/modules/settings/bindings/settings_binding.dart';
import '/app/modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME_INTRO,
      page: () => const IntroView(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DELIVERY_BILLS,
      page: () => ListDeliveryBillsView(),
      binding: ListDeliveryBillsBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DELIVERY_DESTROY_BILLS,
      page: () => ListDeliveryDestroyBillsView(),
      binding: ListDeliveryBillsDestroyBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DELIVERY_BILL,
      page: () => AddDeliveryBillView(),
      binding: AddDeliveryBillBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_BILLS,
      page: () => DeliveryBillList(),
      binding: DeliveryBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_DELIVERY_BILLS,
      page: () => CreateDeliveryBillScr(),
      binding: CreateDeliveryBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_CREATE_DELIVERY_BILLS,
      page: () => ConfirmCreateDeliveryScr(),
      binding: ConfirmCreateBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_BILL,
      page: () => const DeliveryBillDetailView(),
      binding: DeliveryBillDetailBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_DELIVERY_BILL,
      page: () => DetailDeliveryBill(),
      binding: DetailDeliveryBinding(),
    ),

    GetPage(
      name: _Paths.DETAIL_BOL_DELIVERY_BILL,
      page: () => DetailBolDelivery(),
      binding: BillOfLadingDetailBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DELIVERY_BILLS,
      page: () => EditDeliveryBillScr(),
      binding: DetailDeliveryBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TRACKING_DELIVERY_BILLS,
      page: () => EditTrackingDeliveryBillScr(),
      binding: DetailTrackingBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_BARCODE_TRACKING_DELIVERY,
      page: () => BarCodeDeliveryTrackingCheck(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => TransactionsScr(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TRANSACTION,
      page: () => AddTransactionScr(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_DETAIL,
      page: () => DetailTransactions(),
      binding: TransactionDetailBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(phone: Get.arguments as String),
      binding: OTPBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASS_OTP,
      page: () => ForgetPasswordOtpView(email: Get.arguments as String),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ORDERS,
      page: () => ListOrder(),
      binding: ListOrdersBinding(),
    ),
    GetPage(
      name: _Paths.RETURNS_ORDER,
      page: () => ReturnsOrderView(),
      binding: ReturnsOrderBinding(),
    ),
    GetPage(
      name: _Paths.RECEIVE_ORDER,
      page: () => ReceiveOrderView(),
      binding: ReceiveOrderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => OrderDetail(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER,
      page: () => CustomerScr(),
      binding: CustomerBinding(),
    ),
    GetPage(
      name: _Paths.STAFF,
      page: () => Staffs(),
      binding: StaffBinding(),
    ),
    GetPage(
      name: _Paths.ADD_STAFF,
      page: () => AddStaffScr(),
      binding: StaffBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_STAFF,
      page: () => DetailStaff(),
      binding: DetailStaffBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_STAFF,
      page: () => EditStaffScr(),
      binding: DetailStaffBinding(),
    ),
    GetPage(
      name: _Paths.TRACKING,
      page: () => TrackingScreens(),
      binding: TrackingBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_TRACKING,
      page: () => SearchScreen(),
      binding: SearchTrackingBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_BARCODE,
      page: () => BarCodeSearch(),
    ),
    GetPage(
      name: _Paths.QR_SCREEN,
      page: () => const BarCodeScreen(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRACKING,
      page: () => TrackingDetailScreen(),
      binding: DetailTrackingBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_TRACKING,
      page: () => UpdateTracking(),
    ),
    GetPage(
      name: _Paths.ADD_BOX_TRACKING,
      page: () => AddBoxTrackingScreen(),
    ),
    GetPage(
      name: _Paths.EXPLOIT_TRACKING,
      page: () => ExploitTracking(),
    ),
    GetPage(
      name: _Paths.DETAIL_ORDER,
      page: () => OrderDetail(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CUSTOMER,
      page: () => const CustomerDetailSccreen(),
      binding: DetailCustomerBinding(),
    ),
    GetPage(
        name: _Paths.BILL_0F_LADING,
        page: () => BillOfLadings(),
        binding: BillOfLadingBinding()),
    GetPage(
        name: _Paths.BILL_0F_LADING_DETAIL,
        page: () => BillOfLadingDetail(),
        binding: BillOfLadingDetailBinding()),
    GetPage(
        name: _Paths.CREATE_BILL_0F_LADING,
        page: () => CreateBillOfLading(),
        binding: BillOfLadingBinding()),
    GetPage(
        name: _Paths.CREATE_BILL_0F_LADING_DELIVERY,
        page: () => CreateBolDelivery(codeDelivery: Get.arguments as String,),
        binding: BillOfLadingDeliveryBinding()),
    GetPage(
        name: _Paths.UPDATE_BILL_0F_LADING,
        page: () => UpdateBillOfLading(),
        binding: BillOfLadingDetailBinding()),
    GetPage(
        name: _Paths.MAWB_DETAIL,
        page: () =>  MAWBDetailScreen(),
        binding: MawbDetailBinding()),
    GetPage(
        name: _Paths.AWB_BOXES_TRACKING,
        page: () => MawbBoxDetail(),
        binding: MawbBoxDetailBinding()),
    GetPage(
      name: _Paths.REPORT,
      page: () => Report(
        indexReport: Get.arguments as int,
      ),
      binding: ReportBinding()
    ),
    GetPage(
        name: _Paths.REPORT_BILL_SALE,
        page: () => DetailBillReportSale(),
        binding: ReportBillSaleBinding()),
    GetPage(
        name: _Paths.REPORT_WAREHOUSE_DETAIL,
        page: () => DetailWareHouse(),
        binding: ReportWarehouseDetailBinding()),
    GetPage(
      name: _Paths.QR_AWB_TRACKING,
      page: () => SearchAwbTrackingView(),
    ),
    GetPage(
      name: _Paths.QR_BOX_TRACKING,
      page: () => SearchBoxTrackingView(),
    ),
    GetPage(
        name: _Paths.MAWB,
        page: () => MAWBScreen(),
        binding: AWBBinding()),
    GetPage(
        name: _Paths.UPDATE_AWB_TRACKING,
        page: () => UpdateAwbTrackingView(),
        binding: DetailTrackingBinding()),
    GetPage(
        name: _Paths.EXPLOIT_AWB_TRACKING,
        page: () => ExploitAwbTrackingView(),
        binding: DetailTrackingBinding()) ,
    GetPage(
        name: _Paths.SHIPPING_PARTNER,
        page: () => ShippingPartnerScreen(),
        binding: PartnerBinding()) ,
    GetPage(
        name: _Paths.ADD_SHIPPING_PARTNER,
        page: () => AddConfigurationShipping(),
        binding: PartnerBinding()) ,
    GetPage(
        name: _Paths.DETAIL_SHIPPING_PARTNER,
        page: () => UpdateConfigurationShipping(),
        binding: DetailPartnerBinding()) ,
    GetPage(
        name: _Paths.COEFFICIENT_BOX,
        page: () => ConfigurationBoxScreen(),
        binding: ConfigurationBoxBinding()),
    GetPage(
        name: _Paths.COEFFICIENT_PREFIX,
        page: () => PrefixScreen(),
        binding: ConfigurationPrefixBinding()),
    GetPage(
        name: _Paths.COEFFICIENT_MAIL,
        page: () => InformationMailServerScreen(),
        binding: ConfigurationMailBinding()),
    GetPage(
        name: _Paths.COEFFICIENT_COMMON,
        page: () => CommonInformationScreen(),
        binding: ConfigurationCommonBinding()),
    GetPage(
        name: _Paths.COEFFICIENT_BANK,
        page: () => AccountBankScreen(),
        binding: ConfigurationBankBinding()),
    GetPage(
        name: _Paths.ADD_COEFFICIENT_BANK,
        page: () => AddConfigurationBank(),
        binding: ConfigurationBankBinding()),
    GetPage(
        name: _Paths.UPDATE_COEFFICIENT_BANK,
        page: () => UpdateConfigurationBank(),
        binding: ConfigurationBankBinding()),
    GetPage(
        name: _Paths.COEFFICIENT_GROUP,
        page: () => RightsGroupScreen(),
        binding: RightsBinding()),
    GetPage(
        name: _Paths.COEFFICIENT_GROUP_DETAIL,
        page: () => RightsGroupEditScreen(),
        binding: RightsDetailBinding()),
    GetPage(
        name: _Paths.COEFFICIENT_GROUP_CREATE,
        page: () => RightGroupAddScreen(),
        binding: RoleCreateBinding()),
    GetPage(
        name: _Paths.COEFFICIENT_PRICE,
        page: () => PriceConfigurationScreen(),
        binding: ConfigurationPriceBinding()),
    GetPage(
        name: _Paths.ADD_COEFFICIENT_PRICE,
        page: () => AddConfigurationPrice(),
        binding: ConfigurationPriceBinding()),
    GetPage(
        name: _Paths.COEFFICIENT_INTERFACE,
        page: () => ConfigurationScreen(),
        binding: ConfigurationInterfaceBinding()),
    GetPage(
      name: _Paths.ADD_TRACKING,
      page: () => AddTracking(),
    ),
    GetPage(
      name: _Paths.SYNC_AWB,
      page: () => const SyncAwbScreen(),
      binding: SyncAwbBinding()
    ),
    GetPage(
      name: _Paths.TRACKING_BOX_DETAIL,
      page: () => TrackingBoxDetail(),
    ),
  ];
}
