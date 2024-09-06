import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';

class DeliverySummary extends StatelessWidget {
  final String? orderId;
  final String? status;
  final int? trackingAmount;
  final Color? color;

  const DeliverySummary({super.key, this.orderId, this.trackingAmount, required this.status, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: color ?? AppColors.status6, width: 1.w),
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Assets.icons.icBillSummary.svg(colorFilter: ColorFilter.mode(color ?? AppColors.status6, BlendMode.srcIn)),
        Gap(16.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status ?? '- -',
              style: Theme.of(context).Subtitle2Medium.copyWith(color: color ?? AppColors.status6),
            ),
            Gap(4.h),
            RichText(
              text: TextSpan(
                text: 'Mã phiếu: ',
                style: Theme.of(context).BodyText1.copyWith(fontSize: 13, color: AppColors.neutral),
                children: <TextSpan>[
                  TextSpan(
                    text: orderId ?? '',
                    style: Theme.of(context).BodyText2Bold.copyWith(fontSize: 16, color: AppColors.neutral),
                  ),
                ],
              ),
            ),
            Gap(4.h),
            RichText(
              text: TextSpan(
                text: 'Tổng số lượng tracking: ',
                style: Theme.of(context).BodyText1.copyWith(fontSize: 13, color: AppColors.neutral),
                children: <TextSpan>[
                  TextSpan(
                    text: trackingAmount != null ? trackingAmount.toString() : '',
                    style: Theme.of(context).BodyText2Bold.copyWith(fontSize: 16, color: AppColors.neutral),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
