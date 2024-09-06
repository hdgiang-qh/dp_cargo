import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vncss/app/modules/common_widget/const.dart';


import '../../../../../../generated/l10n.dart';
import '../../../../../core/enum/delivery_bill_status.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../list_delivery_bills/view/widgets/status_widget.dart';

class InfoDeliveryBillWidget extends StatelessWidget {
  final String label;
  final String data;
  final SvgPicture? icon;
  final bool isAddress;
  final bool isCode;
  final DeliveryStatus? status;

  const InfoDeliveryBillWidget(
      {
        required this.label,
        required this.data,
        this.icon,
        this.isAddress = false,
        this.isCode = false,
        this.status
      }
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon ?? Container(),
                icon != null ? Gap(12.w) : Gap(0.w),
                SizedBox(
                 width: isCode ? 140 : null,
                  child: Text(
                    isCode ? label.toUpperCase() : label,
                    overflow: isCode ? TextOverflow.ellipsis : null,
                    style: !isCode
                        ? const TextStyle(color: ColorApp.grey74,fontSize: 14)
                        : Theme.of(context).BodyText2Bold,
                  ),
                )
              ],
            ),
            Gap(12.w),
            status == null
                ? Expanded(
              child: Text(
                data,
                textDirection: TextDirection.ltr,
                textAlign: isAddress ? TextAlign.start : TextAlign.end,
                style:const TextStyle(fontSize: 12),
              ),
            )
                : ChipStatus(
                  label: status?.value ?? S.current.isNull,
                  color: status?.color ?? AppColors.aZShopPrimary,
                  width: null,
                ) ,
          //  Gap(10.h),
          ],
        ),
        Gap(8.h)
      ],
    );
  }
}