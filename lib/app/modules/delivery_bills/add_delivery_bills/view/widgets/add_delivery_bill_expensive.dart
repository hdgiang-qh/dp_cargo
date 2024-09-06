import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/converter_utils.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../controller/add_delivery_bill_controller.dart';
import '../../model/bill_delivery_expensive.dart';

class BillDeliveryExpenseSummary extends StatelessWidget {
  final AddDeliveryBillController controller = Get.find();

  BillDeliveryExpenseSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
                Text('${formatNumberCommas(controller.deliveryBillExpensive.value.trackingOtherFee.toString())} đ',
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
                Text('${formatNumberCommas(controller.deliveryBillExpensive.value.trackingSurcharge.toString())} đ',
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
                Text('${formatNumberCommas(controller.deliveryBillExpensive.value.trackingShippingFee.toString())} đ',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
            // Gap(4.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Tổng số tiền (viết bằng chữ):',
            //       style: Theme.of(context).neutralTextTile,
            //     ),
            //     Text('${formatNumberCommas(controller.deliveryBillExpensive.value.trackingTotalMoney.toString())} đ',
            //         style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
            //   ],
            // ),
            Gap(4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng số tiền :',
                  style: Theme.of(context).neutralTextTile,
                ),
                Text('${formatNumberCommas(controller.deliveryBillExpensive.value.trackingTotalMoney.toString())} đ',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
              ],
            ),
            Gap(10.h),
          ],
        ),
      ),
    );
  }
}
