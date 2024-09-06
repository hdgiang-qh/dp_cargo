import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import '../../../core/base/base_view.dart';
import '../../../core/utils/validator.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/elevate_button.dart';
import '../controller/forget_password_controller.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/widget/textfields/app_text_field.dart';

class NewPasswordView extends BaseView<ForgetPasswordController> with Validator {
  final FocusNode cfPassFocus = FocusNode();
  final FocusNode passFocus = FocusNode();
  final FocusNode gmailFocus = FocusNode();

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: appLocalization.enter_new_password,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nhập lại mật khẩu mới',
              style: Theme.of(context).BodyText2Bold,
            ),
            Gap(8.h),
            Text('Sử dụng kết hợp các chữ cái, số và ký hiệu có ít nhất 8 ký tự.',
                style: Theme.of(context).BodyText1.copyWith(
                      fontSize: 16,
                      color: AppColors.neutrals08,
                    )),
            Gap(16.h),
            Gap(16.h),
            Text(
              appLocalization.password,
              style: Theme.of(context).BodyText1,
            ),
            Gap(8.h),
            Form(
              key: controller.passKey,
              child: AppTextFieldWidget(
                obscureText: true,
                prefixIcon: Assets.icons.icLock.svg(),
                inputController: controller.passController,
                focusNode: passFocus,
                hintText: appLocalization.password,
                validator: checkPassword,
                textInputType: TextInputType.visiblePassword,
                onChanged: (_) {
                  controller.passKey.currentState!.validate();
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passFocus);
                },
              ),
            ),
            Gap(16.h),
            Text(
              appLocalization.re_password,
              style: Theme.of(context).BodyText1,
            ),
            Gap(8.h),
            Form(
              key: controller.cfPassKey,
              child: AppTextFieldWidget(
                obscureText: true,
                prefixIcon: Assets.icons.icLock.svg(),
                inputController: controller.cfPassController,
                focusNode: cfPassFocus,
                hintText: appLocalization.re_password,
                validator: (text) {
                  return checkRePassword(controller.passController.text, text);
                },
                textInputType: TextInputType.visiblePassword,
                onChanged: (_) {
                  controller.cfPassKey.currentState!.validate();
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passFocus);
                },
              ),
            ),
            Gap(24.h),
            RedButton(
              text: 'Xác nhận',
              onTap: () {
                controller.confirm();
              },
            ),
            Gap(16.h),
          ],
        ),
      ),
    );
  }

  PinTheme get defaultPinTheme => PinTheme(
        height: 56,
        width: 56,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        textStyle: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
      );

  PinTheme get focusPinTheme => PinTheme(
        height: 56,
        width: 56,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        textStyle: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffd36616), width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
      );
}
