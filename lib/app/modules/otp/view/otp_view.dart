import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../../core/widget/time_count_down.dart';
import '../controller/otp_controller.dart';

class OtpView extends BaseView<OtpController> {
  final String phone;

  OtpView({required this.phone});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const AppbarCustom();
  }

  final pinController = TextEditingController();
  final pinKey = GlobalKey<FormState>();

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.margin_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(32),
          Text(
            appLocalization.input_otp,
            style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const Gap(16),
          Text(
            appLocalization.input_otp_label(phone.replaceRange(3, 7, "****")),
            style: textTheme.titleMedium?.copyWith(color: AppColors.text_hint, height: 24 / 14),
          ),
          const Gap(40),
          Form(
            key: pinKey,
            child: Pinput(
              androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
              controller: pinController,
              defaultPinTheme: defaultPinTheme,
              validator: (text) {
                if (text?.length != 6) return "Mã không hợp lệ";
                return null;
              },
              errorPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                border: Border.all(color: AppColors.errorColor),
                color: AppColors.lineColor,
                borderRadius: BorderRadius.circular(6),
              )),
              listenForMultipleSmsOnAndroid: true,
              length: 6,
            ),
          ),
          const Gap(30),
          SizedBox(
              width: size.width,
              child: ElevatedButton(
                  onPressed: () {
                    if (pinController.text.length != 6) {
                      AppSnackBar.showError(message: appLocalization.otp_not_valid);
                      return;
                    }
                    controller.verifyOtp(phone, pinController.text);
                  },
                  child: Text(appLocalization.verify))),
          const Gap(30),
          Center(
            child: TimeCountDown(
              duration: const Duration(seconds: 60),
              textStyle: textTheme.titleMedium!,
              voidCallback: () {
                controller.reSentOtp(phone);
              },
            ),
          )
        ],
      ),
    );
  }

  PinTheme get defaultPinTheme => PinTheme(
        height: 56,
        width: 56,
        textStyle: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
        decoration: BoxDecoration(
          color: AppColors.lineColor,
          borderRadius: BorderRadius.circular(6),
        ),
      );
}
