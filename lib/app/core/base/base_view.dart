import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../generated/l10n.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/model/page_state.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/widget/loading.dart';
import '/flavors/build_config.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  S get appLocalization => S.of(Get.context!);

  final Logger logger = BuildConfig.instance.config.logger;

  TextTheme get textTheme => Get.textTheme;

  Size get size => MediaQuery.sizeOf(Get.context!);

  Widget body(BuildContext context) {
    return Center(child: Text(toString()));
  }

  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (buildBodyMain(context) != null) {
      return Stack(
        children: [
          buildBodyMain(context)!,
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading()
              : const SizedBox()),
        ],
      );
    }
    return Stack(
      children: [
        annotatedRegion(context),
        Obx(() => controller.pageState == PageState.LOADING
            ? _showLoading()
            : const SizedBox()),
      ],
    );
  }

  Widget? buildBodyMain(BuildContext context) => null;

  Brightness? get statusBarIconBrightness => null;

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarBrightness: statusBarIconBrightness,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
      ),
      child: pageScaffold(context),
    );
  }

  Color? get backgroundColor => null;

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      key: globalKey,
      backgroundColor: backgroundColor,
      appBar: appBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
      endDrawer: endDrawer(),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      top: false,
      child: body(context),
    );
  }

  Widget showErrorSnackBar(String message) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            controller.onInit();
          },
          child: const Text('Try again')),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);
  }

  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  Color statusBarColor() {
    return AppColors.primary;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget? endDrawer() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }
}
