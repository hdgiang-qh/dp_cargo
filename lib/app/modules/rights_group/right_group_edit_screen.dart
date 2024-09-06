import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/app_bar_widget.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';
import 'package:vncss/app/modules/rights_group/controller/rights_controller.dart';

import '../../core/base/base_view.dart';
import '../../core/widget/paging_view.dart';
import '../common_widget/const.dart';
import '../common_widget/textfield_widget.dart';
import 'controller/rights_detail_controller.dart';

class RightsGroupEditScreen extends BaseView<RightsDetailController> {
  final controllerRole = Get.find<RightsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Sửa quyền",
            onBack: () {
              Get.back();
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                AppTextInputField(
                  controller: controller.permission,
                  showLabel: true,
                  label: "Quyền",
                  hint: "Quyền",
                ),
                AppTextInputField(
                  controller: controller.description,
                  showLabel: true,
                  label: "Mô tả",
                  hint: "Mô tả",
                ),
                TypeAheadField<String>(
                  controller: controller.group,
                  suggestionsCallback: (pattern) {
                    controllerRole.listConfigurationGroup
                        .removeWhere((item) => item.id == 3);
                    return controller.listRole;
                  },
                  builder: (context, controller, focusNode) {
                    return AppTextInputField(
                      controller: controller,
                      focusNode: focusNode,
                      showLabel: true,
                      label: "Nhóm quyền",
                      hint: "Nhóm quyền",
                      readOnly: true,
                    );
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(
                        suggestion,
                        style: const TextStyle(fontSize: 13),
                      ),
                    );
                  },
                  onSelected: (suggestion) {
                    controller.group.text = suggestion;
                    controller.type = controller.roleType(suggestion);
                  },
                  loadingBuilder: (context) => const Text('Loading...'),
                  errorBuilder: (context, error) => const Text('Error!'),
                  emptyBuilder: (context) =>
                      const Text('Không có dữ liệu phù hợp'),
                ),
              ],
            ),
          ),
          Expanded(child: Obx(() {
            if (controller.isLoading.value == false ||
                controller.listAction.isEmpty) {
              return SkeletonizerLoading(
                loading: controller.isLoading.value,
              );
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PagingView.separated(
                onLoadNextPage: () {},
                onRefresh: () async {
                  controller.onRefreshPage();
                },
                builder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Obx(() {
                            return SizedBox(
                              height: 40,
                              width: 24,
                              child: Checkbox(
                                value: controller.listPermissionFinal[index]
                                    .items.isSelected,
                                activeColor: ColorApp.green08,
                                onChanged: (bool? value) async {
                                  controller.listPermissionFinal[index].items
                                      .isSelected = value!;
                                  if (value == false) {
                                    controller.listPermissionFinal[index]
                                            .listIsSelected =
                                        List.filled(
                                            controller
                                                .listPermissionFinal[index]
                                                .listIsSelected
                                                .length,
                                            false);
                                    controller.listPermissionFinal.refresh();
                                  } else {
                                    var business = controller
                                        .listPermissionFinal[index]
                                        .items
                                        .items
                                        .businessLogic;
                                    controller.listPermissionFinal[index].per =
                                        1;
                                    if (business == null || business.isEmpty) {
                                      controller.listPermissionFinal[index]
                                          .items.isSelected = true;
                                      controller.listPermissionFinal.refresh();
                                    } else {
                                      controller.listPermissionFinal[index]
                                          .listIsSelected[0] = true;
                                      controller.listPermissionFinal.refresh();
                                    }
                                  }
                                },
                              ),
                            );
                          }),
                          const SizedBox(width: 5,),
                          Expanded(
                            child: Text(
                              controller
                                  .listPermissionNew[index].items.description
                                  .toString(),
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      if (controller.listPermissionFinal[index].items.items
                              .businessLogic !=
                          null)
                        ...List.generate(
                          controller.listPermissionFinal[index].items.items
                                  .businessLogic?.length ??
                              0,
                          (indexes) {
                            return Container(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  Obx(() {
                                    return SizedBox(
                                      height: 40,
                                      width: 24,
                                      child: Radio<bool>(
                                        groupValue: controller
                                            .listPermissionFinal[index]
                                            .listIsSelected[indexes],
                                        value: true,
                                        activeColor: ColorApp.redB6,
                                        onChanged: (bool? value) {
                                          if (value == true) {
                                            controller.updateRadioSelection(
                                                index, indexes);
                                            controller
                                                .listPermissionFinal[index]
                                                .per = indexes + 1;
                                            controller
                                                    .listPermissionFinal[index]
                                                    .listIsSelected[indexes] =
                                                value ?? false;
                                            controller.listPermissionFinal
                                                .refresh();
                                          }
                                        },
                                      ),
                                    );
                                  }),
                                  const SizedBox(width: 5,),
                                  Expanded(
                                    child: Text(
                                      controller
                                              .listPermissionFinal[index]
                                              .items
                                              .items
                                              .businessLogic?[indexes]
                                              ?.label
                                              .toString() ??
                                          "",
                                      style:
                                          const TextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                    ],
                  );
                },
                count: controller.listPermissionFinal.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 0,
                ),
              ),
            );
          })),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    buttonText: "Hủy",
                    borderColor: primaryColor,
                    textColor: primaryColor,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ButtonWidget(
                    buttonText: "Xác nhận",
                    bgcolor: primaryColor,
                    borderColor: primaryColor,
                    textColor: ColorApp.whiteFA,
                    onTap: () async {
                      controller.addValue();
                      await controller.updateConfigGroup();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ]),
      ),
    );
  }
}
