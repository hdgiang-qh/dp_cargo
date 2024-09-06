import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_text_styles.dart';
import '../../../../core/widget/appbar/custom_appbar.dart';
import '../../../../core/widget/elevate_button.dart';

import '../../../home/view/widgets/head_page.dart';
import '../../../main/controllers/main_controller.dart';
import '../../../main/model/menu_code.dart';
import '../controller/receive_order_controller.dart';

class ReceiveOrderView extends BaseView<ReceiveOrderController> {
  @override
  Widget body(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustom(
        height: 0,
      ),
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
                  appLocalization.receive_order_success,
                  style: Theme.of(context).neutralTextTile,
                ),
                Gap(16.h),
                RedButton(
                  onTap: () {
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
      )),
    );
  }
}
