import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../../data/model/model/customer.dart';

class CustomerInformation extends StatelessWidget {
  final Customer? customer;

  const CustomerInformation({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Họ và tên',
                style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
              ),
              Expanded(
                  child:
                      Text(textAlign: TextAlign.right, customer?.name ?? '', style: Theme.of(context).neutralTextTile)),
            ],
          ),
          Gap(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
              ),
              Expanded(
                  child: Text(
                      textAlign: TextAlign.right, customer?.email ?? '', style: Theme.of(context).neutralTextTile)),
            ],
          ),
          Gap(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Số điện thoại',
                style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals06),
              ),
              Expanded(
                  child: Text(
                      textAlign: TextAlign.right, customer?.phone ?? '', style: Theme.of(context).neutralTextTile)),
            ],
          ),
          Gap(12.h),
        ],
      ),
    );
  }
}
