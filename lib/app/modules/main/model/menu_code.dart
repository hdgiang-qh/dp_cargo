import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vncss/app/data/service/auth_service.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../core/values/app_colors.dart';

enum MenuCode { HOME, DELIVERY_BILL, RETURN, ACCOUNT }

final AuthService authService = Get.find();

extension MenuCodeExtensions on MenuCode {
  BottomNavigationBarItem toBottomNavItem(S appLocalization) {
    switch (this) {
      case MenuCode.HOME:
        return BottomNavigationBarItem(
          label: authService.userInfo.value?.role?.id == 1
              ? appLocalization.home
              : "Chờ nhận",
          icon: authService.userInfo.value?.role?.id == 1
              ? Assets.icons.icHouseFloor.svg(

                  height: 30.h)
              : Assets.icons.icNavWaiting.svg(
                  height: 30.h,
                ),
          activeIcon: authService.userInfo.value?.role?.id == 1
              ? Assets.icons.icHouseFill.svg(
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                  height: 30.h)
              : Assets.icons.icNavWaitingFill.svg(
                  height: 30.h,
                ),
        );
      case MenuCode.DELIVERY_BILL:
        return BottomNavigationBarItem(
          icon: authService.userInfo.value?.role?.id == 1
              ? Assets.icons.list.svg(
                  height: 30.h,
                )
              : Assets.icons.delivering.svg(
                  height: 30.h,
                ),
          label: authService.userInfo.value?.role?.id == 1
              ? appLocalization.orderList
              : "Đang giao",
          activeIcon: authService.userInfo.value?.role?.id == 1
              ? Assets.icons.list.svg(height: 30.h, color: AppColors.primary)
              : Assets.icons.deliveringFill.svg(
                  height: 30.h,
                ),
        );
      case MenuCode.RETURN:
        return BottomNavigationBarItem(
          icon: authService.userInfo.value?.role?.id == 1
              ? Assets.icons.chart.svg(
                  height: 30.h,
                )
              : Assets.icons.icOrderDelivered.svg(
                  height: 30.h,
                ),
          label: authService.userInfo.value?.role?.id == 1
              ? "Báo cáo"
              : "Hoàn thành",
          activeIcon: authService.userInfo.value?.role?.id == 1
              ? Assets.icons.chart.svg(height: 30.h, color: AppColors.primary)
              : Assets.icons.icDeliveredFill.svg(
                  height: 30.h,
                ),
        );
      case MenuCode.ACCOUNT:
        return BottomNavigationBarItem(
          icon: authService.userInfo.value?.role?.id == 1
              ? Assets.icons.icAccount.svg(height: 30.h)
              : Assets.icons.icAccount.svg(height: 30.h),
          label: appLocalization.account,
          activeIcon: authService.userInfo.value?.role?.id == 1
              ? Assets.icons.icAccount
                  .svg(height: 30.h, color: AppColors.primary)
              : Assets.icons.icAccount.svg(
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                  height: 30.h),
        );
    }
  }
}
