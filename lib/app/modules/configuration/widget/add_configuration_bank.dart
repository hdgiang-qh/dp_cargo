import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/avatar.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/modules/common_widget/app_bar_widget.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_bank_controller.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_interface_controller.dart';
import 'package:vncss/app/modules/configuration/widget/choose_image.dart';

import '../../../core/base/base_view.dart';
import '../../common_widget/const.dart';

class AddConfigurationBank extends BaseView<ConfigurationBankController> {
  final controllerInter = Get.find<ConfigurationInterfaceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Thêm tài khoản ngân hàng",
              onBack: () => Get.back(),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      AppTextInputField(
                        controller: controller.nameBank,
                        label: "Tên ngân hàng",
                        showLabel: true,
                        hint: "Tên ngân hàng",
                      ),
                      AppTextInputField(
                        controller: controller.numberBank,
                        label: "Số tài khoản",
                        showLabel: true,
                        textInputType: TextInputType.number,
                        hint: "Số tài khoản",
                      ),
                      AppTextInputField(
                        controller: controller.nameAcc,
                        label: "Tên tài khoản",
                        showLabel: true,
                        hint: "Tên tài khoản",
                      ),
                      AppTextInputField(
                        controller: controller.nameBranch,
                        label: "Chi nhánh ngân hàng",
                        showLabel: true,
                        hint: "Tên chi nhánh",
                      ),
                      ChooseImage(
                        onChanged: (file) {
                          controller.onSetValue();
                          controller.uploadLogoBank(file: file);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ChooseImage(
                        onChanged: (file) {
                          controller.onSetValue();
                          controller.uploadQR(file: file);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ButtonWidget(
              buttonText: "Thêm tài khoản",
              margin: const EdgeInsets.symmetric(horizontal: 16),
              bgcolor: primaryColor,
              borderColor: primaryColor,
              textColor: Colors.white,
              onTap: () {
                controller.listBankAdd.clear();
                controller.listBankAdd
                    .addAll(controller.listBankModelConfigValueConfig);
                controller.listBankAdd.add(BankModelConfigValueConfig(
                    accountName: controller.nameAcc.text,
                    accountNumber: controller.numberBank.text,
                    bankBranch: controller.nameBranch.text,
                    bankName: controller.nameBank.text,
                    logo: controller.urlLogo,
                    qrCode: controller.urlQr));
                if (controller.nameBank.text.isEmpty ||
                    controller.numberBank.text.isEmpty ||
                    controller.nameAcc.text.isEmpty ||
                    controller.nameBranch.text.isEmpty) {
                  AppSnackBar.showIsEmpty(message: "Điền đầy đủ thông tin");
                } else if (controller.urlLogo == null ||
                    controller.urlQr == null) {
                  AppSnackBar.showIsEmpty(message: "File ảnh trống");
                } else {
                  Get.dialog(
                    CustomDialog(
                      title: "Xác nhận tạo tài khoản ngân hàng?",
                      onTapYes: () async {
                        controller.createConfigurationBank(
                            controller.listBank[0].id ?? 0);
                        Get.back();
                        Get.back(result: true);
                        Future.delayed(const Duration(milliseconds: 500), () {
                          controller.onRefreshPage();
                        });
                      },
                      onTapNo: () {
                        Get.back();
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
