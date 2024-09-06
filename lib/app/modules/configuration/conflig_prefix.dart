import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/configuration_model.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_prefix_controller.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../app/core/widget/textfields/app_text_field.dart';
import '../../core/base/base_view.dart';
import '../common_widget/app_bar_widget.dart';
import '../common_widget/const.dart';

class PrefixScreen extends BaseView<ConfigurationPrefixController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Thông tin cấu hình tiền tố",
            onBack: () => Get.back(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: FutureBuilder<List<ConfigurationPrefix>>(
                  future: controller.getConfigurationPrefix(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SkeletonizerLoading(
                        loading: controller.isLoading.value,
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No found'));
                    } else {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            AppTextInputField(
                              label: "Prefix mã đơn hàng",
                              showLabel: true,
                              hint: "Prefix mã đơn hàng",
                              inputFormatters: [
                                UppercaseTextFormatter(),
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z0-9]')),
                              ],
                              controller: controller.prefixOrderCodeController,
                            ),
                            AppTextInputField(
                              label: "Prefix mã phiếu xuất kho",
                              showLabel: true,
                              hint: "Prefix mã phiếu xuất kho",
                              inputFormatters: [
                                UppercaseTextFormatter(),
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z0-9]')),
                              ],
                              controller: controller.prefixPXKCodeController,
                            )
                          ],
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
              controller.updateConfigurationPrefix(
                  controller.listConfigurationPrefix[0].id!,
                  controller.listConfigurationPrefix[0].configKey!);
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

class _ItemCommon extends StatefulWidget {
  final text;
  final controller;

  const _ItemCommon({super.key, required this.text, required this.controller});

  @override
  State<_ItemCommon> createState() => _ItemCommonState();
}

class _ItemCommonState extends State<_ItemCommon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(children: [
        Expanded(
            flex: 1,
            child: Container(
                child: Text(
              widget.text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ))),
        Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.center,
                child: Container(
                    child: AppTextFieldWidget(
                  inputController: widget.controller,
                ))))
      ]),
    );
  }
}
