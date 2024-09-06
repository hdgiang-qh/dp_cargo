import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/generated/l10n.dart';

import '../../../../../core/base/base_view.dart';
import '../../../../common_widget/app_bar_widget.dart';
import '../../delivery_detail/controller/detail_delivery_controller.dart';

class EditDeliveryBillScr extends BaseView<DetailDeliveryController> {
  Widget updateBill(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.width,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
              color: ColorApp.blueED,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Mã phiếu xuất kho:",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    controller.deliveryBill.value.deliveryBillStatus?.value ??
                        S.current.isNull,
                    style: TextStyle(
                        color: controller.buildColor(
                            value: controller.deliveryBill.value
                                    .deliveryBillStatus?.value ??
                                S.current.isNull),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                controller.deliveryBill.value.code.toString(),
                style: TextStyle(
                    color: controller.buildColor(
                        value: controller
                                .deliveryBill.value.deliveryBillStatus?.value ??
                            S.current.isNull),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      AppTextInputField(
                        label: "Tên người nhận",
                        controller: controller.name,
                        showLabel: true,
                        textInputType: TextInputType.name,
                        hint: "Nhập tên",
                        focusNode: controller.nameFocus,
                        error: controller.errorName.value,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(controller.phoneFocus);
                        },
                      ),
                      AppTextInputField(
                        label: "Số điện thoại",
                        controller: controller.phone,
                        showLabel: true,
                        textInputType: TextInputType.number,
                        hint: "Nhập số điện thoại",
                        focusNode: controller.phoneFocus,
                        error: controller.errorPhone.value,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(controller.emailFocus);
                        },
                      ),
                      AppTextInputField(
                        label: "Email",
                        controller: controller.email,
                        showLabel: true,
                        textInputType: TextInputType.emailAddress,
                        hint: "Nhập email",
                        focusNode: controller.emailFocus,
                        error: controller.errorEmail.value,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(controller.addressFocus);
                        },
                      ),
                      AppTextInputField(
                        label: "Địa chỉ",
                        controller: controller.address,
                        showLabel: true,
                        textInputType: TextInputType.text,
                        hint: "Nhập địa chỉ",
                        focusNode: controller.addressFocus,
                        error: controller.errorAddress.value,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(controller.noteFocus);
                        },
                      ),
                      AppTextInputField(
                        label: "Ghi chú",
                        showLabel: true,
                        controller: controller.note,
                        hint: 'Note',
                        focusNode: controller.noteFocus,
                        textInputType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              AppBarWidget(
                title: "Sửa thông tin phiếu",
                onBack: () {
                  Get.back();
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(child: updateBill(context)),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        buttonText: "Huỷ bỏ",
                        bgcolor: ColorApp.whiteFA,
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
                        buttonText: "Chỉnh sửa",
                        bgcolor: primaryColor,
                        textColor: ColorApp.whiteFA,
                        onTap: () {
                          controller.updateDeliveryDetail();
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
