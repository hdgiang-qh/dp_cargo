import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/staff.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/modules/util/images.dart';
import 'package:vncss/app/routes/app_pages.dart';

import '../../core/base/base_view.dart';
import '../../core/widget/paging_view.dart';
import '../common_widget/app_bar_widget.dart';
import '../common_widget/const.dart';
import '../delivery_bills/delivery/delivery_detail/view/widget/item_detail.dart';
import 'controller/rights_controller.dart';

class RightsGroupScreen extends BaseView<RightsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Nhóm quyền",
            onBack: () => Get.back(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: FutureBuilder<List<StaffRoleName>>(
                  future: controller.getConfigurationGroup(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SkeletonizerLoading(
                        loading: controller.isLoading.value,
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No found'));
                    } else {
                      return Obx(() {
                        return PagingView.separated(
                            onLoadNextPage: () {},
                            onRefresh: () async {
                              controller.onRefreshPage();
                            },
                            builder: (context, index) {
                              return Slidable(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 24),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ItemTracking(
                                              title: controller
                                                  .listConfigurationGroup[index]
                                                  .name
                                                  .toString(),
                                              codeTracking: true,
                                              svgPath: controller.rolePath(
                                                  controller
                                                      .listConfigurationGroup[
                                                          index]
                                                      .type
                                                      .toString()),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              controller
                                                  .listConfigurationGroup[index]
                                                  .description
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(children: [
                                        GestureDetector(
                                          onTap: () async {
                                            final result = await Get.toNamed(
                                                Routes.COEFFICIENT_GROUP_DETAIL,
                                                arguments: {
                                                  'id': controller
                                                      .listConfigurationGroup[
                                                          index]
                                                      .id
                                                });
                                            if (result == true) {
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500), () {
                                                controller.onRefreshPage();
                                              });
                                            }
                                          },
                                          child: Column(children: [
                                            SvgPicture.asset(
                                              Images.edit2,
                                            ),
                                            const Text(
                                              "Sửa",
                                              style: TextStyle(fontSize: 13),
                                            )
                                          ]),
                                        ),
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.dialog(
                                              CustomDialog(
                                                title:
                                                    "Bạn muốn xóa quyền này?",
                                                onTapYes: () async {
                                                  controller
                                                      .deleteConfigurationGroup(
                                                          controller
                                                                  .listConfigurationGroup[
                                                                      index]
                                                                  .id ??
                                                              0);
                                                  Get.back();
                                                 await controller.onRefreshPage();
                                                },
                                                onTapNo: () {
                                                  Get.back();
                                                },
                                              ),
                                            );
                                          },
                                          child: Column(children: [
                                            SvgPicture.asset(Images.trash),
                                            const Text("Xóa",
                                                style: TextStyle(fontSize: 13))
                                          ]),
                                        )
                                      ])
                                    ],
                                  ),
                                ),
                              );
                            },
                            count: controller.listConfigurationGroup.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 16,
                                ));
                      });
                    }
                  })),
          const SizedBox(
            height: 8,
          ),
          ButtonWidget(
            buttonText: "Thêm mới quyền",
            margin: const EdgeInsets.symmetric(horizontal: 16),
            bgcolor: primaryColor,
            borderColor: primaryColor,
            textColor: ColorApp.whiteFA,
            onTap: ()async{
              final result = await Get.toNamed(
                  Routes.COEFFICIENT_GROUP_CREATE);
              if(result == true){
                controller.onRefreshPage();
              }
            },
          ),
          const SizedBox(
            height: 8,
          ),
        ]),
      ),
    );
  }
}
