import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/configuration_model.dart';
import 'package:vncss/app/modules/common_widget/app_bar_widget.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_interface_controller.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/routes/app_pages.dart';

import '../../../app/core/widget/textfields/app_text_field.dart';
import '../../core/base/base_view.dart';
import '../../core/widget/paging_view.dart';
import '../common_widget/const.dart';
import '../delivery_bills/delivery/delivery_detail/view/widget/item_detail.dart';
import 'controller/configuration_price_controller.dart';
import 'widget/item_price_config.dart';

class PriceConfigurationScreen extends BaseView<ConfigurationPriceController> {
  final controllerInter = Get.find<ConfigurationInterfaceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Cấu hình bảng giá",
            onBack: () => Get.back(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(child: Obx(() {
            if (controller.isLoading.value == false &&
                controller.listConfigurationPrice.isEmpty) {
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
              onLoadNextPage: () {},
              onRefresh: () async {
                controller.onRefreshPage();
              },
              builder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.showData[index] = !controller.showData[index];
                    },
                    child: Column(
                      children: [
                        Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  Get.dialog(
                                    CustomDialog(
                                      title:
                                          "Bạn có chắc chắn muốn xóa bảng giá '${controller.listConfigurationPrice[index].configValue!.info!.description}' hay không?",
                                      onTapYes: () async {
                                        controller.deleteConfigurationPrice(
                                            controller
                                                    .listConfigurationPrice[
                                                        index]
                                                    .id ??
                                                0);
                                        Get.back();
                                        Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                          controller.onRefreshPage();
                                        });
                                      },
                                      onTapNo: () {
                                        Get.back();
                                      },
                                    ),
                                  );
                                },
                                backgroundColor: ColorApp.redB6,
                                foregroundColor: Colors.white,
                                icon: Icons.close,
                              )
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            color: Colors.white,
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: ItemTracking(
                                    title: "Bảng giá:",
                                    codeTracking: true,
                                    svgPath: 'assets/image/delivery_bill.svg',
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 32),
                                    child: AppTextInputField(
                                      controller:
                                          controller.controllerTitle[index],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        if (controller.showData[index])
                          Column(
                            children: [
                              DataTable(
                                columns: [
                                  DataColumn(
                                      label: Expanded(
                                    child: Text(
                                      controllerInter.title[0],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                                  DataColumn(
                                      label: Expanded(
                                    child: Text(controllerInter.title[1],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  )),
                                  DataColumn(
                                      label: Expanded(
                                    child: Text(controllerInter.title[2],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  )),
                                ],
                                rows: List<DataRow>.generate(
                                  controller.listConfigurationPrice[index]
                                      .configValue!.config!.length,
                                  (rowIndex) {
                                    return DataRow(cells: [
                                      DataCell(Text(controllerInter
                                              .combinedTable[rowIndex]
                                          ["tracking_type_value"])),
                                      DataCell(Text(controllerInter
                                              .combinedTable[rowIndex]
                                          ["warehouse_config_id_value"])),
                                      DataCell(SizedBox(
                                        width: 110,
                                        child: TextField(
                                          controller: controller
                                              .controllers[index][rowIndex],
                                          cursorColor: primaryColor,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: primaryColor)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: ColorApp.greyD7)),
                                              contentPadding:
                                                  const EdgeInsets.all(10)),
                                        ),
                                      )),
                                    ]);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ButtonWidget(
                                buttonText: "Cập nhật",
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                bgcolor: ColorApp.yellowFFC,
                                width: 120,
                                borderColor: ColorApp.yellowFFC,
                                textColor: Colors.white,
                                onTap: () {
                                  controller.printControllersValues(index);
                                  controller.matchList();
                                },
                              ),
                            ],
                          )
                      ],
                    ),
                  );
                });
              },
              count: controller.listConfigurationPrice.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 16,
              ),
            );
          })),
          const SizedBox(
            height: 8,
          ),
          ButtonWidget(
            buttonText: "Thêm cấu hình bảng giá",
            margin: const EdgeInsets.symmetric(horizontal: 16),
            bgcolor: primaryColor,
            borderColor: primaryColor,
            textColor: ColorApp.whiteFA,
            onTap: () async {
              controller.addTitle.clear();
              controller.listConfigAdd.clear();
              final result = await Get.toNamed(Routes.ADD_COEFFICIENT_PRICE);
              if (result == true) {
                Future.delayed(const Duration(milliseconds: 500), () {
                  controller.onRefreshPage();
                });
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
