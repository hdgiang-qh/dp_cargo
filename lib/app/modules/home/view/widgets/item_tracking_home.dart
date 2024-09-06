import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../data/model/model/tracking.dart';
import '../../../delivery_bills/list_delivery_bills/view/widgets/status_widget.dart';

class ItemTrackingHome extends StatelessWidget {
  final Trackings? tracking;
  final VoidCallback? onTap;

  const ItemTrackingHome({super.key, this.onTap, required this.tracking});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.borderPXK),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: tracking?.orderId ?? ''));
                    },
                    child: Assets.icons.icBillPXK.svg()),
                Gap(10.w),
                Expanded(
                  child: Text(
                    tracking?.orderId ?? '',
                    style: Theme.of(context).BodyText2Bold.copyWith(color: AppColors.neutrals08, height: 1),
                    maxLines: 1,
                  ),
                ),
                if (tracking?.status != null) ChipStatus(color: tracking!.status!.color, label: tracking!.status?.value ?? ''),
              ],
            ),
            Gap(12.h),
            Text(
              'Mã tracking',
              style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
            ),
            Gap(8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: tracking?.code ?? ''));
                      },
                      child: Assets.icons.icBillPXK.svg()),
                ),
                Gap(10.w),
                Expanded(
                  child:
                  Text(tracking?.code ?? '', style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
                ),
              ],
            ),
            Gap(12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kho US',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Expanded(
                  child: Text(
                      textAlign: TextAlign.right,
                      tracking?.warehouse?.name ?? '',
                      style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
                ),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kho VN',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text(tracking?.warehouse?.name?.toString() ?? '',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thông tin',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text(
                  tracking?.description ?? '',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
                ),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thời gian',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Expanded(
                  child: Text(
                      textAlign: TextAlign.right,
                      formatDateTimeExportOrder(tracking?.packedDate),
                      style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
                ),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ghi chú',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Expanded(
                    child: Text(
                        textAlign: TextAlign.right,
                        tracking?.note ?? '',
                        style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08))),
              ],
            ),
            Gap(8.h),
          ],
        ),
      ),
    );
  }
}
