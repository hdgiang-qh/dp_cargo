import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/utils/validator.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/elevate_button.dart';
import '../../../routes/app_pages.dart';
import '../controller/forget_password_controller.dart';
import '../../../../gen/assets.gen.dart';

class ChangePassSuccessView extends BaseView<ForgetPasswordController> with Validator {
  @override
  Widget body(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustom(),
      body: Center(
        child: Column(
          children: [
            Gap(19.h),
            Assets.images.changePassSucess.image(),
            Text(
              'Đổi mật khẩu thành công',
              style: Theme.of(context).heading3,
            ),
            Gap(16.h),
            Text(
              'Để liên hệ hỗ trợ tư vấn vui lòng liên hệ',
              style: Theme.of(context).BodyText1.copyWith(fontSize: 14, color: const Color(0xff8b8b97)),
            ),
            Gap(16.h),
            RichText(
              text: TextSpan(
                text: 'Hotline: ',
                style: Theme.of(context).BodyText1.copyWith(
                      fontSize: 20,
                      color: const Color(0xff8b8b97),
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: '0353454679',
                    style: Theme.of(context).BodyText1Second.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        height: (28 / 20).sp),
                  ),
                ],
              ),
            ),
            Gap(24.h),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: RedButton(
                text: 'Đăng nhập',
                onTap: () {
                  Get.offAllNamed(Routes.HOME_INTRO);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
