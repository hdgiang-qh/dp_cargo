import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/configuration_model.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/widget/skeletonizer_loading.dart';

import '../../../app/core/widget/textfields/app_text_field.dart';
import '../../core/base/base_view.dart';
import '../common_widget/app_bar_widget.dart';
import '../common_widget/const.dart';
import 'controller/configuration_mail_controller.dart';

class InformationMailServerScreen
    extends BaseView<ConfigurationMailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarWidget(
            title: "Thông tin cấu hình mail server",
            onBack: () => Get.back(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: FutureBuilder<List<ConfigurationMail>>(
                  future: controller.getConfigurationMail(),
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
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SingleChildScrollView(
                          child: Obx(() {
                            return Column(
                              children: [
                                AppTextInputField(
                                  label: "Port",
                                  showLabel: true,
                                  hint: 'Port',
                                  textInputType: TextInputType.number,
                                  error: controller.portEr.value,
                                  controller: controller.portController,
                                ),
                                AppTextInputField(
                                  label: "Host",
                                  showLabel: true,
                                  hint: 'Host',
                                  error: controller.hostEr.value,
                                  controller: controller.hostController,
                                ),
                                AppTextInputField(
                                  label: "Mail server user",
                                  showLabel: true,
                                  hint: "Mail server user",
                                  error: controller.mailUserEr.value,
                                  controller: controller.mailServeUserController,
                                ),
                                AppTextInputField(
                                  label: "Mail server password",
                                  showLabel: true,hint: "Mail server password",
                                  error: controller.mailPassEr.value,
                                  controller: controller.mailServePasswordController,
                                ),
                                AppTextInputField(
                                  label: "Sender email address",
                                  showLabel: true,
                                  hint: "Sender email address",
                                  error: controller.addressEr.value,
                                  controller: controller.sendEmailAddressController,
                                ),
                                AppTextInputField(
                                  label: "Sender email name",
                                  showLabel: true,
                                  hint: "Sender email name",
                                  error: controller.mailNameEr.value,
                                  controller: controller.sendEmailNameController,
                                ),
                                AppTextInputField(
                                  label: "Admin contact receiver email address",
                                  showLabel: true,
                                  hint: "Admin contact receiver email address",
                                  error: controller.adminMailEr.value,
                                  controller: controller.adminContactReceiveController,
                                ),
                              ],
                            );
                          }),
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
              controller.updateConfigurationMail(
                  controller.listConfigurationMail[0].id!,
                  controller.listConfigurationMail[0].configKey!);
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
