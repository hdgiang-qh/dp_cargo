import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widget/info_user_item.dart';
import 'widget/noti_remind.dart';
import 'widget/selected_heading.dart';
import '../../../../generated/l10n.dart';
import '../../../data/service/auth_service.dart';
import '../../../data/service/common_service.dart';
import 'update_user.dart';
import 'user_info.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../webview/webview_page.dart';

class UserView extends StatelessWidget {
  UserView({super.key});
  Color? get backgroundColor => AppColors.pageBackground;
  bool isCheck = false;
  S get appLocalization => S.of(Get.context!);

  @override
  Widget build(BuildContext context) {
    final config = Get.find<CommonApi>().configData.value;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoUserItem(),
          16.verticalSpace,
          Container(
            color: AppColors.text_white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appLocalization.account,
                  style: Theme.of(context).BodyText2Bold,
                ),
                10.verticalSpace,
                SelectedHeading(
                  text: appLocalization.update_user,
                  leading:
                      Assets.icons.userCircle.svg(height: 32.r, width: 32.r),
                  onTap: () => Get.to(const UpdateUserPage()),
                ),
                SelectedHeading(
                  text: appLocalization.detail_user_info,
                  leading:
                      Assets.icons.userCircle.svg(height: 32.r, width: 32.r),
                  onTap: () => Get.to(const UserInfoPage()),
                ),
                SelectedHeading(
                  text: appLocalization.change_pass,
                  leading:
                      Assets.icons.lockCircle.svg(height: 32.r, width: 32.r),
                  onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Container(
            color: AppColors.text_white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appLocalization.policy_support,
                  style: Theme.of(context).BodyText2Bold,
                ),
                10.verticalSpace,
                SelectedHeading(
                  textSpan: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: appLocalization.service_24_7,
                        style: Theme.of(context)
                            .BodyText1
                            .copyWith(color: AppColors.neutral)),
                    TextSpan(
                        text: " Gọi ngay",
                        style: Theme.of(context)
                            .BodyText1
                            .copyWith(color: AppColors.bluePrimary)),
                  ])),
                  leading:
                      Assets.icons.icSupport.svg(height: 32.r, width: 32.r),
                  onTap: () async {
                    await CommonApi.phone(config.configValue!.config!.first.phoneNumber!.replaceAll(".", "").toString());
                  },
                ),
                SelectedHeading(
                  text: appLocalization.about_app,
                  leading: Assets.icons.icSheld.svg(height: 32.r, width: 32.r),
                  onTap: () {
                    Get.to(WebViewPage(
                      title: appLocalization.about_app,
                      url:
                          'https://dp-cargo.com/gioi-thieu',
                    ));
                  },
                ),
                SelectedHeading(
                  text: appLocalization.rules_policy,
                  leading: Assets.icons.icSheld.svg(height: 32.r, width: 32.r),
                  onTap: () {
                    Get.to(WebViewPage(
                      title: appLocalization.rules_policy,
                      url:
                          'https://dp-cargo.com/dieu-khoan-chinh-sach',
                    ));
                  },
                ),
                SelectedHeading(
                  text: appLocalization.share_app,
                  leading: Assets.icons.icShare.svg(height: 32.r, width: 32.r),
                ),
                SelectedHeading(
                  text: appLocalization.logout,
                  leading: Assets.icons.icLockOut
                      .svg(height: 32.r, width: 32.r),
                  onTap: () {
                    Get.find<AuthService>().signOut();
                    Get.offAllNamed(Routes.AUTHENTICATION);
                  },
                ),
              ],
            ),
          ),
          16.verticalSpace,
          NotificationAndRemind(),
          48.verticalSpace,
        ],
      ),
    );
  }
}
