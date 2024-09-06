import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/transaction.dart';
import '../../../common_widget/button_widget.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/textfield_widget.dart';
import '../../../tracking/tracking_detail/controller/tracking_detail_controller.dart';
import '../../../tracking/tracking_screen/controller/tracking_controller.dart';
import '../../mawb_box_detail/controller/mawb_box_detail_controller.dart';
import '../controller/mawb_detail_controller.dart';

class UpdateAwbTrackingView extends BaseView<TrackingDetailController> {
  final trackingTypeController = Get.find<TrackingTypeController>();
  final trackingController = Get.find<TrackingController>();
  final checkController = Get.find<MawbBoxDetailController>();

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx((){
          return Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back, size: 30),
                      ),
                      const Expanded(
                          child: Center(
                              child: Text(
                                "Cập nhật tracking",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              )))
                    ])),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: SingleChildScrollView(
                        child: Column(children: [
                          Column(children: [
                            AppTextInputField(
                              showLabel: true,
                              enable: false,
                              label: "Mã tracking",
                              hint: controller.trackings.value.code ?? S.current.isNull,
                              border: 6,
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              label: "Tên sản phẩm",
                              border: 6,
                              controller: controller.productName,
                            ),
                            Gap(16.h),
                            const Row(children: [
                              Text(
                                "Khách hàng",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ]),
                            TypeAheadField<TransactionName>(
                              controller: controller.customerController,
                              suggestionsCallback: (pattern) {
                                return trackingController.listCustomerName
                                    .where((TransactionName item) => "${item.nickName} | ${item.idCustomer} | ${item.name}"
                                    .toString()
                                    .toLowerCase()
                                    .contains(pattern.toLowerCase()))
                                    .toList();
                              },
                              builder: (context, Controller, focusNode) {
                                return AppTextInputField(
                                  border: 6,
                                  focusNode: focusNode,
                                  controller: controller.customerController,
                                );
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text("${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}",style: const TextStyle(fontSize: 13)),
                                );
                              },
                              onSelected: (suggestion) {
                                controller.customerController.text = "${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}";
                                controller.idCustomer.value = suggestion.id!;
                              },
                              loadingBuilder: (context) => const Text('Loading...'),
                              errorBuilder: (context, error) =>
                              const Text('Error!'),
                              emptyBuilder: (context) =>
                              const Text('Không có dữ liệu phù hợp'),
                            ),
                            Gap(16.h),
                            const Row(children: [
                              Text(
                                "Loại hàng hóa",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ]),
                            Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: Colors.black12)
                                ),
                                child: Obx((){
                                  return DropdownButton(
                                      hint: Text("${controller.trackings.value.trackingType?.name ?? "Chọn loại hàng"}"),
                                      value: controller.types.value,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: textPrimary
                                      ),
                                      isExpanded: true,
                                      underline: const SizedBox(),
                                      items: trackingTypeController.listTrackingType.map((valueItem){
                                        return DropdownMenuItem(
                                            onTap: (){
                                              controller.idTrackingType.value = valueItem.id.toString();
                                            },
                                            value: valueItem.name,
                                            child: Text("${valueItem.name}"));
                                      }).toList(),
                                      onChanged: ( newValue) async{
                                        controller.types.value = newValue.toString();
                                      }
                                  );
                                })
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              label: "Hệ số thùng",
                              border: 6,
                              textInputType: TextInputType.numberWithOptions(decimal: true),
                              controller: controller.trackingBarrelCoefficient,
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              enable: false,
                              label: "Kho",
                              hint: "${controller.trackings.value.warehouseVn?.name ?? "Đang cập nhật"}",
                              border: 6,
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              label: "Số lượng",
                              textInputType: TextInputType.phone,
                              border: 6,
                              controller: controller.trackingAmount,
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              label: "Cân nặng khai thác",
                              textInputType: TextInputType.numberWithOptions(decimal: true),
                              border: 6,
                              controller: controller.trackingMiningWeight,
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              label: "Ghi chú",
                              border: 6,
                              controller: controller.note,
                            ),
                            const SizedBox(height: 16)
                          ]),
                        ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ButtonWidget(
                            onTap: (){
                              Get.back();
                            },
                            buttonText: "Hủy bỏ",
                            fontSize: 13,
                            textColor: AppColors.primary,
                            borderColor: AppColors.primary,
                            bgcolor: Colors.white,
                          ),
                        ),
                        Gap(16.w),
                        Expanded(
                          child: ButtonWidget(
                            enalble: checkController.checkEnable.value,
                            onTap: (){
                              controller.productName.text == ""
                                  ? AppSnackBar.showError(message: "Chưa nhập tên sản phẩm")
                                  : controller.customerController.text == ""
                                  ? AppSnackBar.showError(message: "Chưa chọn tên khách hàng")
                                  : controller.types.value == ""
                                  ? AppSnackBar.showError(message: "Chưa chọn loại hàng hoá")
                                  : controller.updateBoxTracking();
                            },
                            buttonText: "Xác nhận",
                            fontSize: 13,
                            textColor: Colors.white,
                            bgcolor: AppColors.primary,
                          ),
                        ),

                      ]),
                )
              ]);
        }),
      )
    );
  }
}
