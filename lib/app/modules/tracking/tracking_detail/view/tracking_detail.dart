import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/search/controller/search_tracking_controller.dart';
import 'package:vncss/app/modules/tracking/tracking_screen/controller/tracking_controller.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/enum/orders_status.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../routes/app_pages.dart';
import '../../../common_widget/app_bar_widget.dart';
import '../../../common_widget/bottom_sheet_check_goods.dart';
import '../../../common_widget/button_widget.dart';
import '../../../common_widget/item_detail_list_widget.dart';
import '../../../common_widget/item_list_widget.dart';
import '../../../common_widget/title_detail_list.dart';
import '../../../delivery_bills/delivery/widget/skeletonizer_loading.dart';
import '../../../util/images.dart';
import '../controller/tracking_detail_controller.dart';

class TrackingDetailScreen extends BaseView<TrackingDetailController> {
  final controllerTracking = Get.find<TrackingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Chi tiết Tracking",
            onBack: () => Get.back(),
          ),
          Expanded(
              child: RefreshIndicator(
            onRefresh: () async {
              await controller.getDetailTracking();
            },
            child: SingleChildScrollView(
              child: Column(children: [
                Obx(() {
                  if (controller.isLoading.value == false &&
                      controller.trackings.value.id == null) {
                    return SkeletonizerLoading(
                      loading: controller.isLoading.value,
                    );
                  }
                  return Column(children: [
                    const TitleDetailList(
                      svgPath: Images.file2,
                      headText: "Thông tin tracking",
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(children: [
                        ItemListWidget(
                          showChip: true,
                          headText: "Trạng thái:",
                          color: controller.trackings.value.status?.selectedColor !=
                                  null
                              ? controller.trackings.value.status?.selectedColor
                              : Colors.grey,
                          endText: controller.trackings.value.status?.value ??
                              S.current.isNull,
                          colorText:
                              controller.trackings.value.status?.color != null
                                  ? controller.trackings.value.status?.color
                                  : Colors.white,
                        ),
                        ItemDetailListWidget(
                            head: "Mã tracking:",
                            fontWeight: true,
                            endText: controller.trackings.value.code ??
                                S.current.isNull),
                        ItemDetailListWidget(
                            head: "Số lượng hàng hoá:",
                            fontWeight: true,
                            endText:
                                "${controller.trackings.value.trackingAmount ?? S.current.isNull}"),
                        ItemDetailListWidget(
                            head: "Loại hàng hoá:",
                            fontWeight: true,
                            endText:
                                controller.trackings.value.trackingType?.name ??
                                    "--"),
                        ItemDetailListWidget(
                            head: "Giá trị hàng hoá:",
                            fontWeight: true,
                            endText:
                                "${formatNumberCommas(controller.trackings.value.price ?? S.current.isNull)} đ"),
                        ItemDetailListWidget(
                            head: "Ghi chú:",
                            fontWeight: true,
                            endText: controller.trackings.value.note ?? "")
                      ]),
                    )
                  ]);
                }),
                Obx(() {
                  return Container(
                    child: Column(children: [
                      const TitleDetailList(
                        svgPath: Images.file2,
                        headText: "Thông tin đơn hàng",
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(children: [
                          ItemDetailListWidget(
                              head: "Mã đơn hàng:",
                              fontWeight: true,
                              endText: controller.trackings.value.orderId ??
                                  S.current.isNull),
                          ItemDetailListWidget(
                              head: "Giá cước:",
                              fontWeight: true,
                              endText:
                                  "${formatNumberCommas(controller.trackings.value.trackingShippingCost ?? S.current.isNull)} đ"),
                          ItemDetailListWidget(
                              head: "Phí vận chuyển:",
                              fontWeight: true,
                              endText:
                                  "${formatNumberCommas(controller.trackings.value.trackingShippingFee ?? S.current.isNull)} đ"),
                          ItemDetailListWidget(
                              head: "Phụ thu:",
                              fontWeight: true,
                              endText:
                                  "${formatNumberCommas(controller.trackings.value.trackingSurcharge ?? S.current.isNull)} đ"),
                          ItemDetailListWidget(
                              head: "Phí khác:",
                              fontWeight: true,
                              endText:
                                  "${formatNumberCommas(controller.trackings.value.trackingOtherFee ?? S.current.isNull)} đ"),
                          ItemDetailListWidget(
                              head: "Tổng tiền:",
                              fontWeight: true,
                              endText:
                                  "${formatNumberCommas(controller.trackings.value.trackingTotalMoney ?? S.current.isNull)} đ")
                        ]),
                      )
                    ]),
                  );
                }),
                Obx(() {
                  return Container(
                    child: Column(children: [
                      const TitleDetailList(
                        svgPath: Images.file2,
                        headText: "Thông tin khách hàng",
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(children: [
                          ItemDetailListWidget(
                              head: "Tên khách:",
                              fontWeight: true,
                              endText:
                                  controller.trackings.value.customer?.name ??
                                      S.current.isNull),
                          ItemDetailListWidget(
                              head: "Số điện thoại:",
                              fontWeight: true,
                              endText:
                                  "${controller.trackings.value.customer?.phone ?? S.current.isNull}"),
                          ItemDetailListWidget(
                              head: "Địa chỉ:",
                              fontWeight: true,
                              endText: controller
                                      .trackings.value.customer?.address ??
                                  S.current.isNull),
                        ]),
                      )
                    ]),
                  );
                }),
                Obx(() {
                  return Container(
                    child: Column(children: [
                      const TitleDetailList(
                        svgPath: "assets/image/list.svg",
                        headText: "Khai thác",
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16),
                        child: Column(children: [
                          Row(children: [
                            SvgPicture.asset("assets/image/note_search.svg"),
                            Gap(8.w),
                            Text(
                              " ${controller.trackings.value.warehouse?.name ?? "--"}  ->  ${controller.trackings.value.warehouseVn?.name ?? "--"}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ]),
                          Gap(10.h),
                          Row(children: [
                            SvgPicture.asset("assets/image/scale.svg"),
                            Gap(8.w),
                            Text(
                              "${controller.trackings.value.trackingCalculationWeight ?? S.current.isNull} kg",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ])
                        ]),
                      )
                    ]),
                  );
                }),
                Obx(() {
                  return SizedBox(
                    height: 152.toDouble() * controller.listStatusLog.length,
                    child: Column(
                      children: [
                        const TitleDetailList(
                          svgPath: 'assets/image/history.svg',
                          headText: "Lịch sử đơn hàng",
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          color: Colors.white,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.listStatusLog.length,
                              itemBuilder: (context, index) {
                                if (controller.listStatusLog.isEmpty) {
                                  return const Center(
                                    child: Text("Không có lịch sử tracking"),
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      ItemListWidget(
                                          headText: "Hành động:",
                                          fontWeightHead: true,
                                          isAddress: true,
                                          endText: controller
                                              .listStatusLog[index].name
                                              .toString()),
                                      ItemListWidget(
                                          headText: "Thời gian:",
                                          fontWeightHead: true,
                                          endText: controller
                                              .listStatusLog[index]
                                              .formattedCustomerTransactionDate),
                                    ],
                                  );
                                }
                              }),
                        )
                      ],
                    ),
                  );
                }),
              ]),
            ),
          )),
          Obx(() {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.trackings.value.ticketResponse == null
                      ? Expanded(
                    child: ButtonWidget(
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16))),
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return BottomSheetCheckGoods(
                                  trackingCode:
                                  "${controller.trackings.value.code}");
                            });
                      },
                      buttonText: "Kiểm hàng",
                      fontSize: 13,
                      textColor: AppColors.primary,
                      borderColor: primaryColor,
                      bgcolor: Colors.white,
                    ),
                  )
                      : const SizedBox(),
                  controller.trackings.value.ticketResponse == null
                      ? Gap(16.w)
                      : const SizedBox(),
                  controller.indexTap == 0
                      ? Expanded(
                          child: ButtonWidget(
                            onTap: () {
                              Get.dialog(
                                CustomDialog(
                                  title: "Xác nhận xóa tracking?",
                                  onTapYes: () async {
                                    controllerTracking
                                        .deleteTracking(controller.id);
                                    Get.back();
                                    Get.back(result: true);
                                    Get.find<SearchTrackingController>()
                                        .onClear();
                                  },
                                  onTapNo: () {
                                    Get.back();
                                  },
                                ),
                              );
                            },
                            buttonText: "Xoá",
                            fontSize: 13,
                            textColor: AppColors.primary,
                            borderColor: primaryColor,
                            bgcolor: Colors.white,
                          ),
                        )
                      : const SizedBox(),
                  controller.indexTap == 0 ? Gap(16.w) : const SizedBox(),
                  controller
                          .checkStatus(controller.trackings.value.status?.value)
                      ? Expanded(
                          child: ButtonWidget(
                            onTap: () {
                              Get.toNamed(Routes.UPDATE_TRACKING)
                                  ?.then((_) async {
                                await Future.delayed(const Duration(seconds: 1),
                                    () {
                                  controller.getDetailTracking();
                                });
                              });
                            },
                            buttonText: "Cập nhật",
                            fontSize: 13,
                            borderColor: AppColors.primary,
                            textColor: Colors.white,
                            bgcolor: AppColors.primary,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            );
          })
        ]),
      ),
    );
  }
}
