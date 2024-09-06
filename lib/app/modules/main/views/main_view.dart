import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/order/list_orders/view/list_orders_view.dart';
import 'package:vncss/app/modules/report/view/report_scr.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/values/app_colors.dart';
import '../../../data/service/auth_service.dart';
import '../../../data/service/common_service.dart';
import '../../../routes/app_pages.dart';
import '../../common_widget/dialog_widget.dart';
import '../../delivery_bills/list_delivery_bills/view/list_complete_delivery_view.dart';
import '../../delivery_bills/list_delivery_bills/view/list_delivery_bill_view.dart';
import '../../home/view/home_screen.dart';
import '../../home/view/home_view.dart';
import '../../hotline/hotline_src.dart';
import '../../search/view/search_screen.dart';
import '../../user/view/user_view.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import 'bottom_nav_bar.dart';
import 'package:collection/collection.dart';

// ignore: must_be_immutable
class MainView extends BaseView<MainController> {
  final AuthService authService = Get.find();

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  List<PersistentTabItem> get items => [
        PersistentTabItem(
            key: 0,
            tab: authService.userInfo.value?.role?.id == 1 ||
                    authService.userInfo.value?.role?.id == 7
                ? home2
                : home),
        PersistentTabItem(
            tab: authService.userInfo.value?.role?.id == 1||
                authService.userInfo.value?.role?.id == 7
                ? order
                : listDeliveryBill,
            key: 1),
       // PersistentTabItem(tab: qrSearch, key: 2),
        PersistentTabItem(
            tab: authService.userInfo.value?.role?.id == 1 ||
                authService.userInfo.value?.role?.id == 7? report : returns,
            key: 2),
        PersistentTabItem(tab: user, key: 3),
      ];

  @override
  Widget body(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
              context: context,
              builder: (context) => CustomDialog(
                    title: "Bạn muốn thoát ứng dụng?",
                    onTapYes: () => SystemNavigator.pop()
                        .then((value) => Get.find<AuthService>().signOut()),
                    onTapNo: () => Get.back(),
                  ))) ??
          false;
    }

    return Obx(
      () => WillPopScope(
        onWillPop: _onWillPop,
        child: IndexedStack(
          index: MenuCode.values.indexOf(controller.selectedMenuCode),
          children: items.mapIndexed((index, page) {
            return Navigator(
              key: Get.nestedKey(page.key),
              onGenerateRoute: (settings) {
                return null;
              },
              onGenerateInitialRoutes: (navigator, initialRoute) {
                return [
                  MaterialPageRoute(builder: (context) => page.tab),
                ];
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(items: items);
  }

  @override
  Widget? floatingActionButton() {
    return authService.userInfo.value?.role?.id == 1||
        authService.userInfo.value?.role?.id == 7
        ? null
        : FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.QR_SCREEN);
            },
            tooltip: 'Barcode',
            elevation: 2.0,
            backgroundColor: AppColors.primary,
            child: SvgPicture.asset(Assets.icons.icBarcode.path));
  }

  final config = Get.find<CommonApi>().configData.value;

  final home = HomeView();
  final listDeliveryBill = ListDeliveryDestroyBillsView();
  final receive = Container();
  final qrSearch = Container();

  // final returns = ReturnsOrderView();
  final report = const ReportScr();
  final returns = ListDeliveryBillsView();
  final user = UserView();
  final home2 = HomeScreen();
  final hotline = const HotlineScr();
  final order = ListOrder(
    index: 0,
  );

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return home;
      case MenuCode.DELIVERY_BILL:
        return listDeliveryBill;
      case MenuCode.RETURN:
        return returns;
      case MenuCode.ACCOUNT:
        return user;
    }
  }
}

class PersistentTabItem {
  final Widget tab;
  final int key;

  PersistentTabItem({required this.tab, required this.key});
}
