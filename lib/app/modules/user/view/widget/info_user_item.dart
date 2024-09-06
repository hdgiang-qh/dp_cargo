import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widget/avatar.dart';
import '../../../../data/service/auth_service.dart';
import '../../controller/user_controller.dart';

class InfoUserItem extends BaseView<UserController> {
  final AuthService authService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 50.h, bottom: 16.h, left: 32.w, right: 32.w),
      decoration: const BoxDecoration(color: AppColors.circleBackground2),
      child: Row(
        children: [
          Obx(() {
            final user = authService.userInfo.value;
            return AvatarWidget(
              url: user?.avatarUrl,
            );
          }),
          SizedBox(width: 16.w), // Thay vì sử dụng 16.horizontalSpace
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.userInfo.value?.fullname ?? '--',
                  style: Theme.of(context)
                      .heading3
                      .copyWith(color: AppColors.appBarIconColor),
                ),
                SizedBox(height: 10.h), // Thay vì sử dụng 10.verticalSpace
                // Text(
                //   controller.userInfo.value!.warehouseVN.toString().isNotEmpty ? 'Kho đang cập nhật' : controller.userInfo.value!.warehouseVN.toString(),
                //   style: Theme.of(context).BodyText1.copyWith(color: AppColors.appBarIconColor),
                // ),
                Text(
                  controller.userInfo.value?.role?.name ?? '--',
                  style: Theme.of(context)
                      .BodyText1
                      .copyWith(color: AppColors.appBarIconColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
