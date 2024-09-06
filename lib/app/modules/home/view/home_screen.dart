import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/report/controller/report_controller.dart';

import '../../../core/base/base_view.dart';
import '../../../data/model/model/warehouse.dart';
import '../../common_widget/textfield_widget.dart';
import '../../main/controllers/main_controller.dart';
import 'widgets/item_button_home.dart';

class HomeScreen extends BaseView<MainController> {
  final controllerReport = Get.find<ReportController>();

  Widget buildWarehouse() {
    return CustomDialogShipper(
      title: "Cập nhật kho",
      textYes: "Xác nhận",
      onTapYes: () {
        if (controllerReport.wh.text == "Tất cả") {
          controllerReport.wh.clear();
          controllerReport.nameWh.value = null;
          controller.warehouseId = controller.sss;
          Get.back();
        } else {
          controllerReport.nameWh.value = controllerReport.wh.text.toString();
          controller.warehouseId = controller.sss;
          Get.back();
        }
      },
      textNo: "Đóng",
      onTapNo: () => Get.back(),
      widget: TypeAheadField<WareHouse>(
        controller: controllerReport.wh,
        suggestionsCallback: (pattern) {
          return controllerReport.listWareHouse.toList();
        },
        builder: (context, controllers, focusNode) {
          return AppTextInputField(
            controller: controllers,
            focusNode: focusNode,
            hint: "Chọn kho",
          );
        },
        itemBuilder: (context, suggestion) {
          return ListTile(title: Text(suggestion.name ?? ''));
        },
        onSelected: (suggestion) {
          controllerReport.wh.text = suggestion.name.toString();
          controller.sss = suggestion.id!;
        },
        loadingBuilder: (context) => const Text('Loading...'),
        errorBuilder: (context, error) => const Text('Error!'),
        emptyBuilder: (context) =>
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Không có dữ liệu phù hợp')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/img.png"),
                    alignment: Alignment.bottomCenter,
                    scale: 1.7)),
            child: (Column(children: [
              Gap(10.h),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/image/logo.svg"),
                    controller.listWh.isNotEmpty
                        ? Container()
                        : GestureDetector(
                      onTap: () {
                        Get.dialog(buildWarehouse());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: const Color(0xffc4c4c4)),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(4))),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/image/note.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            Obx(() {
                              return Text(
                                controllerReport.nameWh.value ?? "Chọn kho",
                                style: const TextStyle(
                                    fontSize: 13, color: Color(0xff7f7f7f)),
                              );
                            })
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
              Gap(10.h),
              Expanded(
                  child: CustomScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      slivers: [
                        SliverGrid(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 1),
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return ItemButtonHome(
                                icon: ItemHome[index]["icon"],
                                tittle: ItemHome[index]["tittle"],
                                func: ItemHome[index]["func"],
                              );
                            },
                            childCount: ItemHome.length,
                          ),
                        ),
                      ]))
            ]))),
      ),
    );
  }
}
