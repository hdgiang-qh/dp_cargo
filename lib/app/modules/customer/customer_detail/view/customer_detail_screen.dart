import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_colors.dart';
import '../../../common_widget/const.dart';
import '../../customer_add/view/customer_add.dart';
import '../../customer_info/view/information_customer.dart';
import '../../config_customer_detail/view/config_customer_detail_view.dart';
import '../../bill_customer_detail/view/bill_customer_detail_view.dart';
import '../../tracking_customer_detail/view/tracking_customer_detail_view.dart';
import '../../transaction_customer_detail/view/transaction_customer_detail_view.dart';
import '../controller/detail_customer_controller.dart';

class DetailCustomer extends BaseView<DetailCustomerController> {
  Future<void> onRefreshPage() async {
    await controller.getDetailCustomers();
  }

  @override
  Widget body(BuildContext context) {
    return const CustomerDetailSccreen();
  }
}

class CustomerDetailSccreen extends StatefulWidget {
  const CustomerDetailSccreen();

  @override
  State<CustomerDetailSccreen> createState() => _CustomerDetailSccreenState();
}

class _CustomerDetailSccreenState extends State<CustomerDetailSccreen> {
  final controller = Get.find<DetailCustomerController>();
  final _list = [
    "Thông tin",
    "Phiếu xuất  kho",
    "Giao dịch",
    "Tracking",
    "Bảng giá"
  ];
  final _screen = [
    const InformationCustomerView(),
    const BillCustomerDetailView(),
    const TransactionCustomerDetailView(),
    const TrackingCustomerDetailView(),
    const ConfigCustomerDetailView(),
  ];
  int currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Container(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back, size: 30),
              ),
              const Expanded(
                  child: Center(
                      child: Text(
                "Chi tiết khách hàng",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))),
            ])),
            SizedBox(
              height: 55,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollController,
                thickness: 1,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 150,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: primaryColor),
                            color:
                                currentIndex == index ? primaryColor : Colors.white,
                          ),
                          child: Text(
                            _list[index],
                            style: TextStyle(
                                fontSize: 13,
                                color: currentIndex != index
                                    ? primaryColor
                                    : Colors.white),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(child: _screen[currentIndex]),
      ])),
    );
  }
}
