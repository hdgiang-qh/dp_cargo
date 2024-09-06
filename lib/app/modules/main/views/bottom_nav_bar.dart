import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/base/base_widget_mixin.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../search/controller/search_tracking_controller.dart';
import '../controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import 'main_view.dart';

typedef OnBottomNavItemSelected = Function(MenuCode menuCode);

class BottomNavBar extends GetView<MainController> with BaseWidgetMixin {
  final List<PersistentTabItem> items;
  final SearchTrackingController _searchTrackingController = Get.put(SearchTrackingController());

  BottomNavBar({super.key, required this.items});

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: List.generate(
                MenuCode.values.length,
                (index) => Expanded(
                  child: Container(
                    height: 1,
                    color:
                        MenuCode.values.indexOf(controller.selectedMenuCode) ==
                                    index &&
                                MenuCode.values
                                        .indexOf(controller.selectedMenuCode) !=
                                    2
                            ? AppColors.primary
                            : AppColors.text_white,
                  ),
                ),
              ),
            ),
            BottomNavigationBar(
              currentIndex:
                  MenuCode.values.indexOf(controller.selectedMenuCode),
              type: BottomNavigationBarType.fixed,
              iconSize: 20,
              unselectedItemColor: AppColors.iconBarColor,
              selectedFontSize: 10,
              showUnselectedLabels: true,
              unselectedLabelStyle: Theme.of(context).labelNavBarStyle,
              selectedItemColor: AppColors.primary,
              elevation: 8.0,
              onTap: (index) {
                if (controller.selectedMenuCode == MenuCode.values[index]) {
                  Get.until((route) => route.isFirst, id: items[index].key);
                }
                controller.onMenuSelected(MenuCode.values[index]);
                // if(index == 2){
                //   _searchTrackingController.onClear();
                // }
                // if(index == 3){
                //   controller.phone();
                // } else if(index != 3 && index != 2){
                //   controller.onMenuSelected(MenuCode.values[index]);
                // } else if (controller.selectedMenuCode == MenuCode.values[index]) {
                //     Get.until((route) => route.isFirst, id: items[index].key);
                // }
              },
              backgroundColor: AppColors.text_white,
              items: List<BottomNavigationBarItem>.generate(
                MenuCode.values.length,
                (index) {
                  return MenuCode.values[index]
                      .toBottomNavItem(appLocalization);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class Style extends StyleHook {
  @override
  double get activeIconMargin => 0;

  @override
  double get activeIconSize => 55.h;

  @override
  double? get iconSize => 24.r;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(
        color: color,
        fontSize: 11.5.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        letterSpacing: 0);
  }
}
