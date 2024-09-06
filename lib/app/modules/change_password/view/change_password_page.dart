import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/utils/validator.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/textfields/app_text_field.dart';
import '../../../data/service/setting_service.dart';
import '../controller/change_password_controller.dart';

class ChangePasswordView extends BaseView<ChangePasswordController> with Validator {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppbarCustom(
      title: appLocalization.change_pass,
    );
  }

  final oldPasswordController = TextEditingController();
  final oldPasswordKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final passwordKey = GlobalKey<FormState>();
  final rePasswordController = TextEditingController();
  final rePasswordKey = GlobalKey<FormState>();

  final ValueNotifier<bool> isEnable = ValueNotifier<bool>(false);

  bool get enableButton {
    if (checkPassword(passwordController.text) != null) return false;
    if (checkRePassword(passwordController.text, rePasswordController.text) != null) return false;
    return true;
  }

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.margin_20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(40),
            Form(
              key: oldPasswordKey,
              child: AppTextFieldWidget(
                inputController: oldPasswordController,
                label: appLocalization.old_password,
                hintText: appLocalization.old_password,
                validator: (pass) {
                  return checkOldPassword(pass, Get.find<SettingService>().pass);
                },
                obscureText: true,
                onFieldSubmitted: (_) {},
              ),
            ),
            const Gap(16),
            Form(
              key: passwordKey,
              child: AppTextFieldWidget(
                inputController: passwordController,
                label: appLocalization.password,
                hintText: appLocalization.password,
                validator: checkPassword,
                obscureText: true,
                onChanged: (_) {
                  passwordKey.currentState!.validate();
                  isEnable.value = enableButton;
                },
                onFieldSubmitted: (_) {},
              ),
            ),
            const Gap(16),
            Form(
              key: rePasswordKey,
              child: AppTextFieldWidget(
                inputController: rePasswordController,
                label: appLocalization.re_password,
                hintText: appLocalization.re_password,
                validator: (pass) {
                  return checkRePassword(passwordController.text, pass);
                },
                obscureText: true,
                onChanged: (_) {
                  rePasswordKey.currentState!.validate();
                  isEnable.value = enableButton;
                },
                onFieldSubmitted: (_) {},
              ),
            ),
            const Spacer(),
            SizedBox(
                width: size.width,
                child: ValueListenableBuilder(
                  valueListenable: isEnable,
                  builder: (BuildContext context, bool enable, Widget? child) {
                    return ElevatedButton(
                      onPressed: enable
                          ? () {
                              if (oldPasswordKey.currentState?.validate() == false) {
                                return;
                              }
                              controller.changePassword(oldPasswordController.text, passwordController.text);
                            }
                          : null,
                      child: Text(appLocalization.change_pass),
                    );
                  },
                )),
            const Gap(16),

          ],
        ),
      ),
    );
  }
}
