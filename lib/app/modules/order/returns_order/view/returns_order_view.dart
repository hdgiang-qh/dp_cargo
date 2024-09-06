import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widget/appbar/custom_appbar.dart';
import '../../../../core/widget/elevate_button.dart';
import '../../../home/view/widgets/head_page.dart';
import '../../../main/controllers/main_controller.dart';
import '../../../main/model/menu_code.dart';
import '../../../user/controller/user_controller.dart';
import '../controller/returns_order_controller.dart';

class ReturnsOrderView extends BaseView<ReturnsOrderController> {
  @override
  Widget body(BuildContext context) {
    final UserController userController = UserController();
    return Scaffold(
      appBar: const AppbarCustom(height: 0,),
      body: SafeArea(
        child: Column(
          children: [
            const HeadPage(),
            Gap(16.h),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.icBox.svg(),
                  Gap(16.h),
                  Text(
                    appLocalization.returns_order_success,
                    style: Theme.of(context).neutralTextTile,
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Chi tiết xin liên hệ: ",
                        style: Theme.of(context).BodyText1Neutrals500,
                      ),
                      Text(
                        userController.userInfo.value?.phone ?? '',
                        style: Theme.of(context).TitleStyle.copyWith(color: AppColors.primary),
                      )
                    ],
                  ),
                  Gap(16.h),
                  RedButton(
                    onTap: (){
                      final mainController = Get.find<MainController>();
                      mainController.onMenuSelected(MenuCode.HOME);
                    },
                    text: appLocalization.homepage,
                    width: 150,
                    height: 40,
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}