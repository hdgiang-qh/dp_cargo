import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/elevate_button.dart';
import '../../home/view/widgets/head_page.dart';
import '../../main/views/main_view.dart';
class SuccessBox extends StatelessWidget {
  const SuccessBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustom(
        height: 0,
      ),
      body: SafeArea(
          child: Column(
            children: [
              const HeadPage(),
              Gap(16.h),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.icBox.svg(),
                    Gap(16.h),
                    const Text(
                     'Chi tiết liên hệ: 1234567890',
                    ),
                    Gap(16.h),
                    RedButton(
                      onTap: () => Get.to(MainView()),
                      text: 'Về trang chủ',
                      width: 150,
                      height: 40,
                    )
                  ],
                ),
              )
            ]
          )),
    );
  }
}
