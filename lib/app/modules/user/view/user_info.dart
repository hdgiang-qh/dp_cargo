import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';



import '../../../../generated/l10n.dart';
import '../../../core/enum/sex.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/avatar.dart';
import '../../../data/service/auth_service.dart';
import '../../../routes/app_pages.dart';
import 'update_user.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final AuthService authService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppbarCustom(
        title: S.of(context).user_info,
      ),
      body: Obx(() {
        final user = authService.userInfo.value;
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(16.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: AvatarWidget(
                                url: user?.avatarUrl,
                              ),
                            ),
                            const Divider(
                              color: AppColors.neutral04,
                              thickness: 1,
                              height: 40,
                            ),
                            columnTitle(S.of(context).account, user?.fullname ?? 'Chưa cập nhật'),
                            Gap(16.h),
                            columnTitle(S.of(context).phone_number, user?.phone ?? 'Chưa cập nhật'),
                            Gap(16.h),
                            columnTitle(S.of(context).birth_day,
                                user?.customer?.birthday?.toDateAPIString() ?? 'Chưa cập nhật'),
                            Gap(16.h),
                            columnTitle(S.of(context).sex, user?.customer?.gender?.title(context) ?? 'Chưa cập nhật'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              Get.toNamed(Routes.CHANGE_PASSWORD);
                            },
                            child: Text(S.of(context).change_pass))),
                    Gap(16.w),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(const UpdateUserPage());
                            },
                            child: const Text('Cập nhật')))
                  ],
                ),
              ),
              Gap(16.h),
            ],
          ),
        );
      }),
    );
  }

  Widget columnTitle(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutral06),
        ),
        Gap(16.h),
        Text(
          value,
          style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
        ),
      ],
    );
  }
}
