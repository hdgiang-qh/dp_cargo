import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../core/base/base_view.dart';
import '../../../core/utils/validator.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/elevate_button.dart';
import '../controller/forget_password_controller.dart';
import 'new_pass_view.dart';

class ForgetPasswordOtpView extends BaseView<ForgetPasswordController> with Validator {
  final String email;

  ForgetPasswordOtpView({required this.email});
  @override
  Widget body(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: appLocalization.insert_code,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocalization.cf_code,
              style: Theme.of(context).BodyText2Bold,
            ),
            Gap(8.h),
            RichText(
              text: TextSpan(
                text: 'Nhập mã xác thực của ứng dụng \nđến email ',
                style: Theme.of(context).BodyText1.copyWith(
                      fontSize: 16,
                      color: AppColors.neutrals08,
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: '($email)',
                    style: Theme.of(context).BodyText2Bold,
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Center(
              child: Form(
                key: controller.pinKey,
                child: Pinput(
                  autofocus: true,
                  focusedPinTheme: focusPinTheme,
                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  controller: controller.pinController,
                  defaultPinTheme: defaultPinTheme,
                  validator: (text) {
                    if (text?.length != 4) return "Mã không hợp lệ";
                    return null;
                  },
                  errorPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                    border: Border.all(color: AppColors.errorColor),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  )),
                  listenForMultipleSmsOnAndroid: true,
                  length: 4,
                ),
              ),
            ),
            Gap(24.h),
            RedButton(
              text: 'Xác nhận',
              onTap: () {
                FocusScope.of(context).unfocus();
                if (controller.pinKey.currentState?.validate() == false) {
                  return;
                }
                Get.to(NewPasswordView());
              },
            ),
            Gap(16.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Không nhận được mã',
                style: Theme.of(context).BodyText1.copyWith(color: AppColors.second500),
              ),
            ),
            Gap(16.h),
            WhiteButton(
              text: 'Gửi lại mã',
              onTap: () {},
            ),
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
