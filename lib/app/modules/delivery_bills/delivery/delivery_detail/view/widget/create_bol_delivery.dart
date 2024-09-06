import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_view.dart';
import 'package:vncss/app/data/model/model/bill_of_lading.dart';
import 'package:vncss/app/modules/bill_of_lading/controller/bill_of_lading_controller.dart';
import 'package:vncss/app/modules/common_widget/app_bar_widget.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';

import '../../../../../bill_of_lading/controller/bill_of_lading_delivery_controller.dart';
import '../../../../../common_widget/const.dart';

class CreateBolDelivery extends BaseView<BillOfLadingDeliveryController> {
  final String codeDelivery;

  CreateBolDelivery({required this.codeDelivery});

  @override
  Widget build(BuildContext context) {
    controller.codeDelivery.text = codeDelivery;
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
            AppBarWidget(
              title: "Thêm vận đơn",
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
                    Obx(() {
                      return AppTextInputField(
                        label: "Mã PXK",
                        showLabel: true,
                        controller: controller.codeDelivery,
                        enable: false,
                        error: controller.errorCode.value,
                        hint: "Chọn mã phiếu xuất kho",
                      );
                    }),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Obx(() {
                            return AppTextInputField(
                              label: "Mã vận đơn",
                              showLabel: true,
                              controller: controller.codeBol,
                              hint: "Mã vận đơn",
                              readOnly: true,
                              error: controller.errorBol.value,
                              inputFormatters: [UppercaseTextFormatter()],
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Obx(() {
                            return ButtonWidget(
                              margin: EdgeInsets.only(
                                  top: controller.errorBol.value == null
                                      ? 20
                                      : 0),
                              buttonText: "Tạo mã",
                              textColor: ColorApp.whiteFA,
                              bgcolor: primaryColor,
                              onTap: () {
                                controller.onSetValue();
                              },
                            );
                          }),
                        )
                      ],
                    ),
                    TypeAheadField<BillOfLadingVnDeliveryUnit>(
                      controller: controller.deliveryUnit,
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
                            focusNode: focusNode,
                            error: controller.errorShip.value,
                            hint: "Đơn vị",
                          );
                        });
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(title: Text(suggestion.name ?? ""));
                      },
                      onSelected: (suggestion) {
                        controller.deliveryUnit.text =
                            suggestion.name.toString();
                        controller.idDeliveryUnit.value = suggestion.id;
                      },
                      loadingBuilder: (context) => const Text('Loading...'),
                      errorBuilder: (context, error) => const Text('Error!'),
                      emptyBuilder: (context) =>
                          Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text('Không có dữ liệu phù hợp')),
                    ),
                    Obx(() {
                      return AppTextInputField(
                        label: "Số lượng",
                        showLabel: true,
                        controller: controller.quantity,
                        error: controller.errorQuantity.value,
                        textInputType: TextInputType.number,
                        hint: "123",
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                      buttonText: "Hủy",
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
                      buttonText: "Tạo mới",
                      bgcolor: primaryColor,
                      borderColor: primaryColor,
                      textColor: ColorApp.whiteFA,
                      onTap: () async {
                        print(controller
                            .controllerDetailDelivery.deliveryBill.value.id);
                        await controller.createBillOfLadingDelivery();
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
