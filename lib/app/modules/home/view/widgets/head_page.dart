import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/values/app_colors.dart';

import '../../../../data/service/common_service.dart';

class HeadPage extends StatefulWidget {
  const HeadPage({super.key});

  @override
  State<HeadPage> createState() => _HeadPageState();
}

class _HeadPageState extends State<HeadPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 64.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Assets.images.logo21.image(width: 182.w, height: 32.h)],
          ),
        ),
      ],
    );
  }
}

class HotLineButton extends StatelessWidget {
  const HotLineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final config = Get.find<CommonApi>().configData.value;
        try {
          await launchUrl(Uri.parse('tel:${config.configValue!.config!.first.phoneNumber!.replaceAll(".", "")}'));
        } catch (_) {}
      },
      child: Chip(
        backgroundColor: (Theme.of(context).primaryColor),
        color: MaterialStateProperty.all(Theme.of(context).primaryColor),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Hotline',
              style:
                  TextStyle(color: AppColors.neutralsWhite, fontSize: 18.sp, fontWeight: FontWeight.w600, height: 0.sp),
            ),
            Gap(10.w),
            Assets.icons.icPhone.svg()
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      ),
    );
  }
}
