import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../routes/app_pages.dart';
import '../../../common_widget/item_detail_list_widget.dart';
import '../../../common_widget/title_detail_list.dart';
import '../../mawb_box_detail/widget/item_list_box.dart';
import '../controller/mawb_detail_controller.dart';

class MawbDetail extends BaseView<AWBDetailController> {
  Future<void> onRefreshPage() async {
    await controller.getMAWBDetail();
  }

  @override
  Widget body(BuildContext context) {
    return const MAWBDetailScreen();
  }
}

class MAWBDetailScreen extends StatefulWidget {
  const MAWBDetailScreen();

  @override
  State<MAWBDetailScreen> createState() => _MAWBDetailScreenState();
}

class _MAWBDetailScreenState extends State<MAWBDetailScreen> {
  final controller = Get.find<AWBDetailController>();
  int? id;
  String? valueChoose;
  bool check = false;
  bool checkEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: ()async{
            await controller.getMAWBDetail();
          },
          child: Column(children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            "Chi tiết AWB",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          )))
                ])),
            Expanded(
              child: Obx(() {
                return CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            height: 50,
                            child: TextField(
                              enabled: controller.awbBox.value.boxInfo?.id == null
                                  ? false
                                  : true,
                              controller: controller.code.value,
                              cursorColor: primaryColor,
                              decoration: InputDecoration(
                                prefixIcon: Transform.scale(
                                  scale: 0.5,
                                  child: Assets.image.searchRed.svg(),
                                ),
                                suffixIcon: IconButton(
                                  enableFeedback:
                                  controller.awbBox.value.boxInfo?.id == null
                                      ? false
                                      : true,
                                  onPressed: () async {
                                    controller.code.value.clear();
                                    final result =
                                    await Get.toNamed(Routes.QR_AWB_TRACKING);
                                    if (result == true) {
                                      Future.delayed(const Duration(seconds: 1), () {
                                        setState(() {
                                          checkEnable = true;
                                        });
                                        for (int i = 0; i < controller.listAwbTracking.length; i++) {
                                          if (controller.listAwbTracking[i].code == controller.code.value.text) {
                                            if (checkStatus(controller
                                                .listAwbTracking[i]
                                                .exploitStatus!
                                                .value) ==
                                                0) {
                                              Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                  arguments: {
                                                    'id': controller
                                                        .listAwbTracking[i].id
                                                  });
                                              AppSnackBar.playSound(
                                                  "assets/sounds/tracking_dang_van_chuyen_ve_vn.mp3");
                                              controller.checkEnable.value = false;
                                            } else if (checkStatus(controller
                                                .listAwbTracking[i]
                                                .exploitStatus!
                                                .value) ==
                                                1) {
                                              Get.toNamed(Routes.EXPLOIT_AWB_TRACKING,
                                                  arguments: {
                                                    'id': controller
                                                        .listAwbTracking[i].id
                                                  });
                                              AppSnackBar.playSound(
                                                  "assets/sounds/tracking_co_the_khai_thac.mp3");
                                            } else if (checkStatus(controller
                                                .listAwbTracking[i]
                                                .exploitStatus!
                                                .value) ==
                                                2) {
                                              Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                  arguments: {
                                                    'id': controller
                                                        .listAwbTracking[i].id
                                                  });
                                              AppSnackBar.playSound(
                                                  "assets/sounds/tracking_co_the_cap_nhat.mp3");
                                              controller.checkEnable.value = true;
                                            } else if (checkStatus(controller
                                                .listAwbTracking[i]
                                                .exploitStatus!
                                                .value) ==
                                                3) {
                                              Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                  arguments: {
                                                    'id': controller
                                                        .listAwbTracking[i].id
                                                  });
                                              AppSnackBar.playSound(
                                                  "assets/sounds/tracking_da_dong_hang.mp3");
                                              controller.checkEnable.value = false;
                                            } else if (checkStatus(controller
                                                .listAwbTracking[i]
                                                .exploitStatus!
                                                .value) ==
                                                4) {
                                              Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                  arguments: {
                                                    'id': controller
                                                        .listAwbTracking[i].id
                                                  });
                                              AppSnackBar.playSound(
                                                  "assets/sounds/tracking_dang_giao_hang.mp3");
                                              controller.checkEnable.value = false;
                                            } else if (checkStatus(controller
                                                .listAwbTracking[i]
                                                .exploitStatus!
                                                .value) ==
                                                5) {
                                              Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                  arguments: {
                                                    'id': controller
                                                        .listAwbTracking[i].id
                                                  });
                                              AppSnackBar.playSound(
                                                  "assets/sounds/tracking_da_hoan_thanh.mp3");
                                              controller.checkEnable.value = false;
                                            }
                                            setState(() {
                                              check = true;
                                            });
                                            break;
                                          }
                                        }
                                        if (check == false) {
                                          AppSnackBar.playSound(
                                              "assets/sounds/notfound_vn.mp3");
                                          AppSnackBar.showWarning(
                                              message: "Không tìm thấy!");
                                        } else {
                                          print(check);
                                        }
                                      });
                                    }
                                  },
                                  icon: Assets.image.barcodeRed.svg(),
                                ),
                                hintText: "Tìm kiếm theo tracking",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                        color: primaryColor, width: 0.2)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide:
                                    const BorderSide(color: primaryColor)),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                              ),
                              onSubmitted: (value) async {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    checkEnable = true;
                                  });
                                  for (int i = 0; i < controller.listAwbTracking.length; i++) {
                                    if (controller.listAwbTracking[i].code == controller.code.value.text) {
                                      if (checkStatus(controller
                                          .listAwbTracking[i]
                                          .exploitStatus!
                                          .value) ==
                                          0) {
                                        Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                            arguments: {
                                              'id': controller
                                                  .listAwbTracking[i].id
                                            });
                                        AppSnackBar.playSound(
                                            "assets/sounds/tracking_dang_van_chuyen_ve_vn.mp3");
                                        controller.checkEnable.value = false;
                                      } else if (checkStatus(controller
                                          .listAwbTracking[i]
                                          .exploitStatus!
                                          .value) ==
                                          1) {
                                        Get.toNamed(Routes.EXPLOIT_AWB_TRACKING,
                                            arguments: {
                                              'id': controller
                                                  .listAwbTracking[i].id
                                            });
                                        AppSnackBar.playSound(
                                            "assets/sounds/tracking_co_the_khai_thac.mp3");
                                      } else if (checkStatus(controller
                                          .listAwbTracking[i]
                                          .exploitStatus!
                                          .value) ==
                                          2) {
                                        Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                            arguments: {
                                              'id': controller
                                                  .listAwbTracking[i].id
                                            });
                                        AppSnackBar.playSound(
                                            "assets/sounds/tracking_co_the_cap_nhat.mp3");
                                        controller.checkEnable.value = true;
                                      } else if (checkStatus(controller
                                          .listAwbTracking[i]
                                          .exploitStatus!
                                          .value) ==
                                          3) {
                                        Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                            arguments: {
                                              'id': controller
                                                  .listAwbTracking[i].id
                                            });
                                        AppSnackBar.playSound(
                                            "assets/sounds/tracking_da_dong_hang.mp3");
                                        controller.checkEnable.value = false;
                                      } else if (checkStatus(controller
                                          .listAwbTracking[i]
                                          .exploitStatus!
                                          .value) ==
                                          4) {
                                        Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                            arguments: {
                                              'id': controller
                                                  .listAwbTracking[i].id
                                            });
                                        AppSnackBar.playSound(
                                            "assets/sounds/tracking_dang_giao_hang.mp3");
                                        controller.checkEnable.value = false;
                                      } else if (checkStatus(controller
                                          .listAwbTracking[i]
                                          .exploitStatus!
                                          .value) ==
                                          5) {
                                        Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                            arguments: {
                                              'id': controller
                                                  .listAwbTracking[i].id
                                            });
                                        AppSnackBar.playSound(
                                            "assets/sounds/tracking_da_hoan_thanh.mp3");
                                        controller.checkEnable.value = false;
                                      }
                                      setState(() {
                                        check = true;
                                      });
                                      break;
                                    }
                                  }
                                  if (check == false) {
                                    AppSnackBar.playSound(
                                        "assets/sounds/notfound_vn.mp3");
                                    AppSnackBar.showWarning(
                                        message: "Không tìm thấy!");
                                  } else {
                                    print(check);
                                  }
                                });
                              },
                            ),
                          ),
                          TitleDetailList(
                            svgPath: "assets/image/bag.svg",
                            headText: "Thông tin chung",
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Column(children: [
                              ItemDetailListWidget(
                                  head: "Mã MAWB:",
                                  endText: "${controller.awb.value.code}",
                                  fontWeight: true),
                              ItemDetailListWidget(
                                  head: "Số đơn:",
                                  endText:
                                  "${controller.awb.value.trackingExploitedQuantity ?? 0}/${controller.awb.value.trackingQuantity ?? 0} (Đã khai thác)",
                                  fontWeight: true),
                              ItemDetailListWidget(
                                  head: "Số thùng:",
                                  endText: "${controller.awb.value.box?.length}",
                                  fontWeight: true),
                            ]),
                          ),
                        ]),
                      )),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Column(children: [
                          Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    SvgPicture.asset("assets/image/bag.svg"),
                                    Gap(8.w),
                                    Text(
                                      "${controller.awb.value.box?[index].code}",
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w700),
                                    )
                                  ]),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.AWB_BOXES_TRACKING,
                                          arguments: {
                                            'id': controller.awb.value.box?[index].id
                                          });
                                    },
                                    child: Container(
                                      height: 44,
                                      width: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border:
                                          Border.all(color: AppColors.primary)),
                                      child: Text(
                                        "Xem chi tiết",
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                          Obx(() {
                            return ItemListBox(boxAwb: controller.awb.value.box![index]);
                          })
                        ]);
                      }, childCount: controller.awb.value.box?.length ?? 0))
                ]);
              }),
            ),
          ]),
        ),
      ),
    );
  }

  checkStatus(String status) {
    switch (status) {
      case "Đang vận chuyển về vn":
        return 0;
      case "Đã vận chuyển về vn":
        return 1;
      case "Đã khai thác":
        return 2;
      case "Đã đóng hàng":
        return 3;
      case "Đang giao hàng":
        return 4;
      case "Hoàn thành":
        return 5;
    }
  }
}
