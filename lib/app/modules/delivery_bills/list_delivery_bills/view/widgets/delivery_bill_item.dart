import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../../data/model/model/delivery_bill.dart';
import 'status_widget.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../core/utils/converter_utils.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';

class DeliveryBillItem extends StatelessWidget {
  final DeliveryBill? delivery;
  final VoidCallback? onTap;

  const DeliveryBillItem({super.key, required this.delivery, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.borderPXK),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: delivery?.code ?? ''));
                        AppSnackBar.showSuccess(message: 'Đã sao chép!');
                      },
                      child: Assets.icons.icBillPXK.svg()),
                  Gap(10.w),
                  Expanded(
                    child: Text(
                      delivery?.code ?? '',
                      style: Theme.of(context).BodyText2Bold.copyWith(color: AppColors.neutrals08, height: 1),
                      maxLines: 1,
                    ),
                  ),
                  if (delivery?.deliveryBillStatus != null)
                    ChipStatus(
                        color: delivery!.deliveryBillStatus!.color, label: delivery!.deliveryBillStatus?.value ?? ''),
                ],
              ),
              Gap(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TLTT/TLKT (kg)',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.right,
                      '${delivery?.totalTrackingCalculationWeight?.toStringAsFixed(2) ?? 0}/${delivery?.totalTrackingMiningWeight?.toStringAsFixed(2) ?? 0}',
                      style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Số tracking',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                  ),
                  Text(delivery?.trackings?.length.toString() ?? '',
                      style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng tiền',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                  ),
                  Text('${formatNumberCommas(delivery?.trackingTotalMoney.toString())} đ',
                      style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thời gian',
                    style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
                  ),
                  Text(formatDateTimeExportOrder(delivery?.createdAt),
                      style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
