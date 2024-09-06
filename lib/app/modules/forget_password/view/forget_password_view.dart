import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../core/base/base_view.dart';
import '../../../core/utils/validator.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/elevate_button.dart';
import '../controller/forget_password_controller.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/widget/textfields/app_text_field.dart';

class ForgetPasswordView extends BaseView<ForgetPasswordController> with Validator {
  final FocusNode gmailFocus = FocusNode();

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: appLocalization.forget_password,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocalization.please_input_email,
              style: Theme.of(context).BodyText2Bold,
            ),
            Gap(16.h),
            Form(
              key: controller.gmailKey,
              child: AppTextFieldWidget(
                prefixIcon: Assets.icons.icMail.svg(),
                inputController: controller.gmailController,
                focusNode: gmailFocus,
                hintText: appLocalization.input_hint_email,
                validator: checkEmail,
                textInputType: TextInputType.emailAddress,
                onChanged: (_) {
                  controller.gmailKey.currentState!.validate();
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            Gap(24.h),
            RedButton(
              text: appLocalization.continue_text,
              onTap: () {
                if (controller.gmailKey.currentState?.validate() == false) {
                  return;
                }
                controller.sendEmail();
              },
            ),
            Gap(16.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                appLocalization.you_remember_password,
                style: Theme.of(context).BodyText1.copyWith(color: AppColors.second500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
