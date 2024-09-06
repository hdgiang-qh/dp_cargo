import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/textfields/app_text_field.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import '../../../common_widget/button_widget.dart';
import '../../../common_widget/textfield_widget.dart';
import '../controller/mawb_controller.dart';
import '../controller/mawb_status_controller.dart';


class FilterMawb extends StatefulWidget {
  const FilterMawb();

  @override
  State<FilterMawb> createState() => _FilterMawbState();
}

class _FilterMawbState extends State<FilterMawb> {

  final controller = Get.find<AWBController>();
  final statusController = Get.find<AwbStatusController>();


  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width * 0.9,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: <Widget>[
          const SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Bộ lọc tìm kiếm',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: ColorApp.whiteFA),
                  )),
            ),
          ),
          Container(
            height: context.height - 150,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    children: [
                      const Row(children: [
                        Text("Nhập thông tin", style: TextStyle(fontSize: 16),)
                      ]),
                      const SizedBox(height: 16,),
                      AppTextInputField(
                        hint: "Tìm theo AWB",
                        border: 6,
                        controller: controller.awbCodeFilter,
                      ),
                      AppTextInputField(
                        hint: "Tìm theo tracking",
                        border: 6,
                        controller: controller.trackingCodeFilter,
                      ),
                      AppTextInputField(
                        hint: "Tìm theo mã thùng",
                        border: 6,
                        controller: controller.boxCodeFilter,
                      ),
                    ]),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonWidget(
                          buttonText: "Thiết lập lại",
                          width: 140,
                          borderColor: primaryColor,
                          textColor: primaryColor,
                          onTap: () {
                            controller.clearFilter();
                            statusController.getListValueStatus();
                            controller.onRefreshPage();
                            Get.back();
                          },
                        ),
                        ButtonWidget(
                          buttonText: "Áp dụng",
                          width: 140,
                          bgcolor: primaryColor,
                          textColor: ColorApp.whiteFA,
                          onTap: () {
                            statusController.getListValueStatus();
                            controller.onSelected();
                            controller.clearFilter();
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
