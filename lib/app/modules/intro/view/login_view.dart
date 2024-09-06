import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'widgets/button_intro.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(46.h),
            Center(child: Assets.images.appLogo.svg()),
            Gap(62.h),
            Assets.images.appBackground.image(fit: BoxFit.cover),
            const Spacer(),
            RegisterButton(
              text: 'Đăng nhập tài khoản',
              onTap: () {
                Get.toNamed(Routes.LOGIN);
              },
            ),
            Gap(10.h)
          ],
        ),
      ),
    );
  }
}
