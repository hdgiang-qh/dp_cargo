import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/utils/color_app.dart';
import '../../../../core/values/app_colors.dart';
import '../../../common_widget/button_widget.dart';
import '../controller/sync_awb_controller.dart';

class SelectSyncAwb extends BaseView<SyncAwbController> {
  @override
  Widget body(BuildContext context) {
    return Column(children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black12)
            ),
            child: Column(
                children: [
                  Row(children: [
                    Text("Chọn các AWB cần đồng bộ",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight
                          .bold),)
                  ]),
                  Expanded(
                    child: Container(
                      child: Obx(() {
                        return controller.syncAwb.value.notSynced == null
                            ? SizedBox()
                            : ListView.builder(
                            itemCount: controller.syncAwb.value.notSynced
                                ?.length,
                            itemBuilder: (context, index) {
                              return Obx(() {
                                return CheckboxListTile(
                                  title: Text(controller.syncAwb.value.notSynced?[index] ?? ""),
                                  value: controller.checkPermission[index],
                                  activeColor: primaryColor,
                                  onChanged: (bool? newValue){
                                    controller.checkPermission[index] = newValue!;
                                    controller.checkPermission.removeAt(index);
                                    controller.checkPermission.insert(index, newValue);
                                    controller.checkPermission[index]
                                        ? controller.listSyncAwb.add(controller.syncAwb.value.notSynced![index])
                                        : controller.listSyncAwb.remove(controller.syncAwb.value.notSynced![index]);
                                    print(controller.listSyncAwb);
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                );
                              });
                            });
                      }),
                    ),
                  ),
                ]),
          ),
        ),
      Container(
        margin: EdgeInsets.all(8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ButtonWidget(
                  onTap: (){
                    Get.back();
                  },
                  buttonText: "Hủy bỏ",
                  fontSize: 13,
                  textColor: AppColors.primary,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  borderColor: primaryColor,
                  bgcolor: Colors.white,
                ),
              ),
              Expanded(
                child: ButtonWidget(
                  onTap: (){
                    controller.postSyncAwb();
                    Get.back(result: true);
                  },
                  buttonText: "Xác nhận",
                  fontSize: 13,
                  textColor: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  bgcolor: AppColors.primary,
                ),
              ),
            ]),
      )
    ]);
  }
}
