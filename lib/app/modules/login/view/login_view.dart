import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/utils/validator.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/check_box.dart';
import '../../../core/widget/elevate_button.dart';
import '../../../routes/app_pages.dart';
import '../controller/login_controller.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/widget/textfields/app_text_field.dart';

class LoginView extends BaseView<LoginController> with Validator {
  final gmailKey = GlobalKey<FormState>();
  final FocusNode gmailFocus = FocusNode();

  final passKey = GlobalKey<FormState>();
  final FocusNode passFocus = FocusNode();

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: appLocalization.login,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocalization.welcome_back,
              style: Theme.of(context).BodyText2Bold,
            ),
            Gap(10.h),
            Text(
              'Nhập địa chỉ email và mật khẩu để truy cập tài khoản khách hàng',
              style: Theme.of(context)
                  .BodyText1GreyScale
                  .copyWith(height: (21.6).sp / 16.sp),
            ),
            Gap(16.h),
            Text(
              appLocalization.account,
              style: Theme.of(context).BodyText1,
            ),
            Gap(8.h),
            Form(
              key: gmailKey,
              child: AppTextFieldWidget(
                prefixIcon: Assets.icons.icMail.svg(),
                inputController: controller.gmailController,
                focusNode: gmailFocus,
                hintText: appLocalization.input_hint_email,
                validator: checkEmail,
                textInputType: TextInputType.emailAddress,
                onChanged: (_) {
                  gmailKey.currentState!.validate();
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passFocus);
                },
              ),
            ),
            Gap(16.h),
            Text(
              appLocalization.password,
              style: Theme.of(context).BodyText1,
            ),
            Gap(8.h),
            Form(
              key: passKey,
              child: AppTextFieldWidget(
                obscureText: true,
                prefixIcon: Assets.icons.icMail.svg(),
                inputController: controller.passController,
                focusNode: passFocus,
                hintText: appLocalization.password,
                validator: checkPassword,
                textInputType: TextInputType.visiblePassword,
                onChanged: (_) {
                  passKey.currentState!.validate();
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passFocus);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Align(
            //     alignment: Alignment.centerRight,
            //     child: TextButton(
            //         onPressed: () {
            //           Get.toNamed(Routes.FORGET_PASSWORD);
            //         },
            //         child: Text(
            //           'Bạn quên mật khẩu?',
            //           style: Theme.of(context).ForgotPasswordTextStyle,
            //         ))),
            Row(
              children: [
                Obx(() => CustomCheckBox(
                    borderColor: AppColors.primary,
                    onChanged: (val) {
                      controller.rememberPassword.value = val;
                    },
                    value: controller.rememberPassword.value,
                    checkedFillColor: AppColors.primary)),
                Gap(12.w),
                Text(
                  'Nhớ tài khoản',
                  style: Theme.of(context).BodyText1,
                )
              ],
            ),
            Gap(24.h),
            RedButton(
              text: appLocalization.login,
              onTap: () {
                if (gmailKey.currentState?.validate() == false) {
                  return;
                }
                if (passKey.currentState?.validate() == false) {
                  return;
                }
                controller.loginApi(controller.gmailController.text,
                    controller.passController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
