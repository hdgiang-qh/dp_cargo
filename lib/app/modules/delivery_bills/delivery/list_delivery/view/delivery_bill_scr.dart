import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vncss/app/core/base/base_view.dart';
import 'package:vncss/app/core/model/page_state.dart';
import 'package:vncss/app/core/widget/paging_view.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/modules/common_widget/app_bar_widget.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/item_list_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/info_delivery_bill_admin.dart';
import 'package:vncss/app/modules/transaction/controller/transaction_controller.dart';
import 'package:vncss/app/routes/app_pages.dart';
import 'package:vncss/generated/l10n.dart';

import '../../../../../data/model/model/delivery_bill.dart';
import '../../../../common_widget/const.dart';
import '../../../../main/controllers/main_controller.dart';
import '../../widget/skeletonizer_loading.dart';
import '../controller/delivery_controller.dart';

class DeliveryBillList extends BaseView<DeliveryController> {
  final controllerName = Get.find<TransactionController>();
  final controllerMain = Get.find<MainController>();

  final GlobalKey<ScaffoldState> _scaffoldKeyBill = GlobalKey<ScaffoldState>();
  DateTimeRange? _selectedDates;
  String? startDate, endDate;

  void _openDrawer() {
    _scaffoldKeyBill.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKeyBill,
        body: SafeArea(
          child: Obx(() {
            return Column(
              children: [
                AppBarWidget(
                  title: "Phiếu xuất kho",
                  onBack: () {
                    Get.back(result: true);
                  },
                  showFilter: true,
                  onFilter: () {
                    _openDrawer();
                  },
                ),
                SizedBox(
                  height: 50,
                  child: Scrollbar(
                    thumbVisibility: true,
                    thickness: 1,
                    child: Obx(() {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          itemCount: controller.listTotal.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                controller.onTapStatus(index);
                              },
                              child: Obx(() {
                                return Stack(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: controller.colors[index]),
                                        color: controller.currentIndex.value ==
                                                index
                                            ? controller.colors[index]
                                            : Colors.white,
                                      ),
                                      child: Text(
                                        controller.title[index],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                controller.currentIndex.value !=
                                                        index
                                                    ? controller.colors[index]
                                                    : Colors.white),
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.white),
                                              color: controller.colors[index],
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6),
                                            child: Text(
                                              controller.title[index] ==
                                                      "Tất cả"
                                                  ? controller.total.toString()
                                                  : controller
                                                      .listTotal[index - 1]
                                                      .total
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ))),
                                  ],
                                );
                              }),
                            );
                          });
                    }),
                  ),
                ),
                Gap(8.h),
                Expanded(
                    child: Obx(() {
                      if (controller.isLoading.value == false && controller.listDeliveryBill.isEmpty) {
                        return FutureBuilder(
                          future: Future.delayed(const Duration(seconds: 2)),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return SkeletonizerLoading(
                                loading: controller.isLoading.value,
                              );
                            } else {
                              return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Danh sách trống"),
                                      Gap(10.h),
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.onRefreshPage();
                                        },
                                        child: const Text('Tải lại'),
                                      ),
                                    ],
                                  ));
                            }
                          },
                        );
                      }
                      return PagingView.separated(
                          onLoadNextPage: () {
                            controller.onLoadNextPage();
                          },
                          onRefresh: () async {
                            controller.onRefreshPage();
                          },
                          isLoading:
                          controller.pageState == PageState.LOADING,
                          builder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                final result = await Get.toNamed(
                                    Routes.DETAIL_DELIVERY_BILL,
                                    arguments: {
                                      'id': controller
                                          .listDeliveryBill[index].id,
                                      'idTracking': controller
                                          .listDeliveryBill[index]
                                          .customer?[0]
                                          .id
                                    });
                                if (result == true) {
                                  Future.delayed(
                                      const Duration(milliseconds: 500),
                                          () {
                                        controller.onRefreshPage();
                                      });
                                }
                              },
                              child: Obx(() {
                                return Container(
                                  color: Colors.white,
                                  padding:
                                  const EdgeInsets.only(top: 16),
                                  child: Column(
                                    children: [
                                      ItemListWidget(
                                          headText: controller
                                              .listDeliveryBill[index]
                                              .code
                                              .toString(),
                                          showIcon: true,
                                          showChip: true,
                                          fontWeightHead: true,
                                          svgPath:
                                          "assets/image/copy_text.svg",
                                          onCopyText: () {
                                            Clipboard.setData(
                                                ClipboardData(
                                                    text: controller
                                                        .listDeliveryBill[
                                                    index]
                                                        .code
                                                        .toString()));
                                            Fluttertoast.showToast(
                                                msg:
                                                "Đã copy vào clipboard",
                                                toastLength:
                                                Toast.LENGTH_SHORT,
                                                gravity:
                                                ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor:
                                                Colors.green,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          },
                                          color: controller
                                              .buildColor(
                                              value: controller.listDeliveryBill[index].deliveryBillStatus?.value.toString() ??
                                                  "")
                                              .withOpacity(0.2),
                                          colorText: controller.buildTextColor(
                                              value: controller
                                                  .listDeliveryBill[
                                              index]
                                                  .deliveryBillStatus
                                                  ?.value
                                                  .toString() ??
                                                  ""),
                                          endText: controller
                                              .listDeliveryBill[index]
                                              .deliveryBillStatus
                                              ?.value
                                              .toString() ??
                                              ""),
                                      ItemListWidget(
                                          headText: "Khách hàng",
                                          showIcon: true,
                                          svgPath:
                                          "assets/image/add_per1.svg",
                                          endText: controller
                                              .listDeliveryBill[index]
                                              .customer![0]
                                              .name
                                              .toString()),
                                      ItemListWidget(
                                          headText: "Địa chỉ",
                                          showIcon: true,
                                          svgPath:
                                          "assets/image/local.svg",
                                          isAddress: true,
                                          endText: controller
                                              .listDeliveryBill[index]
                                              .customerAddress
                                              .toString()),
                                      Gap(16.h),
                                      Container(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            vertical: 16),
                                        margin:
                                        const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color:
                                                  ColorApp.greyD7)),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/image/list.svg"),
                                                Gap(10.w),
                                                const Text(
                                                  "Danh sách mã vận đơn",
                                                  style: TextStyle(
                                                      color: ColorApp
                                                          .grey74,
                                                      fontSize: 12),
                                                )
                                              ],
                                            ),
                                            Gap(8.h),
                                            Column(
                                              children: controller
                                                  .listDeliveryBill[
                                              index]
                                                  .vnDeliveryOrder
                                                  ?.map((vnDeliveryOrder) =>
                                                  InfoDeliveryBillAdmin(
                                                    label: vnDeliveryOrder
                                                        .code ??
                                                        S.current
                                                            .isNull,
                                                    data:
                                                    '${vnDeliveryOrder.quantity} box',
                                                    isCode:
                                                    true,
                                                  ))
                                                  .toList() ??
                                                  [],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            );
                          },
                          count: controller.listDeliveryBill.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 20.h);
                          });
                    })),
                controllerMain.userLogin.value.role?.id == 1
                    ? Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ButtonWidget(
                          buttonText: "Thêm phiếu xuất kho",
                          bgcolor: primaryColor,
                          textColor: ColorApp.whiteFA,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          onTap: () {
                            Get.toNamed(Routes.CREATE_DELIVERY_BILLS);
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          }),
        ),
        endDrawer: Drawer(
          width: context.width * 0.9,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: <Widget>[
              const SizedBox(
                height: 150,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Bộ lọc tìm kiếm',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: ColorApp.whiteFA),
                      )),
                ),
              ),
              Container(
                height: context.height - 150,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Nhập thông tin",
                              style:
                                  TextStyle(fontSize: 16, color: textPrimary),
                            )),
                        AppTextInputField(
                          controller: controller.forCode,
                          hint: "Tìm theo mã phiếu",
                        ),
                        TypeAheadField<TransactionName>(
                          controller: controller.forClient,
                          suggestionsCallback: (pattern) {
                            return controllerName.listTransactionName
                                .where((TransactionName item) =>
                                    "${item.idCustomer} | ${item.nickName} | ${item.name}"
                                        .toString()
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()))
                                .toList();
                          },
                          builder: (context, controller, focusNode) {
                            return AppTextInputField(
                              controller: controller,
                              focusNode: focusNode,
                              hint: "Nhập tên khách hàng",
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(
                                "${suggestion.idCustomer} | ${suggestion.nickName} | ${suggestion.name}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            );
                          },
                          onSelected: (suggestion) {
                            controller.forClient.text =
                                "${suggestion.idCustomer} | ${suggestion.nickName} | ${suggestion.name}";
                            controller.customerName.value =
                                suggestion.id.toString();
                          },
                          loadingBuilder: (context) => const Text('Loading...'),
                          errorBuilder: (context, error) =>
                              const Text('Error!'),
                          emptyBuilder: (context) =>
                              const Text('Không có dữ liệu phù hợp'),
                        ),
                        AppTextInputField(
                          controller: controller.date,
                          hint: "Ngày",
                          showSuffix: true,
                          readOnly: true,
                          suffixPath: "assets/image/calendar.svg",
                          onSuffix: () async {
                            showDateRangePicker(
                                confirmText: "Lưu",
                                cancelText: "Huỷ",
                                context: context,
                                initialDateRange: _selectedDates,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2030),
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData(), child: child!);
                                }).then((value) {
                              if (value != null) {
                                controller.dateFilter.value = value;
                                controller.fromDateChoose.value =
                                    value.start.toUtc();
                                controller.toDateChoose.value =
                                    value.end.toUtc();
                                startDate =
                                    value.start.toDateTimeStringWithoutHour();
                                endDate =
                                    value.end.toDateTimeStringWithoutHour();
                                controller.date.text = "$startDate - $endDate";
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonWidget(
                              buttonText: "Thiết lập lại",
                              width: 140,
                              borderColor: primaryColor,
                              textColor: primaryColor,
                              onTap: () {
                                controller.onClearValue();
                                controller.onRefreshPage();
                                Get.back();
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ButtonWidget(
                              buttonText: "Áp dụng",
                              width: 140,
                              bgcolor: primaryColor,
                              textColor: ColorApp.whiteFA,
                              onTap: () async {
                                controller.onSelected();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
