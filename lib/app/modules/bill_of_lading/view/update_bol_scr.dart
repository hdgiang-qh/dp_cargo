import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_view.dart';
import 'package:vncss/app/modules/bill_of_lading/controller/bill_of_lading_controller.dart';
import 'package:vncss/app/modules/bill_of_lading/controller/bill_of_lading_detail_controller.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../data/model/model/bill_of_lading.dart';
import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/button_widget.dart';
import '../../common_widget/const.dart';

class UpdateBillOfLading extends BaseView<BillOfLadingDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        AppBarWidget(
          title: "Cập nhật vận đơn ",
          onBack: () => Get.back(),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TypeAheadField<CodePacked>(
                    controller: controller.codeBolUpdate,
                    suggestionsCallback: (pattern) {
                      return;
                    },
                    builder: (context, controller, focusNode) {
                      return AppTextInputField(
                        label: "Mã vận đơn",
                        showLabel: true,
                        enable: false,
                        controller: controller,
                        focusNode: focusNode,
                        hint: "Mã vận đơn",
                      );
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                          title: Text(suggestion.code ?? ''));
                    },
                    onSelected: (suggestion) {
                      // controller.codeDeliveryUpdate.text = suggestion.code.toString();
                    },
                    loadingBuilder: (context) =>
                    const Text('Loading...'),
                    errorBuilder: (context, error) =>
                    const Text('Error!'),
                    emptyBuilder: (context) => Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('Không có dữ liệu phù hợp')),
                  ),
                  TypeAheadField<BillOfLadingVnDeliveryUnit>(
                    controller: controller.deliveryUnitUpdate,
                    suggestionsCallback: (pattern) {
                      return controller.listDeliveryUnit
                          .where((BillOfLadingVnDeliveryUnit item) =>
                          item.name
                              .toString()
                              .toLowerCase()
                              .contains(pattern.toLowerCase()))
                          .toList();
                    },
                    builder: (context, controllers, focusNode) {
                      return Obx(() {
                        return AppTextInputField(
                          label: "Đơn vị vận chuyển",
                          showLabel: true,
                          controller: controllers,
                          error: controller.errorShipUpdate.value,
                          focusNode: focusNode,
                          hint: "Đơn vị",
                        );
                      });
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                          title: Text(suggestion.name ?? ""));
                    },
                    onSelected: (suggestion) {
                      controller.deliveryUnitUpdate.text =
                          suggestion.name.toString();
                      controller.idDeliveryUnitUpdate.value =
                          suggestion.id;
                    },
                    loadingBuilder: (context) =>
                    const Text('Loading...'),
                    errorBuilder: (context, error) =>
                    const Text('Error!'),
                    emptyBuilder: (context) => Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text('Không có dữ liệu phù hợp')),
                  ),
                  Obx(() {
                    return AppTextInputField(
                      label: "Số lượng",
                      showLabel: true,
                      controller: controller.quantityUpdate,
                      error: controller.errorQuantityUpdate.value,
                      textInputType: TextInputType.number,
                      hint: "123",
                    );
                  }),
                ],
              ),
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  buttonText: "Hủy bỏ",
                  bgcolor: ColorApp.whiteFA,
                  borderColor: primaryColor,
                  textColor: primaryColor,
                  onTap: () => Get.back(),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: ButtonWidget(
                  buttonText: "Cập nhật",
                  bgcolor: primaryColor,
                  borderColor: primaryColor,
                  textColor: ColorApp.whiteFA,
                  onTap: () {
                    controller.updateBol();
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ])),
    );
  }
}
