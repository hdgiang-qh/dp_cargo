import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/core/widget/paging_view.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/item_list_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/common_widget/title_detail_list.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';
import 'package:vncss/app/modules/tracking/tracking_detail/controller/tracking_detail_controller.dart';
import 'package:vncss/generated/l10n.dart';

import '../../../../../core/base/base_view.dart';
import '../../../../common_widget/app_bar_widget.dart';
import '../../../../common_widget/item_detail_list_widget.dart';
import '../../../../common_widget/item_edit_field.dart';
import '../../delivery_detail/controller/detail_delivery_controller.dart';

class EditTrackingDeliveryBillScr extends BaseView<TrackingDetailController> {
  final controllerMain = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              AppBarWidget(
                title: "Sửa thông tin tracking",
                onBack: () {
                  Get.back();
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const TitleDetailList(
                        svgPath: "assets/image/bag.svg",
                        headText: "Thông tin tracking",
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            ItemDetailListWidget(
                              head: "Mã tracking:",
                              isCode25: true,
                              endText: controller.trackings.value.code.toString(),
                              fontWeight: true,
                              align: true,
                            ),
                            ItemDetailListWidget(
                              head: "Sản phẩm:",
                              endText: controller.trackings.value.productName
                                  .toString(),
                              align: true,
                              fontWeight: true,
                            ),
                            ItemDetailListWidget(
                              head: "TLTT/TLKT:",
                              endText: controller
                                  .trackings.value.formattedMergeWeight
                                  .toString(),
                              align: true,
                              fontWeight: true,
                            ),
                            ItemEditFieldWidget(
                              head: 'Giá cước VC:',
                              controller: controller.shippingCost,
                            ),
                            ItemEditFieldWidget(
                              head: 'Giảm giá:',
                              controller: controller.discount,
                            ),
                            ItemEditFieldWidget(
                              head: 'Phụ thu:',
                              controller: controller.surcharge,
                            ),
                            ItemEditFieldWidget(
                              head: 'Phí khác:',
                              controller: controller.otherFee,
                            ),
                            ItemDetailListWidget(
                              head: "Tổng tiền:",
                              endText: controller
                                  .trackings.value.formattedTrackingTotalMoney,
                              fontWeight: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              ),
              controllerMain.userLogin.value.role?.id == 7
                  ? const SizedBox()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          controller.indexUpdate == 0
                              ? const SizedBox()
                              : Expanded(
                                  child: ButtonWidget(
                                    buttonText: "Xóa tracking",
                                    bgcolor: ColorApp.whiteFA,
                                    borderColor: primaryColor,
                                    textColor: primaryColor,
                                    onTap: () {
                                      Get.dialog(
                                        CustomDialog(
                                          title:
                                              "Xác nhận xóa tracking '${controller.trackings.value.code}' ra khỏi PXK?",
                                          onTapYes: () async {
                                            controller.deleteTrackingList();
                                            Get.back();
                                            Get.back(result: true);
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 1500), () {
                                              AppSnackBar.showUpdateSuccess(
                                                  message:
                                                      "Xóa tracking thành công");
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
                          SizedBox(
                            width: controller.indexUpdate == 0 ? 0 : 16,
                          ),
                          Expanded(
                            child: ButtonWidget(
                              buttonText: "Lưu thay đổi",
                              bgcolor: primaryColor,
                              textColor: ColorApp.whiteFA,
                              onTap: () {
                                controller.updateTrackingDelivery();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 16,
              ),
            ],
          );
        }),
      ),
    );
  }
}
