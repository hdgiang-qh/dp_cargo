import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/transaction.dart';
import 'package:vncss/app/modules/common_widget/app_bar_widget.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/configuration/controller/detail_configuration_bank_controller.dart';
import 'package:vncss/app/modules/configuration/widget/choose_image.dart';

import '../../../core/base/base_view.dart';
import '../../common_widget/const.dart';

class UpdateConfigurationBank
    extends BaseView<DetailConfigurationBankController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Cập nhật tài khoản ngân hàng",
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
                        url: controller.urlLogo,
                        onChanged: (file) {
                          controller.onSetValue();
                          controller.uploadLogoBank(file: file);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ChooseImage(
                        url: controller.urlQr,
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
              buttonText: "Cập nhật",
              margin: const EdgeInsets.symmetric(horizontal: 16),
              bgcolor: primaryColor,
              borderColor: primaryColor,
              textColor: Colors.white,
              onTap: () {
                controller.listBankAdd.clear();
                controller.controllerBank.listBankModelConfigValueConfig
                    .removeAt(controller.id ?? 0);
                controller.controllerBank.listBankModelConfigValueConfig.insert(
                    controller.id ?? 0,
                    BankModelConfigValueConfig(
                        bankName: controller.nameBank.text,
                        accountNumber: controller.numberBank.text,
                        bankBranch: controller.nameBranch.text,
                        accountName: controller.nameAcc.text,
                        logo: controller.urlLogo,
                        qrCode: controller.urlQr));
                controller.listBankAdd.addAll(
                    controller.controllerBank.listBankModelConfigValueConfig);
                controller.updateConfigurationBank(controller.controllerBank.listBank[0].id ?? 0);
                Get.back();
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
