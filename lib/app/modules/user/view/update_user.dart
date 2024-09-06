import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../../core/enum/sex.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import '../../../core/widget/avatar.dart';
import '../../../core/widget/component/date_picker_row.dart';
import '../../../core/widget/component/gender_widget.dart';
import '../../../core/widget/textfields/app_text_field.dart';
import '../../../data/model/response/user.dart';
import '../../../data/service/auth_service.dart';
import '../controller/user_controller.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final AuthService authService = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Sex? gender;
  DateTime? birthDay;

  UserInfo? get user => authService.userInfo.value;

  @override
  void initState() {
    nameController.text = user?.fullname ?? '';
    emailController.text = user?.email ?? '';
    gender = user?.customer?.gender;
    birthDay = user?.customer?.birthday;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: S.current.update_user,
      ),
      body: Obx(() {
        return SingleChildScrollView(
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
                        onChanged: (file) {
                          final UserController controller = Get.find();
                          controller.uploadAvatar(file: file);
                        },
                      ),
                    ),
                    const Divider(
                      color: AppColors.neutral04,
                      thickness: 1,
                      height: 40,
                    ),
                    AppTextFieldWidget(
                      label: S.of(context).full_name,
                      inputController: nameController,
                    ),
                    Gap(16.h),
                    AppTextFieldWidget(
                      label: S.of(context).email,
                      inputController: emailController,
                    ),
                    Gap(16.h),
                    DatePickerRow(
                      initDateTime: birthDay,
                      onChanged: (DateTime value) {
                        birthDay = value;
                      },
                    ),
                    Gap(16.h),
                    GenderWidget(
                      initSex: gender,
                      onChanged: (Sex value) {
                        gender = value;
                      },
                    ),
                    Gap(30.h),
                    SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.find<UserController>().updateUser(
                                  fullname: nameController.text,
                                  email: emailController.text,
                                  gender: gender?.name,
                                  birthday: birthDay);
                            },
                            child: Text(S.current.update_user)))
                  ],
                ),
              )
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
