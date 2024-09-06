import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/common_widget/app_bar_widget.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_interface_controller.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_price_controller.dart';

import '../../../core/base/base_view.dart';
import '../../common_widget/const.dart';
import '../../delivery_bills/delivery/delivery_detail/view/widget/item_detail.dart';

class AddConfigurationPrice extends BaseView<ConfigurationPriceController> {
  final controllerInter = Get.find<ConfigurationInterfaceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              title: "Thêm bảng giá",
              onBack: () => Get.back(),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      color: Colors.white,
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: ItemTracking(
                              title: "Bảng giá:",
                              codeTracking: true,
                              svgPath: 'assets/image/delivery_bill.svg',
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: AppTextInputField(
                              controller: controller.addTitle,
                              hint: "Tên bảng giá",
                              inputFormatters: [UppercaseTextFormatter()],
                            ),
                          )
                        ],
                      ),
                    ),
                    DataTable(
                      columns: [
                        DataColumn(
                            label: Expanded(
                          child: Text(
                            controllerInter.title[0],
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        )),
                        DataColumn(
                            label: Expanded(
                          child: Text(controllerInter.title[1],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                        )),
                        DataColumn(
                            label: Expanded(
                          child: Text(controllerInter.title[2],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                        )),
                      ],
                      rows: List<DataRow>.generate(
                        controllerInter.combinedTable.length,
                        (rowIndex) {
                          return DataRow(cells: [
                            DataCell(Text(
                                controllerInter.combinedTable[rowIndex]
                                    ["tracking_type_value"])),
                            DataCell(Text(
                                controllerInter.combinedTable[rowIndex]
                                    ["warehouse_config_id_value"])),
                            DataCell(SizedBox(
                              width: 110,
                              height: 36,
                              child: TextField(
                                controller: controller.controllerAdd[rowIndex],
                                cursorColor: primaryColor,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: primaryColor)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: ColorApp.greyD7)),
                                    contentPadding: const EdgeInsets.all(10)),
                                keyboardType: TextInputType.number,
                              ),
                            )),
                          ]);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
            ButtonWidget(
              buttonText: "Cập nhật",
              margin: const EdgeInsets.symmetric(horizontal: 16),
              bgcolor: ColorApp.yellowFFC,
              borderColor: ColorApp.yellowFFC,
              textColor: Colors.white,
              onTap: () {
                if (controller.addTitle.text.isEmpty) {
                  AppSnackBar.showIsEmpty(
                      message: "Tên bảng giá không được để trống");
                } else {
                  controller.addControllersValues();
                  controller.matchListAdd();
                  Get.dialog(
                    CustomDialog(
                      title: "Xác nhận tạo bảng giá?",
                      onTapYes: () async {
                        controller.createConfigurationPrice(
                            key: "PRICING_CONFIG",
                            des: controller.addTitle.text);
                        controller.controllerAdd.clear();
                        Get.back();
                        Get.back(result: true);
                      },
                      onTapNo: () {
                        Get.back();
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
