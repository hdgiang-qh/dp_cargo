import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/utils/color_app.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../routes/app_pages.dart';
import '../../../common_widget/title_detail_list.dart';
import '../../../tracking/tracking_screen/controller/tracking_status_controller.dart';
import '../controller/mawb_box_detail_controller.dart';
import '../widget/item_list_tracking_box.dart';

class MawbBoxDetail extends BaseView<MawbBoxDetailController> {

  @override
  Widget body(BuildContext context) {
    return const MawbBoxDetailScreen();
  }
}

class MawbBoxDetailScreen extends StatefulWidget {
  const MawbBoxDetailScreen();

  @override
  State<MawbBoxDetailScreen> createState() => _MawbBoxDetailScreenState();
}

class _MawbBoxDetailScreenState extends State<MawbBoxDetailScreen> {
  final controller = Get.find<MawbBoxDetailController>();
  final statusController = Get.find<TrackingStatusController>();
  TextEditingController trackingCode = TextEditingController();
  var valueChoose;
  bool check = false;
  bool checkEnable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: ()async{
          await  controller.getAwbBoxTrackingDetail();
          },
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
                  const Expanded(child: Center(child: Text("Chi tiết thùng hàng",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),))),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ADD_BOX_TRACKING,
                          arguments: {
                            'id': controller
                                .awbBox.value.boxInfo?.id
                          })?.then((_){
                            controller.getAwbBoxTrackingDetail();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Icon(Icons.add, color: Colors.white,),
                    ),
                  ),

                ])),
            Expanded(
                child: Obx(() {
                  return CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          color: Colors.white,
                          child: Column(children: [
                            Row(children: [
                              Text("Trạng thái:", style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500))
                            ]),
                            Gap(8.h),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.black12)
                              ),
                              child: DropdownButton(
                                  hint: const Text("Tất cả"),
                                  value: valueChoose,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black
                                  ),
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  items: statusController.listStatus.map((
                                      valueItem) {
                                    return DropdownMenuItem(
                                        value: valueItem.name,
                                        child: Text("${valueItem.name}"));
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueChoose = newValue;
                                      controller.exploitStatus.value =
                                          controller.idStatus(
                                              newValue.toString());
                                      controller.onSelected();
                                    });
                                  }
                              ),
                            ),
                            Gap(16.h),
                            Container(
                              height: 50,
                              child: TextField(
                                enabled: controller.awbBox.value.boxInfo?.id == null
                                    ? false
                                    : true,
                                controller: controller.searchCode,
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
                                      controller.searchCode.clear();
                                      final result =
                                      await Get.toNamed(Routes.QR_BOX_TRACKING);
                                      if (result == true) {
                                        await Future.delayed(const Duration(seconds: 1), () {
                                          setState(() {
                                            checkEnable = true;
                                          });
                                          for (int i = 0;
                                          i < controller.awbBox.value.trackings!.length;
                                          i++) {
                                            if (controller.awbBox.value.trackings![i].code ==
                                                controller.searchCode.text) {
                                              if (checkStatus(controller
                                                  .awbBox.value.trackings![i]
                                                  .exploitStatus!
                                                  .value) ==
                                                  0) {

                                                Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                    arguments: {
                                                      'id': controller
                                                          .awbBox.value.trackings![i].id
                                                    });
                                                AppSnackBar.playSound(
                                                    "assets/sounds/tracking_dang_van_chuyen_ve_vn.mp3");
                                                controller.checkEnable.value = false;
                                              } else if (checkStatus(controller
                                                  .awbBox.value.trackings![i]
                                                  .exploitStatus!
                                                  .value) ==
                                                  1) {
                                                Get.toNamed(Routes.EXPLOIT_AWB_TRACKING,
                                                    arguments: {
                                                      'id': controller
                                                          .awbBox.value.trackings![i].id
                                                    });
                                                AppSnackBar.playSound(
                                                    "assets/sounds/tracking_co_the_khai_thac.mp3");
                                              } else if (checkStatus(controller
                                                  .awbBox.value.trackings![i]
                                                  .exploitStatus!
                                                  .value) ==
                                                  2) {
                                                Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                    arguments: {
                                                      'id': controller
                                                          .awbBox.value.trackings![i].id
                                                    });
                                                AppSnackBar.playSound(
                                                    "assets/sounds/tracking_co_the_cap_nhat.mp3");
                                                controller.checkEnable.value = true;
                                              } else if (checkStatus(controller
                                                  .awbBox.value.trackings![i]
                                                  .exploitStatus!
                                                  .value) ==
                                                  3) {
                                                Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                    arguments: {
                                                      'id': controller
                                                          .awbBox.value.trackings![i].id
                                                    });
                                                AppSnackBar.playSound(
                                                    "assets/sounds/tracking_da_dong_hang.mp3");
                                                controller.checkEnable.value = false;
                                              } else if (checkStatus(controller
                                                  .awbBox.value.trackings![i]
                                                  .exploitStatus!
                                                  .value) ==
                                                  4) {
                                                Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                    arguments: {
                                                      'id': controller
                                                          .awbBox.value.trackings![i].id
                                                    });
                                                AppSnackBar.playSound(
                                                    "assets/sounds/tracking_dang_giao_hang.mp3");
                                                controller.checkEnable.value = false;
                                              } else if (checkStatus(controller
                                                  .awbBox.value.trackings![i]
                                                  .exploitStatus!
                                                  .value) ==
                                                  5) {
                                                Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                                    arguments: {
                                                      'id': controller
                                                          .awbBox.value.trackings![i].id
                                                    });
                                                AppSnackBar.playSound(
                                                    "assets/sounds/tracking_da_hoan_thanh.mp3");
                                                controller.checkEnable.value = false;
                                              }
                                              setState(() {
                                                check = true;
                                              });
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
                                  await Future.delayed(const Duration(seconds: 1), () {
                                    setState(() {
                                      checkEnable = true;
                                    });
                                    for (int i = 0;
                                    i < controller.awbBox.value.trackings!.length;
                                    i++) {
                                      if (controller.awbBox.value.trackings![i].code ==
                                          controller.searchCode.text) {
                                        if (checkStatus(controller
                                            .awbBox.value.trackings![i]
                                            .exploitStatus!
                                            .value) ==
                                            0) {

                                          Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                              arguments: {
                                                'id': controller
                                                    .awbBox.value.trackings![i].id
                                              });
                                          AppSnackBar.playSound(
                                              "assets/sounds/tracking_dang_van_chuyen_ve_vn.mp3");
                                          controller.checkEnable.value = false;
                                        } else if (checkStatus(controller
                                            .awbBox.value.trackings![i]
                                            .exploitStatus!
                                            .value) ==
                                            1) {
                                          Get.toNamed(Routes.EXPLOIT_AWB_TRACKING,
                                              arguments: {
                                                'id': controller
                                                    .awbBox.value.trackings![i].id
                                              });
                                          AppSnackBar.playSound(
                                              "assets/sounds/tracking_co_the_khai_thac.mp3");
                                        } else if (checkStatus(controller
                                            .awbBox.value.trackings![i]
                                            .exploitStatus!
                                            .value) ==
                                            2) {
                                          Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                              arguments: {
                                                'id': controller
                                                    .awbBox.value.trackings![i].id
                                              });
                                          AppSnackBar.playSound(
                                              "assets/sounds/tracking_co_the_cap_nhat.mp3");
                                          controller.checkEnable.value = true;
                                        } else if (checkStatus(controller
                                            .awbBox.value.trackings![i]
                                            .exploitStatus!
                                            .value) ==
                                            3) {
                                          Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                              arguments: {
                                                'id': controller
                                                    .awbBox.value.trackings![i].id
                                              });
                                          AppSnackBar.playSound(
                                              "assets/sounds/tracking_da_dong_hang.mp3");
                                          controller.checkEnable.value = false;
                                        } else if (checkStatus(controller
                                            .awbBox.value.trackings![i]
                                            .exploitStatus!
                                            .value) ==
                                            4) {
                                          Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                              arguments: {
                                                'id': controller
                                                    .awbBox.value.trackings![i].id
                                              });
                                          AppSnackBar.playSound(
                                              "assets/sounds/tracking_dang_giao_hang.mp3");
                                          controller.checkEnable.value = false;
                                        } else if (checkStatus(controller
                                            .awbBox.value.trackings![i]
                                            .exploitStatus!
                                            .value) ==
                                            5) {
                                          Get.toNamed(Routes.UPDATE_AWB_TRACKING,
                                              arguments: {
                                                'id': controller
                                                    .awbBox.value.trackings![i].id
                                              });
                                          AppSnackBar.playSound(
                                              "assets/sounds/tracking_da_hoan_thanh.mp3");
                                          controller.checkEnable.value = false;
                                        }
                                        setState(() {
                                          check = true;
                                        });
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
                          ]),
                        ),
                        TitleDetailList(
                          svgPath: "assets/image/bag.svg",
                          headText: "Danh sách tracking",
                        ),
                      ]),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Obx(() {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.TRACKING_BOX_DETAIL, arguments: {
                                  'id': controller.awbBox.value.trackings![index].id
                                })?.then((_){
                                  controller.getAwbBoxTrackingDetail();
                                });
                              },
                              // child: ItemListTrackingBox(
                              //     awbBox: controller.awbBox.value.trackings![index]),
                                child: Slidable(
                                  endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        _SlidableAction(
                                            color: AppColors.primary,
                                            nameAction: "Xóa",
                                            icon: SvgGenImage('assets/image/trash.svg').svg(color: Colors.white),
                                            onTap: (context){
                                              Slidable.of(context)!.close();
                                              showDialog(
                                                context: Get.context!,
                                                builder: (BuildContext context) => CupertinoAlertDialog(
                                                  content: Text("Xóa mã tracking: ${controller.awbBox.value.trackings![index].code}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      isDefaultAction: true,
                                                      child: const Text('Đóng'),
                                                      onPressed: () async {
                                                        Navigator.of(context, rootNavigator: true).pop();
                                                      },
                                                    ),
                                                    CupertinoDialogAction(
                                                      isDefaultAction: true,
                                                      child: const Text('Xác nhận'),
                                                      onPressed: () async {
                                                        Navigator.of(context, rootNavigator: true).pop();
                                                        controller.deleteBoxTracking(controller.awbBox.value.trackings![index].id);
                                                        await Future.delayed(Duration(milliseconds: 500),(){
                                                          controller.getAwbBoxTrackingDetail();
                                                        });
                                                      },
                                                    )
                                                  ],
                                                ),
                                              );
                                            }
                                        ),
                                      ]
                                  ),
                                  child:   ItemListTrackingBox(
                                          awbBox: controller.awbBox.value.trackings![index])
                                ));
                          });
                        }, childCount: controller.awbBox.value.trackings
                            ?.length ?? 0))
                  ]);
                })
            )
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
class _SlidableAction extends StatelessWidget {
  final Color color;
  final String nameAction;
  final SvgPicture icon;
  final SlidableActionCallback onTap;
  const _SlidableAction({required this.color, required this.nameAction, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          onTap(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const Gap(8),
              Text(
                nameAction,
                style: Theme.of(context).BodyText2Bold.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

