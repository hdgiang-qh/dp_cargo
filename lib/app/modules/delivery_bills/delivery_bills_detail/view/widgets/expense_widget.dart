import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/converter_utils.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../add_delivery_bills/model/bill_delivery_expensive.dart';

class ExpenseSummary extends StatelessWidget {
  final BillDeliveryExpensive? deliveryBillExpensive;

  const ExpenseSummary({super.key, required this.deliveryBillExpensive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '(1) Phí DV',
                style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
              ),
              Text('${formatNumberCommas(deliveryBillExpensive?.trackingOtherFee.toString())} đ',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
            ],
          ),
          Gap(4.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '(2) Phụ thu',
                style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
              ),
              Text('${formatNumberCommas(deliveryBillExpensive?.trackingSurcharge.toString())} đ',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
            ],
          ),
          Gap(4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '(3) Phí ship',
                style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
              ),
              Text('${formatNumberCommas(deliveryBillExpensive?.trackingShippingFee.toString())} đ',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
            ],
          ),
          Gap(4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tổng số tiền (viết bằng chữ):',
                style: Theme.of(context).neutralTextTile,
              ),
              Text('${formatNumberCommas(deliveryBillExpensive?.trackingTotalMoney.toString())} đ', style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
            ],
          ),
          Gap(4.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tổng số tiền (viết bằng số):',
                style: Theme.of(context).neutralTextTile,
              ),
              Text('${formatNumberCommas(deliveryBillExpensive?.trackingTotalMoney.toString())} đ',
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
            ],
          ),
          Gap(10.h),
        ],
      ),
    );
  }
}
