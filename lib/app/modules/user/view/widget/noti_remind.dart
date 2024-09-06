import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';

class NotificationAndRemind extends StatefulWidget {
  NotificationAndRemind({super.key});

  @override
  State<NotificationAndRemind> createState() => _NotificationAndRemindState();
}

class _NotificationAndRemindState extends State<NotificationAndRemind> {
  S get appLocalization => S.of(Get.context!);

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.text_white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appLocalization.note,
            style: Theme.of(context).BodyText2Bold,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thông báo & Nhắc nhở',
                  style: Theme.of(context)
                      .BodyText1
                      .copyWith(color: AppColors.neutral),
                ),
                10.verticalSpace,
                Text(
                  'Cập nhật về giá giảm. mục dạo và các chương trình khác trên ứng dụng',
                  style: Theme.of(context)
                      .BodyText1
                      .copyWith(color: AppColors.textColorGrey),
                ),
              ],
            ),
            trailing: Switch(
              value: status,
              onChanged: (value) {
                AppSnackBar.failure();
                setState(() {
                  status = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
