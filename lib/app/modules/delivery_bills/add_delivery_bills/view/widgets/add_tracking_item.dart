import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../core/widget/check_box.dart';
import '../../../../../data/model/model/tracking_bill.dart';

class AddBillTrackingItem extends StatelessWidget {
  final TrackingsBill trackingBill;
  final bool isSelect;
  final ValueChanged<bool> onChanged;

  const AddBillTrackingItem({super.key, required this.trackingBill, required this.isSelect, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(isSelect);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primary),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCheckBox(value: isSelect, onChanged: onChanged),
                Gap(8.w),
                Expanded(
                  child: Text(
                    trackingBill.code.toString(),
                    style: Theme.of(context).BodyText2Bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TLTT/TLKT',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                ),
                Text(
                  '${trackingBill.trackingCalculationWeight}/${trackingBill.trackingMiningWeight} kg',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
