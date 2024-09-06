import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vncss/app/core/enum/delivery_bill_status.dart';
import 'package:vncss/app/core/values/app_colors.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/delivery_bills/list_delivery_bills/view/widgets/status_widget.dart';
import 'package:vncss/generated/l10n.dart';


class InfoDeliveryBillAdmin extends StatelessWidget {
  final String label;
  final String data;
  final SvgPicture? icon;
  final bool isAddress;
  final bool isCode;
  final DeliveryStatus? status;

  const InfoDeliveryBillAdmin(
      {required this.label,
      required this.data,
      this.icon,
      this.isAddress = false,
      this.isCode = false,
      this.status});

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
                  // width: isCode ? 140 : null,
                  child: Text(
                    isCode ? label.toUpperCase() : label,
                    overflow: isCode ? TextOverflow.ellipsis : null,
                    maxLines: 2,
                    style: !isCode
                        ? const TextStyle(color: ColorApp.grey74, fontSize: 12)
                        : const TextStyle(
                            color: textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
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
                      style: const TextStyle(fontSize: 13),
                    ),
                  )
                : Expanded(
                  child: ChipStatus(
                      label: status?.value ?? S.current.isNull,
                      color: status?.color ?? AppColors.aZShopPrimary,
                      width: null,
                    ),
                ),
            //  Gap(10.h),
          ],
        ),
      ],
    );
  }
}
