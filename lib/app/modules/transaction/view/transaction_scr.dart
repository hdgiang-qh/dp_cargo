import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../../generated/l10n.dart';
import '../../../core/base/base_view.dart';
import '../../../core/enum/transaction_status.dart';
import '../../../core/model/page_state.dart';
import '../../../core/widget/paging_view.dart';
import '../../../routes/app_pages.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/item_detail_list_widget.dart';
import '../../common_widget/item_list_widget.dart';
import '../../common_widget/textfield_widget.dart';
import '../controller/transaction_controller.dart';

class TransactionsScr extends BaseView<TransactionController> {
  final scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKeyTransaction =
      GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKeyTransaction.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKeyTransaction,
        body: SafeArea(
          child: Column(
            children: [
              AppBarWidget(
                title: "Giao dịch",
                onBack: () {
                  Get.back();
                },
                showFilter: true,
                onFilter: () {
                  _openEndDrawer();
                },
              ),
              SizedBox(
                height: 50,
                child: Scrollbar(
                  thickness: 1,
                  thumbVisibility: true,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      primary: false,
                      itemCount: TransactionStatuses.values.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return GestureDetector(
                            onTap: () {
                              controller.onTapStatusV(
                                  index, controller.methods[index]);
                              controller.onSelected();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(8),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: controller.colorMethod[index]),
                                color: controller.currentIndex.value == index
                                    ? controller.colorMethod[index]
                                    : Colors.white,
                              ),
                              child: Text(
                                controller.methods[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        controller.currentIndex.value != index
                                            ? controller.colorMethod[index]
                                            : Colors.white),
                              ),
                            ),
                          );
                        });
                      }),
                ),
              ),
              Gap(8.h),
              Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value == false && controller.listTransaction.isEmpty) {
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
                        scrollController: scrollController,
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
                                  Routes.TRANSACTION_DETAIL,
                                  arguments: {
                                    'id': controller
                                        .listTransaction[index].id,
                                  });
                              if (result == true) {
                                Future.delayed(
                                    const Duration(milliseconds: 1000),
                                        () => controller.onRefreshPage());
                              }
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  ItemListWidget(
                                    showIcon: true,
                                    showChip: true,
                                    fontWeightHead: true,
                                    svgPath:
                                    "assets/image/copy_text.svg",
                                    onCopyText: () {
                                      Clipboard.setData(ClipboardData(
                                          text: controller
                                              .listTransaction[index].id
                                              .toString()));
                                      Fluttertoast.showToast(
                                          msg: "Đã copy vào clipboard",
                                          toastLength:
                                          Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    },
                                    headText: controller
                                        .listTransaction[index].id
                                        .toString(),
                                    color: controller
                                        .listTransaction[index]
                                        .status
                                        ?.color ??
                                        Colors.red,
                                    endText: controller.statusAction(
                                        values: controller
                                            .listTransaction[index]
                                            .status
                                            ?.value
                                            .toString() ??
                                            S.current.isNull),
                                  ),
                                  ItemDetailListWidget(
                                    head: 'Khách hàng:',
                                    endText: controller
                                        .listTransaction[index]
                                        .customer?[0]
                                        ?.name
                                        .toString() ??
                                        S.current.isNull,
                                  ),
                                  ItemDetailListWidget(
                                    head: 'Loại giao dịch:',
                                    endText: controller
                                        .listTransaction[index]
                                        .customerTransactionType
                                        ?.value
                                        .toString() ??
                                        S.current.isNull,
                                  ),
                                  ItemDetailListWidget(
                                    head: 'Số tiền GD:',
                                    fontWeight: true,
                                    endText: controller
                                        .listTransaction[index]
                                        .formattedCustomerTransactionMoney,
                                    color: controller
                                        .listTransaction[
                                    index]
                                        .customerTransactionType
                                        ?.value
                                        .toString() ==
                                        "NẠP TIỀN" ||
                                        controller
                                            .listTransaction[
                                        index]
                                            .customerTransactionType
                                            ?.value
                                            .toString() ==
                                            "HOÀN TIỀN"
                                        ? ColorApp.green08
                                        : ColorApp.redB6,
                                  ),
                                  ItemDetailListWidget(
                                    head: 'Số dư sau GD:',
                                    fontWeight: true,
                                    endText: controller
                                        .listTransaction[index]
                                        .formattedCustomerTransactionBalance,
                                    color: controller
                                        .listTransaction[index]
                                        .formattedCustomerTransactionBalanceDouble
                                        .toInt() <=
                                        0
                                        ? ColorApp.redB6
                                        : ColorApp.green08,
                                  ),
                                  ItemDetailListWidget(
                                    head: 'Thời gian:',
                                    endText: controller
                                        .listTransaction[index]
                                        .formattedCustomerTransactionDate,
                                  ),
                                  ItemDetailListWidget(
                                    head: 'Ghi chú:',
                                    align: true,
                                    endText: controller
                                        .listTransaction[index]
                                        .customerTransactionNote ??
                                        S.current.isNull,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        count: controller.listTransaction.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 16.h);
                        });
                  })),
              Gap(8.h),
              ButtonWidget(
                buttonText: "Thêm giao dịch",
                bgcolor: primaryColor,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                textColor: ColorApp.whiteFA,
                onTap: () async {
                  controller.name.clear();
                  controller.money.clear();
                  controller.typeTrans.clear();
                  controller.type.value = null;
                  controller.note.clear();
                  controller.bank.clear();
                  controller.urlImage = null;
                  final result = await Get.toNamed(Routes.ADD_TRANSACTION);
                  if (result == true) {
                    Future.delayed(const Duration(milliseconds: 1000),
                        () => controller.onRefreshPage());
                  }
                },
              ),
              Gap(8.h)
            ],
          ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Nhập thông tin",
                          style: TextStyle(fontSize: 16),
                        ),
                        TypeAheadField<TransactionName>(
                          controller: controller.values,
                          suggestionsCallback: (pattern) {
                            return controller.listTransactionName
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
                            controller.values.text =
                                "${suggestion.idCustomer} | ${suggestion.nickName} | ${suggestion.name}";
                            controller.customerId = suggestion.id.toString();
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
                          onTap: () async {
                            await showDateRangePicker(
                                confirmText: "Lưu",
                                cancelText: "Huỷ",
                                context: context,
                                initialDateRange: controller.selectedDates,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2030),
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData(), child: child!);
                                }).then((value) {
                              if (value != null) {
                                controller.fromDateChoose.value =
                                    value.start.toUtc().toIso8601String();
                                controller.toDateChoose.value =
                                    value.end.toUtc().toIso8601String();
                                controller.startDate =
                                    value.start.toDateTimeStringWithoutHour();
                                controller.endDate =
                                    value.end.toDateTimeStringWithoutHour();
                                controller.date.text =
                                    "${controller.startDate} - ${controller.endDate}";
                              }
                            });
                          },
                        ),
                        Gap(4.h),
                        Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(width: 1, color: ColorApp.greyD7),
                              borderRadius: BorderRadius.circular(4)),
                          child: Obx(() {
                            return DropdownButton(
                              hint: const Text(
                                "Chọn trạng thái",
                                style: TextStyle(fontSize: 13),
                              ),
                              underline: Container(),
                              isExpanded: true,
                              icon: const Icon(Icons.expand_more),
                              value: controller.actionStatuses.value,
                              items: ActionStatuses.values
                                  .map<DropdownMenuItem<ActionStatuses>>(
                                      (e) => DropdownMenuItem<ActionStatuses>(
                                            value: e,
                                            child: Text(e.valueUp),
                                          ))
                                  .toList(),
                              onChanged: (ActionStatuses? category) {
                                controller.updateActionStatus(category);
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ButtonWidget(
                                buttonText: "Thiết lập lại",
                                borderColor: primaryColor,
                                textColor: primaryColor,
                                onTap: () {
                              //    controller.onClearValue();
                                  controller.onRefreshPage();
                                  Get.back();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: ButtonWidget(
                                buttonText: "Áp dụng",
                                bgcolor: primaryColor,
                                borderColor: primaryColor,
                                textColor: ColorApp.whiteFA,
                                onTap: () {
                                  controller.checkEmptyValue();
                                },
                              ),
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
