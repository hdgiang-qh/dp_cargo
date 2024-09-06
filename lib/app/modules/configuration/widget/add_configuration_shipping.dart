import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/avatar.dart';
import 'package:vncss/app/modules/common_widget/app_bar_widget.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/configuration/controller/partner_controller.dart';

import '../../../core/base/base_view.dart';
import '../../common_widget/const.dart';

class AddConfigurationShipping extends BaseView<PartnerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Thêm đối tác vận chuyển",
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
                    Center(
                      child: AvatarWidget(
                        url: null,
                        onChanged: (file) {
                          controller.onSetValue();
                          controller.uploadAvatar(file: file);
                        },
                      ),
                    ),
                    AppTextInputField(
                      controller: controller.nameAdd,
                      label: "Tên",
                      showLabel: true,
                      hint: "Tên",
                    ),
                    AppTextInputField(
                      controller: controller.codeAdd,
                      label: "Code",
                      showLabel: true,
                      hint: "Code",
                      inputFormatters: [UppercaseTextFormatter()],
                    ),
                  ],
                ),
              ),
            ),
            ButtonWidget(
              buttonText: "Thêm đối tác",
              margin: const EdgeInsets.symmetric(horizontal: 16),
              bgcolor: primaryColor,
              borderColor: primaryColor,
              textColor: Colors.white,
              onTap: () {
                controller.createDeliveryUnit();

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
