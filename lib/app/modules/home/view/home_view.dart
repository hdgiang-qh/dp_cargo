import 'package:flutter/material.dart';
import '../../../core/widget/appbar/custom_appbar.dart';
import 'widgets/body_page.dart';
import 'widgets/head_page.dart';
import '../../../core/base/base_view.dart';
import '../controller/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  @override
  Brightness? get statusBarIconBrightness => Brightness.dark;

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const AppbarCustom(height: 0);
  }

  DateTimeRange? dateTimeRange;

  @override
  Widget body(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeadPage(),
          BodyPage(),
        ]),
      ),
    );
  }
}
