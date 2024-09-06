import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../data/model/model/employee.dart';

class StuffInChargeWidget extends StatelessWidget {
  final Employee? employee;

  const StuffInChargeWidget({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      color: Colors.white,
      child: Column(
        children: [
          Gap(16.h),
          ItemStaffInfo(
            employee: employee,
            role: "NV kinh doanh",
          ),
          Gap(12.h),
        ],
      ),
    );
  }
}

class ItemStaffInfo extends StatelessWidget {
  final Employee? employee;
  final String role;

  const ItemStaffInfo({super.key, required this.role, this.employee});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          child: CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            imageUrl: employee?.avatarUrl ?? '',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            useOldImageOnUrlChange: true,
            errorWidget: (context, url, error) => Container(
              color: Colors.white,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: const Icon(
                  Icons.image,
                  color: Colors.grey,
                ),
              ),
            ),
            placeholder: (ct, url) {
              return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: const Icon(
                    Icons.image,
                    color: Colors.grey,
                  ));
            },
          ),
        ),
        Gap(12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: employee?.fullname ?? '',
                style: Theme.of(context)
                    .BodyText1
                    .copyWith(fontSize: 16, color: AppColors.neutral, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ($role)',
                    style: Theme.of(context).BodyText1.copyWith(fontSize: 16, color: AppColors.neutral),
                  ),
                ],
              ),
            ),
            Gap(8.h),
            RichText(
              text: TextSpan(
                text: 'Điện thoại: ',
                style: Theme.of(context)
                    .BodyText1
                    .copyWith(fontSize: 13, color: AppColors.neutral, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: employee?.phone ?? '',
                    style: Theme.of(context).BodyText1.copyWith(fontSize: 16, color: AppColors.neutral),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
