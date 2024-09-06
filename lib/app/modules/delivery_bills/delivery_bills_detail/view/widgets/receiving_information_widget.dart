import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../data/model/model/delivery_bill_detail.dart';
import 'information_delivery_bill_detail.dart';

class ReceivingInformation extends StatelessWidget {
  final DeliveryBillDetail deliveryBillDetail;

  const ReceivingInformation({super.key, required this.deliveryBillDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InformationDeliveryBillDetail(label: "Người nhận", data: deliveryBillDetail.name ?? S.current.isNull),
            Gap(8.h),
            InformationDeliveryBillDetail(label: "Email", data: deliveryBillDetail.email ?? S.current.isNull),
            Gap(8.h),
            InformationDeliveryBillDetail(label: "Địa chỉ", data: deliveryBillDetail.customerAddress ?? S.current.isNull, isAddress: true,),
            Gap(8.h),
            InformationDeliveryBillDetail(label: "Số điện thoại", data: deliveryBillDetail.customerPhone ?? S.current.isNull),
            Gap(8.h),
            const InformationDeliveryBillDetail(label: 'Ghi chú', data: ''),
            Gap(8.h),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.neutralDivider)
              ),
              child: Text(
                deliveryBillDetail.note ?? S.current.isNull,
                style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
              ),
            )
          ],
        ),
      ),
    );
  }
}
