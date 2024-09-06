import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vncss/app/routes/app_pages.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../core/values/app_colors.dart';
import '../../../common_widget/button_widget.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/item_list_widget.dart';
import '../../../tracking/tracking_detail/controller/tracking_detail_controller.dart';

class TrackingBoxDetail extends BaseView<TrackingDetailController> {
  Widget body(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(children: [
            Container(
                padding: const EdgeInsets.all(16),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back, size: 30),
                  ),
                  const Expanded(child: Center(child: Text("Chi tiết tracking",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),))),
                ])),
            Expanded(
              child: RefreshIndicator(
                onRefresh: ()async{
                  await controller.getDetailTracking();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Column(children: [
                    ItemListWidget(
                        headText: "${controller.trackings.value.orderId ?? "--"}",
                        showChip: true,
                        showIcon: true,
                        svgPath: "assets/image/file_alt.svg",
                        fontWeightHead: true,
                        color: controller.trackings.value.exploitStatus
                            ?.selectedColor ?? Colors.white,
                        colorText: controller.trackings.value.exploitStatus
                            ?.color ?? Colors.white,
                        endText: "${controller.trackings.value.exploitStatus
                            ?.value}"
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Column(
                            children: [
                              Row(children: [
                                Text("Mã tracking:", style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff353535),
                                    fontWeight: FontWeight.w400))
                              ]),
                              Gap(16.h),
                              Row(children: [
                                SvgPicture.asset("assets/image/note_search.svg"),
                                Gap(8.w),
                                Text("${controller.trackings.value.code ?? "--"}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff353535),
                                        fontWeight: FontWeight.w400))
                              ])
                            ])
                    ),
                    ItemListWidget(
                        headText: "Sản phẩm:",
                        endText: "${controller.trackings.value.productName ??
                            "--"}"
                    ),
                    ItemListWidget(
                        headText: "Số lượng:",
                        endText: "${controller.trackings.value.trackingAmount ??
                            "--"}"
                    ),
                    ItemListWidget(
                        headText: "Cân nặng:",
                        endText: "${controller.trackings.value
                            .trackingMiningWeight ?? "--"}"
                    ),
                    ItemListWidget(
                        headText: "Giá cước vận chuyển:",
                        endText: "${formatNumberCommas(
                            "${controller.trackings.value.trackingShippingCost ??
                                0}")} đ"
                    ),
                    ItemListWidget(
                        headText: "Phí vận chuyển:",
                        endText: "${formatNumberCommas(
                            "${controller.trackings.value.trackingShippingFee ??
                                0}")} đ"
                    ),
                    ItemListWidget(
                        headText: "Phí khác:",
                        endText: "${formatNumberCommas(
                            "${controller.trackings.value.trackingOtherFee ??
                                0}")} đ"
                    ),
                    ItemListWidget(
                        headText: "Phụ thu:",
                        endText: "${formatNumberCommas(
                            "${controller.trackings.value.trackingSurcharge ??
                                0}")} đ"
                    ),
                    ItemListWidget(
                        headText: "Thành tiền:",
                        endText: "${formatNumberCommas(
                            "${controller.trackings.value.trackingTotalMoney ??
                                0}")} đ"
                    ),
                    ItemListWidget(
                        headText: "Thời gian đóng hàng:",
                        endText: "${Const.convertDate(
                            controller.trackings.value.packedDate)}"
                    ),
                  ]),
                ),
              ),
            ),
            Obx((){
              return checkButton("${controller.trackings.value.exploitStatus?.value}") ==
                  1
                  ? ButtonWidget(
                onTap: () {
                  Get.toNamed(Routes.EXPLOIT_AWB_TRACKING, arguments: {
                    'id': controller.trackings.value.id,
                  })?.then((_)async{
                    await Future.delayed(Duration(milliseconds: 500),(){
                      controller.getDetailTracking();
                    });
                  });
                },
                buttonText: "Khai thác",
                bgcolor: Color(0xff367a56),
                textColor: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              )
                  : checkButton(
                  "${controller.trackings.value.exploitStatus?.value}") == 2
                  ? ButtonWidget(
                onTap: (){
                  Get.toNamed(Routes.UPDATE_AWB_TRACKING, arguments: {
                    'id': controller.trackings.value.id,
                  })?.then((_)async{
                    await Future.delayed(Duration(milliseconds: 500),(){
                      controller.getDetailTracking();
                    });
                  });
                },
                buttonText: "Chỉnh sửa",
                bgcolor: AppColors.primary,
                textColor: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              )
                  : SizedBox();
            })
          ]);
        }),
      ),
    );
  }

  checkButton(String check) {
    switch (check) {
      case "Đã vận chuyển về vn":
        return 1;
      case "Đã khai thác":
        return 2;
      default:
        return 0;
    }
  }
}