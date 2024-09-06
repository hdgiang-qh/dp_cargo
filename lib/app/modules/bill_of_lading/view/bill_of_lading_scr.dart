import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import '../../common_widget/textfield_widget.dart';
import '../../../routes/app_pages.dart';

import '../../../../generated/l10n.dart';
import '../../../core/base/base_view.dart';
import '../../../core/enum/bill_of_lading_status.dart';
import '../../../core/model/page_state.dart';
import '../../../core/utils/color_app.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../../core/widget/paging_view.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/button_widget.dart';
import '../../common_widget/item_detail_list_widget.dart';
import '../../common_widget/item_list_widget.dart';
import '../controller/bill_of_lading_controller.dart';

class BillOfLadings extends BaseView<BillOfLadingController> {
  final scrollController = ScrollController();

  final GlobalKey<ScaffoldState> _scaffoldKeyLading =
      GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKeyLading.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKeyLading,
        body: SafeArea(
          child: Column(
            children: [
              AppBarWidget(
                title: "Mã vận đơn VN",
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
                      primary: false,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: BillOfLadingStatus.values.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return GestureDetector(
                              onTap: () {
                                controller.onTapStatusV(index,
                                    BillOfLadingStatus.values[index].value);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color:
                                          controller.currentIndex.value != index
                                              ? BillOfLadingStatus
                                                  .values[index].color
                                              : Colors.white),
                                  color: controller.currentIndex.value == index
                                      ? BillOfLadingStatus.values[index].color
                                      : Colors.white,
                                ),
                                child: Text(
                                  BillOfLadingStatus.values[index].value,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          controller.currentIndex.value != index
                                              ? BillOfLadingStatus
                                                  .values[index].color
                                              : Colors.white),
                                ),
                              ));
                        });
                      }),
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value == false && controller.listBillOfLading.isEmpty) {
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
                      // scrollController: scrollController,
                      onLoadNextPage: () {
                        controller.onLoadNextPage();
                      },
                      onRefresh: () async {
                        controller.values.clear();
                        controller.onRefreshPage();
                      },
                      isLoading: controller.pageState == PageState.LOADING,
                      builder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.statusValue(
                                        status: controller
                                                .listBillOfLading[index]
                                                .status ??
                                            10) ==
                                    "Đã hủy bỏ"
                                ? null
                                : Get.toNamed(Routes.BILL_0F_LADING_DETAIL,
                                    arguments: {
                                        'id': controller
                                            .listBillOfLading[index].id,
                                      });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                ItemListWidget(
                                  showIcon: true,
                                  fontWeightHead: true,
                                  svgPath: "assets/image/copy_text.svg",
                                  headText:
                                      controller.listBillOfLading[index].code ??
                                          S.current.isNull,
                                  onCopyText: () {
                                    Clipboard.setData(ClipboardData(
                                        text: controller
                                            .listBillOfLading[index].code
                                            .toString()));
                                    Fluttertoast.showToast(
                                        msg: "Đã copy vào clipboard",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  showChip: true,
                                  color: controller.colorValue(
                                      status: controller
                                              .listBillOfLading[index].status ??
                                          10),
                                  endText: controller.statusValue(
                                      status: controller
                                              .listBillOfLading[index].status ??
                                          10),
                                  colorText: controller.colorText(
                                      status: controller
                                              .listBillOfLading[index].status ??
                                          10),
                                ),
                                ItemDetailListWidget(
                                    head: "Mã PXK",
                                    endText: controller.listBillOfLading[index]
                                            .vnDeliveryBill?.code
                                            .toString() ??
                                        ''),
                                ItemDetailListWidget(
                                    head: "Số lượng",
                                    endText: controller
                                        .listBillOfLading[index].quantity
                                        .toString()),
                                ItemDetailListWidget(
                                    head: "DVVC",
                                    endText: controller.listBillOfLading[index]
                                            .vnDeliveryUnit?.name
                                            .toString() ??
                                        S.current.isNull),
                                controller.listBillOfLading[index].status == 0
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: ButtonWidget(
                                              margin: const EdgeInsets.only(
                                                  left: 16, right: 8),
                                              buttonText: "Xóa",
                                              borderColor: primaryColor,
                                              textColor: primaryColor,
                                              onTap: () {
                                                Get.dialog(
                                                  CustomDialog(
                                                    title:
                                                        "Xác nhận xóa vận đơn?",
                                                    onTapYes: () async {
                                                      controller.deleteBillOfLading(
                                                          id: controller
                                                                  .listBillOfLading[
                                                                      index]
                                                                  .id ??
                                                              0);
                                                      Get.back();
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  1200), () {
                                                        controller
                                                            .onRefreshPage();
                                                      });
                                                    },
                                                    onTapNo: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: ButtonWidget(
                                              margin: const EdgeInsets.only(
                                                  right: 16, left: 8),
                                              buttonText: "Sửa",
                                              bgcolor: primaryColor,
                                              textColor: ColorApp.whiteFA,
                                              onTap: () async {
                                                controller.onClearValue();
                                                final result = await Get.toNamed(
                                                    Routes
                                                        .UPDATE_BILL_0F_LADING,
                                                    arguments: {
                                                      'id': controller
                                                          .listBillOfLading[
                                                              index]
                                                          .id,
                                                    });
                                                if (result == true) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1200),
                                                      () {
                                                    controller.onRefreshPage();
                                                  });
                                                }
                                              },
                                            ),
                                          )
                                        ],
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                        );
                      },
                      count: controller.listBillOfLading.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16.h);
                      });
                }),
              ),
              Gap(8.h),
              ButtonWidget(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                buttonText: "Thêm mã vận đơn",
                bgcolor: primaryColor,
                textColor: ColorApp.whiteFA,
                onTap: () async {
                  controller.onClearValue();
                  final result = await Get.toNamed(Routes.CREATE_BILL_0F_LADING,
                      arguments: {
                        'codeDelivery': null,
                        'idDeliveryBill': null
                      });
                  if (result == true) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      controller.onRefreshPage();
                    });
                  }
                },
              ),
              Gap(8.h),
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
                        const Text(
                          "Nhập thông tin",
                          style: TextStyle(fontSize: 16),
                        ),
                        AppTextInputField(
                          controller: controller.values,
                          hint: "Nhập mã vận đơn",
                        )
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
                                  controller.values.clear();
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
                                onTap: () async {
                                  if (controller.values.text.isEmpty) {
                                    AppSnackBar.showIsEmpty(
                                        message: "Hãy nhập giá trị cần lọc");
                                  } else {
                                    controller.code.value =
                                        controller.values.text;
                                    controller.onSelected();
                                    Get.back();
                                  }
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
