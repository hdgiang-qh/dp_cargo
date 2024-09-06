import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../data/model/model/transaction.dart';
import '../../../common_widget/button_widget.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/textfield_widget.dart';
import '../../../tracking/tracking_screen/controller/tracking_controller.dart';
import '../../list_orders/controller/list_orders_controller.dart';

class OrderAddScreen extends StatefulWidget {
  const OrderAddScreen({
    super.key,
  });

  @override
  State<OrderAddScreen> createState() => OrderAddScreenState();
}

class OrderAddScreenState extends State<OrderAddScreen> {
  final controller = Get.find<ListOrdersController>();
  final trackingTypeController = Get.find<TrackingTypeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(children: [
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
                            "Thêm đơn hàng",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ))),
                ])),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        AppTextInputField(
                          label: "Mã tracking",
                          hint: "Nhập mã tracking",
                          controller: controller.trackingCode,
                          requiredLabel: true,
                          border: 6,
                          showLabel: true,
                        ),
                        Gap(16.h),
                        AppTextInputField(
                          label: "Tên sản phẩm",
                          hint: "Nhập tên sản phẩm",
                          controller: controller.productName,
                          requiredLabel: true,
                          border: 6,
                          showLabel: true,
                        ),
                        Gap(16.h),
                        const Row(children: [
                          Text(
                            "Khách hàng",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
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
                              hint: "Tìm kiếm theo khách hàng",
                              border: 6,
                              focusNode: focusNode,
                              controller: customerController,
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text("${suggestion.nickName} | ${suggestion.nickName} | ${suggestion.name}",style: const TextStyle(fontSize: 13)),
                            );
                          },
                          onSelected: (suggestion) {
                            setState(() {
                              controller.customerController.text = "${suggestion.nickName} | ${suggestion.nickName} | ${suggestion.name}";
                              controller.idCustomer.value = suggestion.id!;
                            });
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
                          const Text(
                            "*",
                            style: TextStyle(color: Colors.red),
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
                                  hint: Text("Chọn loại hàng hóa"),
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
                          label: "Ghi chú",
                          hint: "Nhập ghi chú",
                          controller: controller.note,
                          border: 6,
                          showLabel: true,
                        ),
                      ]),
                    ]),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: [
                Expanded(
                  child: ButtonWidget(
                    onTap: (){
                      Get.back();
                    },
                    buttonText: "Hủy bỏ",
                    fontSize: 13,
                    textColor: AppColors.primary,
                    bgcolor: Colors.white,
                    borderColor: AppColors.primary,
                  ),
                ),
                Gap(16.h),
                Expanded(
                  child: ButtonWidget(
                    onTap: (){
                      controller.trackingCode == ""
                          ? AppSnackBar.showError(message: "Chưa nhập mã tracking")
                          : controller.productName.text == ""
                          ? AppSnackBar.showError(message: "Chưa nhập mã tracking")
                          : controller.idCustomer.value == 0
                          ? AppSnackBar.showError(message: "Chọn khách hàng đã tồn tại")
                          : controller.idTrackingType.value == ""
                          ? AppSnackBar.showError(message: "Chưa chọn loại hàng hoá")
                          : controller.createOrder();
                    },
                    buttonText: "Xác nhận",
                    fontSize: 13,
                    textColor: Colors.white,
                    borderColor: AppColors.primary,
                    bgcolor: AppColors.primary,
                  ),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}