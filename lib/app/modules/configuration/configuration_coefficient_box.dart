import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/configuration_model.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../core/base/base_view.dart';
import '../../core/widget/dialog/app_snackbar.dart';
import '../common_widget/app_bar_widget.dart';
import '../common_widget/button_widget.dart';
import '../common_widget/const.dart';
import '../common_widget/dialog_widget.dart';
import 'controller/configuration_box_controller.dart';

class ConfigurationBoxScreen extends BaseView<ConfigurationBoxController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Cấu hình hệ số thùng",
            onBack: () => Get.back(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: FutureBuilder<List<ConfigurationBox>>(
                  future: controller.getConfigurationBox(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return SkeletonizerLoading(
                        loading: controller.isLoading.value,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData ||
                        snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No delivery bills found'));
                    } else {
                      return  Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppTextInputField(
                          label: "Cập nhật hệ số thùng",
                          showLabel: true,
                          hint: "Nhập hệ số thùng",
                          textInputType: TextInputType.text,
                          controller: controller.updateValue,
                        ),
                      );
                    }
                  })),
          ButtonWidget(
            buttonText: "Cập nhật",
            margin: const EdgeInsets.symmetric(horizontal: 16),
            bgcolor: primaryColor,
            borderColor: primaryColor,
            textColor: ColorApp.whiteFA,
            onTap: () {
              if (controller.updateValue.text.isEmpty) {
                AppSnackBar.showIsEmpty(message: "Hãy nhập giá trị");
              } else if (!controller
                  .isValidFormat(controller.updateValue.text) && !controller
                  .isNumeric(controller.updateValue.text)) {
                AppSnackBar.showIsEmpty(
                    message: "Giá trị nhập sai định dạng hoặc có ký tự là chữ");
              } else {
                Get.dialog(CustomDialog(
                    title: "Xác nhận cập nhật hệ số thùng?",
                    onTapYes: () {
                      controller.updateConfigurationBox(
                          controller.listConfigurationBox[0].id ?? 1000,
                          controller.listConfigurationBox[0].configKey!);
                      Get.back();
                    },
                    onTapNo: () => Get.back()));
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
