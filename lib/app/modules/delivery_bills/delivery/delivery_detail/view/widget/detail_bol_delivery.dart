import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/values/app_colors.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/bill_of_lading/controller/bill_of_lading_controller.dart';
import 'package:vncss/app/modules/bill_of_lading/controller/bill_of_lading_detail_controller.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/delivery_detail/controller/detail_delivery_controller.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/modules/delivery_bills/delivery_bills_detail/view/widgets/single_tile_widget.dart';
import 'package:vncss/app/modules/delivery_bills/list_delivery_bills/view/widgets/status_widget.dart';

import '../../../../../../core/base/base_view.dart';
import '../../../../../../core/values/app_text_styles.dart';
import '../../../../../../core/widget/paging_view.dart';
import '../../../../../common_widget/app_bar_widget.dart';
import '../../../../../common_widget/const.dart';

class DetailBolDelivery extends BaseView<BillOfLadingDetailController> {
  final controllerBill = Get.find<DetailDeliveryController>();
  final controllerBol = Get.find<BillOfLadingController>();

  Future<bool> _onWillPop() async {
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Column(
            children: [
              Obx(() {
                return AppBarWidget(
                  title:
                      "Chi tiết ${controller.listBillOfLadingDetail.value.code}",
                  onBack: () => Get.back(result: true),
                );
              }),
              const SizedBox(height: 8,),
              Expanded(child: Obx(() {
                if (controller.isLoading.value == false &&
                    controller.listBillOfLadingDetail.value.id == null) {
                  return SkeletonizerLoading(
                    loading: controller.isLoading.value,
                  );
                }
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PagingView.builderTracking(
                      onLoadNextPage: () {},
                      builder: (context, index) {
                        return Slidable(
                          enabled: controller.listBillOfLadingDetail.value
                                      .vnDeliveryBoxes?[index]?.status ==
                                  2
                              ? false
                              : true,
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio:controller.listBillOfLadingDetail.value
                                .vnDeliveryBoxes?[index]?.status ==
                                0 ? 0.2 : 0.4,
                            children: [
                              controller.listBillOfLadingDetail.value
                                          .vnDeliveryBoxes?[index]?.status ==
                                      0
                                  ? SlidableAction(
                                      onPressed: (context) async {
                                        controller.ids = controller
                                            .listBillOfLadingDetail
                                            .value
                                            .vnDeliveryBoxes?[index]
                                            ?.id;
                                        final result = await Get.dialog(
                                            CustomDialog(
                                                title:
                                                "Xác nhận thay đổi trạng thái vận đơn sang Đang giao hàng?",
                                                onTapYes: () {
                                                  controller
                                                      .changeDelivering();
                                                  Get.back(result: true);
                                                },
                                                onTapNo: () => Get.back()));
                                        if (result == true) {
                                          Future.delayed(
                                              const Duration(milliseconds: 1000),
                                                  () {
                                                  controller.getBillOfLadingDetail();
                                              });
                                        }
                                      },
                                      backgroundColor: ColorApp.blue002,
                                      foregroundColor: Colors.white,
                                      icon: Icons.local_shipping_outlined,
                                    )
                                  : SlidableAction(
                                      onPressed: (context) async {
                                        controller.ids = controller
                                            .listBillOfLadingDetail
                                            .value
                                            .vnDeliveryBoxes?[index]
                                            ?.id;
                                        final result = await Get.dialog(
                                            CustomDialog(
                                                title:
                                                "Xác nhận thay đổi trạng thái vận đơn sang Hoàn thành?",
                                                onTapYes: () {
                                                  controller
                                                      .changeSuccess();
                                                  Get.back(result: true);
                                                },
                                                onTapNo: () => Get.back()));
                                        if (result == true) {
                                          Future.delayed(
                                              const Duration(milliseconds: 1000),
                                              () {
                                                controller.getBillOfLadingDetail();
                                          });
                                        }
                                      },
                                      backgroundColor: ColorApp.green26,
                                      foregroundColor: Colors.white,
                                      icon: Icons.check,
                                    ),

                              controller.listBillOfLadingDetail.value
                                  .vnDeliveryBoxes?[index]?.status ==
                                  0
                                  ? const SizedBox()
                                  : SlidableAction(
                                onPressed: (context) async {
                                  controller.ids = controller
                                      .listBillOfLadingDetail
                                      .value
                                      .vnDeliveryBoxes?[index]
                                      ?.id;
                                  final result = await Get.dialog(
                                      CustomDialog(
                                          title:
                                          "Xác nhận thay đổi trạng thái vận đơn sang Giao thất bại?",
                                          onTapYes: () {
                                            controller
                                                .changeCancel();
                                            Get.back(result: true);
                                          },
                                          onTapNo: () => Get.back()));
                                  if (result == true) {
                                    Future.delayed(
                                        const Duration(milliseconds: 1000),
                                            () {
                                          controller.getBillOfLadingDetail();
                                        });
                                  }
                                },
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                icon: Icons.close,
                              )

                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.neutralDivider),
                                      borderRadius: BorderRadius.circular(4.r)),
                                  padding: EdgeInsets.all(4.w),
                                  width: 100,
                                  height: 90,
                                  child: CachedNetworkImage(
                                    imageUrl: controller
                                            .listBillOfLadingDetail
                                            .value
                                            .vnDeliveryUnit?.logoUrl??
                                        'https://dashboard.dp-cargo.com/themes/dpcargo/logo-dark.png',
                                    fit: BoxFit.contain,
                                  )),
                              Gap(10.w),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ChipStatus(
                                    color: controllerBill
                                        .buildColorBol(
                                            status: controller
                                                    .listBillOfLadingDetail
                                                    .value
                                                    .vnDeliveryBoxes?[index]
                                                    ?.status ??
                                                100)
                                        .withOpacity(0.4),
                                    label: controllerBill.buildTextBol(
                                        status: controller
                                                .listBillOfLadingDetail
                                                .value
                                                .vnDeliveryBoxes?[index]
                                                ?.status ??
                                            100),
                                    width: null,
                                    textColor: controllerBill.buildColorBol(
                                        status: controller
                                                .listBillOfLadingDetail
                                                .value
                                                .vnDeliveryBoxes?[index]
                                                ?.status ??
                                            100),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    "${controller.listBillOfLadingDetail.value.vnDeliveryBoxes?[index]?.code}",
                                    style: Theme.of(context).BodyText2Bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    controller
                                            .listBillOfLadingDetail
                                            .value
                                            .vnDeliveryBoxes?[index]
                                            ?.deliveredBy
                                            ?.fullname ??
                                        "Đang cập nhật",
                                    style: Theme.of(context)
                                        .BodyText1
                                        .copyWith(color: AppColors.neutral06),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 16,
                          child: Divider(
                            thickness: 1,
                          ),
                        );
                      },
                      count: controller.listBillOfLadingDetail.value
                              .vnDeliveryBoxes?.length ??
                          0),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
