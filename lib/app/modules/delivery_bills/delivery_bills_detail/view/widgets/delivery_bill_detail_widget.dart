import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../data/model/model/delivery_bill_detail.dart';
import 'information_delivery_bill_detail.dart';

class DeliveryBillDetailWidget extends StatelessWidget {
  final DeliveryBillDetail deliveryBill;

  const DeliveryBillDetailWidget({super.key, required this.deliveryBill});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InformationDeliveryBillDetail(
              label: "Trạng thái",
              data: '',
              deliveryStatus: deliveryBill.deliveryBillStatus,
            ),
            Gap(8.h),
            InformationDeliveryBillDetail(
                label: "Mã PXK", data: deliveryBill.code ?? S.current.isNull),
            Gap(8.h),
            InformationDeliveryBillDetail(
                label: "Số Tracking",
                data: deliveryBill.trackings?.length.toString() ??
                    S.current.isNull),
            Gap(8.h),
            InformationDeliveryBillDetail(
                label: "Số cân",
                data:
                    '${double.parse(deliveryBill.totalTrackingCalculationWeight?.toStringAsFixed(3) ?? '0.0').toString()}kg'),
          ],
        ),
      ),
    );
  }
}
