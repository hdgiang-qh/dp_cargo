import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/avatar.dart';
import 'package:vncss/app/data/model/model/configuration_model.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../core/base/base_view.dart';
import '../common_widget/app_bar_widget.dart';
import '../common_widget/const.dart';
import 'controller/configuration_common_controller.dart';

class CommonInformationScreen extends BaseView<ConfigurationCommonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Thông tin chung",
            onBack: () => Get.back(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Obx(() {
                    if (controller.isLoading.value == false &&
                        controller.listConfigurationCommon.isEmpty) {
                      return SkeletonizerLoading(
                        loading: controller.isLoading.value,
                      );
                    }
                    return Column(children: [
                      Center(
                        child: Obx(() {
                          return AvatarWidget(
                            url: controller.urlLogo.value,
                            onChanged: (file) {
                              controller.onSetValue();
                              controller.uploadAvatar(file: file);
                            },
                          );
                        }),
                      ),
                      AppTextInputField(
                        label: "Tiêu đề trang",
                        showLabel: true,
                        hint: 'Tiêu đề trang',
                        error: controller.labelEr.value,
                        controller: controller.labelController,
                      ),
                      AppTextInputField(
                        label: "Số điện thoại",
                        showLabel: true,
                        hint: '0888******',
                        error: controller.phoneEr.value,
                        textInputType: TextInputType.number,
                        controller: controller.phoneController,
                      ),
                      AppTextInputField(
                        label: "Email",
                        showLabel: true,
                        hint: 'abc@gmail.com',
                        controller: controller.emailController,
                        error: controller.emailEr.value,
                      ),
                      AppTextInputField(
                        label: "Địa chỉ 1",
                        showLabel: true,
                        hint: "Address 1",
                        error: controller.add1Er.value,
                        controller: controller.address1Controller,
                      ),
                      AppTextInputField(
                        label: "Địa chỉ 2",
                        showLabel: true,
                        hint: "Address 2",
                        controller: controller.address2Controller,
                      ),
                      AppTextInputField(
                        label: "Địa chỉ 3",
                        showLabel: true,
                        hint: "Address 3",
                        controller: controller.address3Controller,
                      ),
                      AppTextInputField(
                        label: "Đường dẫn Facebook",
                        showLabel: true,
                        hint: "Link Facebook...",
                        error: controller.fbEr.value,
                        controller: controller.linkFacebookController,
                      ),
                      AppTextInputField(
                        label: "Đường dẫn Zalo",
                        showLabel: true,
                        hint: "Link Zalo...",
                        error: controller.zaloEr.value,
                        controller: controller.linkZaloController,
                      ), AppTextInputField(
                        label: "Đường dẫn App Store",
                        showLabel: true,
                        hint: "Link App Store",
                        controller: controller.linkAppStore,
                      ), AppTextInputField(
                        label: "Đường dẫn CH Play",
                        showLabel: true,
                        hint: "Link Ch Play",
                        controller: controller.linkCHPlay,
                      ),
                      AppTextInputField(
                        label: "Mã nhúng HEAD",
                        showLabel: true,
                        hint: "script_head",
                        controller: controller.scriptHeaderController,
                      ),
                      AppTextInputField(
                        label: "Mã nhúng FOOTER",
                        showLabel: true,
                        hint: "script_footer",
                        controller: controller.scriptFooterController,
                      ),
                    ]);
                  }),
                ),
              )),
          ButtonWidget(
            buttonText: "Cập nhật",
            margin: const EdgeInsets.symmetric(horizontal: 16),
            bgcolor: primaryColor,
            borderColor: primaryColor,
            textColor: ColorApp.whiteFA,
            onTap: () {
              controller.updateConfigurationCommon(
                  controller.listConfigurationCommon[0].id!,
                  controller.listConfigurationCommon[0].configKey!);
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
