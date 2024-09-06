import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/customer/customer_screen/view/customer_screen.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/list_delivery/controller/delivery_controller.dart';
import 'package:vncss/app/modules/mawb/mawb_screen/view/mawb_screen.dart';
import 'package:vncss/app/modules/tracking/tracking_screen/view/tracking_screen.dart';
import 'package:vncss/app/modules/util/images.dart';
import 'package:vncss/app/routes/app_pages.dart';

import '../../../bill_of_lading/controller/bill_of_lading_controller.dart';
import '../../../customer/customer_screen/controller/customer_controller.dart';
import '../../../mawb/mawb_screen/controller/mawb_controller.dart';
import '../../../order/list_orders/controller/list_orders_controller.dart';
import '../../../search/controller/search_tracking_controller.dart';
import '../../../staff/controller/staff_controller.dart';
import '../../../tracking/tracking_screen/controller/tracking_controller.dart';
import '../../../transaction/controller/transaction_controller.dart';

class ItemButtonHome extends StatefulWidget {
  final icon;
  final tittle;
  Function() func;

  ItemButtonHome(
      {super.key,
      required this.icon,
      required this.tittle,
      required this.func});

  @override
  State<ItemButtonHome> createState() => _ItemButtonHomeState();
}

class _ItemButtonHomeState extends State<ItemButtonHome> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.func,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffE7A2A1),
                                offset: Offset(0.5, 0.5),
                                blurRadius: 2.0,
                                spreadRadius: 0.5),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0)
                          ]),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              widget.icon,
                              height: 30,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              widget.tittle,
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              Container(
                height: 8,
                width: 60,
                decoration: BoxDecoration(
                    color: const Color(0xffE7A2A1),
                    borderRadius: BorderRadius.circular(8)),
              )
            ]),
      ),
    );
  }
}

final List<Map<String, dynamic>> ItemHome = [
  {
    "icon": "assets/image/search_black.svg",
    "tittle": "Tìm tracking",
    "func": () {
      Get.find<SearchTrackingController>().onClear();
      Get.toNamed(Routes.SEARCH_TRACKING);
    }
  },
  {
    "icon": Images.box,
    "tittle": "Tracking",
    "func": () {
      Get.find<TrackingController>().clearFilter();
      Get.find<TrackingController>().onTapStatus(0);
      Get.toNamed(Routes.TRACKING);
     // Get.to(()=>TrackingScreens());
    }
  },
  {
    "icon": Images.file,
    "tittle": "Đơn hàng",
    "func": () {
      Get.find<ListOrdersController>().clearFilter();
      Get.find<ListOrdersController>().onTapStatus(0);
      Get.toNamed(Routes.LIST_ORDERS);
    }
  },
  {
    "icon": Images.handshake,
    "tittle": "Giao dịch",
    "func": () {
      Get.find<TransactionController>().onTapStatus(0,null.toString());
      Get.toNamed(Routes.TRANSACTION);
    }
  },
  {
    "icon": Images.airplane,
    "tittle": "MAWB",
    "func": () {
      Get.find<AWBController>().clearFilter();
      Get.find<AWBController>().onTapStatus(0);
      Get.toNamed(Routes.MAWB);
    }
  },
  {
    "icon": Images.file,
    "tittle": "Phiếu xuất kho",
    "func": () async{
      Get.find<DeliveryController>().onClearValue();
      Get.find<DeliveryController>().onTapStatus(0);
      Get.toNamed(Routes.DELIVERY_BILLS);
    }
  },
  {
    "icon": Images.cart_alt,
    "tittle": "Vận đơn VN",
    "func": () async{
      Get.find<BillOfLadingController>().values.clear();
      Get.find<BillOfLadingController>().onTapStatus(0,'');
      Get.toNamed(Routes.BILL_OF_LADING);
    }
  },
  {
    "icon": Images.staff,
    "tittle": "Nhân viên",
    "func": () {
      Get.find<StaffController>().onClearValue();
      Get.toNamed(Routes.STAFF);
    }
  },
  {
    "icon": Images.customer,
    "tittle": "Khách hàng",
    "func": (){
      Get.find<CustomerController>().clearFilter();
      Get.find<CustomerController>().getCustomersList();
      Get.toNamed(Routes.CUSTOMER);
    }
  },
  {
    "icon": Images.setting,
    "tittle": "Cấu hình",
    "func": () {
      Get.toNamed(Routes.COEFFICIENT_INTERFACE);
    }
  },
];
