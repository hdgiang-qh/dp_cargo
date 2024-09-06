import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/utils/color_app.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/transaction.dart';
import '../../../common_widget/button_widget.dart';
import '../../../common_widget/textfield_widget.dart';
import '../../tracking_screen/controller/tracking_controller.dart';

class AddTracking extends BaseView<TrackingController>{
  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                InkWell(
                  onTap: (){
                    Get.back();
                    controller.clear();
                  },
                  child: const Icon(Icons.arrow_back, size: 30),
                ),
                const Expanded(child: Center(child: Text("Thêm tracking", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)))
              ])),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(children: [
                  Column(children: [
                    AppTextInputField(
                      label: "Mã tracking",
                      hint: "Nhập mã tracking",
                      requiredLabel: true,
                      showLabel: true,
                      border: 6,
                      controller: controller.codeTracking,
                      error: controller.isLinkDetected.value ? 'Không được phép nhập đường link.' : null,
                        onChanged: controller.checkForLink,
                    ),
                    Gap(16.h),
                    const Row(children: [
                      Text(
                        "Nhập tên khách hàng",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      )
                    ]),
                    TypeAheadField<TransactionName>(
                      controller: controller.customerController,
                      suggestionsCallback: (pattern) {
                        return controller.listCustomerName
                            .where((TransactionName item) => "${item.nickName} | ${item.idCustomer} | ${item.name}"
                            .toString()
                            .toLowerCase()
                            .contains(pattern.toLowerCase()))
                            .toList();
                      },
                      builder: (context, customerController, focusNode) {
                        return AppTextInputField(
                          hint: "Tìm kiếm khách hàng",
                          border: 6,
                          focusNode: focusNode,
                          controller: customerController,
                        );
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text("${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}",style: const TextStyle(fontSize: 13)),
                        );
                      },
                      onSelected: (suggestion) {
                        controller.customerController.text ="${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}";
                        controller.idCustomerFilter.value = suggestion.id.toString();
                      },
                      loadingBuilder: (context) => const Text('Loading...'),
                      errorBuilder: (context, error) =>
                      const Text('Error!'),
                      emptyBuilder: (context) =>
                      const Text('Không có dữ liệu phù hợp'),
                    ),
                    Gap(16.h),
                    AppTextInputField(
                      label: "Giá trị hàng hóa (VNĐ)",
                      hint: "0",
                      showLabel: true,
                      textInputType: TextInputType.phone,
                      border: 6,
                      controller: controller.price,
                    ),
                    Gap(16.h),
                    AppTextInputField(
                      label: "Mô tả",
                      hint: "Nhập mô tả",
                      showLabel: true,
                      border: 6,
                      controller: controller.description,
                    ),
                  ]),
                ]),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Gap(8.w),
                  Expanded(
                    child: ButtonWidget(
                      onTap: (){
                        controller.clear();
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
                      onTap: ()async{
                        controller.codeTracking.text == ""
                            ? AppSnackBar.showError(message: "Chưa nhập mã tracking")
                            : controller.customerController.text == ""
                            ? AppSnackBar.showError(message: "Chưa chọn tên khách hàng")
                            : controller.createTracking();
                      },
                      buttonText: "Xác nhận",
                      fontSize: 13,
                      textColor: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      borderColor: AppColors.primary,
                      bgcolor: AppColors.primary,
                    ),
                  ),
                  Gap(8.w),
                ]),
          ),
        ]),
      ),
    );
  }
}