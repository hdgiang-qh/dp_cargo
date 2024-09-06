import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../core/enum/sex.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/drop_down/app_dropdown.dart';
import '../../../core/widget/textfields/app_text_field.dart';
import '../../../data/service/auth_service.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final authService = Get.find<AuthService>();

  final idController = TextEditingController();
  final fullNameController = TextEditingController();
  final birthDayController = TextEditingController();
  final emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    Logger().d(authService.userInfo.value?.toJson());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.margin_20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Text(
              S.of(context).user_info,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const Gap(24),
            Center(
                child: Assets.icons.logo.svg(
              height: 100,
              width: 100,
            )),
            const Gap(24),
            AppTextFieldWidget(
              label: S.of(context).account_id,
              inputController: idController,
              readOnly: true,
            ),
            const Gap(16),
            AppTextFieldWidget(
              label: S.of(context).full_name,
              inputController: fullNameController,
              readOnly: true,
            ),
            const Gap(16),
            AppTextFieldWidget(
              label: S.of(context).birth_day,
              inputController: birthDayController,
              readOnly: true,
            ),
            const Gap(16),
            Obx(() {
              return AppDropDownWidget<Sex>(
                  label: S.of(context).sex,
                  items: List<DropdownMenuItem<Sex>>.generate(
                      Sex.values.length,
                      (index) => DropdownMenuItem(
                            value: Sex.values[index],
                            child: Text(Sex.values[index].title(context)),
                          )));
            }),
            const Gap(16),
            AppTextFieldWidget(
              label: S.of(context).email,
              inputController: emailController,
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
