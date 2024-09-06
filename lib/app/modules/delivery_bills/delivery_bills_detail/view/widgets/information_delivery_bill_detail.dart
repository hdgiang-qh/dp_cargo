import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../core/enum/delivery_bill_status.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../list_delivery_bills/view/widgets/status_widget.dart';

class InformationDeliveryBillDetail extends StatelessWidget {
  final String label;
  final String data;  
  final bool isAddress;
  final DeliveryStatus? deliveryStatus;

  const InformationDeliveryBillDetail({
    required this.label, 
    required this.data,     
    this.isAddress = false, 
    this.deliveryStatus});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutral06),
        ),
        Gap(20.w),        
        deliveryStatus != null ? Expanded(
          flex: deliveryStatus?.value != DeliveryStatus.uncompleted.value ? 0 : 1 ,
          child: ChipStatus(
            label: deliveryStatus?.value ?? S.current.isNull,
            color: deliveryStatus?.color ?? AppColors.aZShopPrimary,
            width: null,
          ),
        )
        :
        Expanded(
          child: Text(
            data,
            textDirection: TextDirection.ltr,
            textAlign: isAddress ? TextAlign.start : TextAlign.end,
            style: Theme.of(context).BodyText2Bold.copyWith(color: AppColors.neutrals08),
          ),
        ),        
      ],
    );
  }
}

