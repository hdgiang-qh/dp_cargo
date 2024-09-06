import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_view.dart';
import 'package:vncss/app/data/model/model/staff_detail.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/routes/app_pages.dart';
import 'package:vncss/generated/l10n.dart';

import '../../../common_widget/app_bar_widget.dart';
import '../../../common_widget/item_detail_list_widget.dart';
import '../../../common_widget/title_detail_list.dart';
import '../controller/detail_staff_controller.dart';


class DetailStaff extends BaseView<DetailStaffController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Xem nhân viên",
              onBack: () => Get.back(result: true),
            ),
            Gap(8.h),
            Expanded(
                child: Obx(() {
                  if (controller.isLoading.value == false &&
                      controller.staffDetail.value.id == null) {
                    return SkeletonizerLoading(
                      loading: controller.isLoading.value,
                    );
                  }
                  return Column(
                    children: [
                      const TitleDetailList(
                        headText: "Thông tin nhân viên",
                        svgPath: "assets/image/person.svg",
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10),
                        decoration: const BoxDecoration(
                            color: Colors.white),
                        child: Column(
                          children: [
                            ItemDetailListWidget(
                              head: "Mã nhân viên:",
                              fontWeight: true,
                              endText: controller.staffDetail.value.id
                                  .toString(),
                            ),
                            ItemDetailListWidget(
                              head: "Họ và tên:",
                              fontWeight: true,
                              endText: controller.staffDetail.value
                                  .fullname
                                  .toString(),
                            ),
                            ItemDetailListWidget(
                              head: "Số điện thoại:",
                              fontWeight: true,
                              endText:
                              controller.staffDetail.value.phone
                                  .toString(),
                            ),
                            ItemDetailListWidget(
                              head: "Email:",
                              fontWeight: true,
                              endText:
                              controller.staffDetail.value.email
                                  .toString(),
                            ),
                            ItemDetailListWidget(
                              head: "Vai trò:",
                              fontWeight: true,
                              endText: controller.staffDetail.value.role
                                  ?.name
                                  .toString() ??
                                  S.current.isNull,
                            ),
                            ItemDetailListWidget(
                              head: "Đối tác:",
                              fontWeight: true,
                              endText: controller
                                  .staffDetail.value.businessPartner
                                  ?.name
                                  .toString() ??
                                  S.current.isNull,
                            ),
                            ItemDetailListWidget(
                              head: "Kho VN:",
                              fontWeight: true,
                              endText: controller
                                  .staffDetail.value.warehouseVN?.name
                                  .toString() ??
                                  "Tất cả",
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                      buttonText: "Xóa",
                      borderColor: primaryColor,
                      textColor: primaryColor,
                      onTap: () {
                        Get.dialog(
                          CustomDialog(
                            title: "Xóa nhân viên: ${controller.staffDetail
                                .value.fullname}",
                            onTapYes: () {
                              controller.deleteStaff();
                              Get.back();
                              Get.back(result: true);
                            },
                            onTapNo: () {
                              Get.back();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(8.w),
                  Expanded(
                    child: ButtonWidget(
                      buttonText: "Sửa",
                      bgcolor: primaryColor,
                      textColor: ColorApp.whiteFA,
                      onTap: () async {
                        controller.pass.clear();
                        controller.confirmPass.clear();
                        controller.error.value = null;
                        final result = await Get.toNamed(Routes.UPDATE_STAFF);
                        if (result == true) {
                          Future.delayed(const Duration(
                              milliseconds: 500), () {
                            controller.getDetail();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Gap(8.h),
          ],
        ),
      ),
    );
  }
}
