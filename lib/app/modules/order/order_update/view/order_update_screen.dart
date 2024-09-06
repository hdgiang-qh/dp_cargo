import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/order/order_detail/controller/order_detail_controller.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../core/widget/textfields/app_text_field.dart';
import '../../../../data/model/model/transaction.dart';
import '../../../common_widget/button_widget.dart';
import '../../../common_widget/const.dart';
import '../../../common_widget/item_detail_list_widget.dart';
import '../../../common_widget/item_list_widget.dart';
import '../../../common_widget/textfield_widget.dart';
import '../../../common_widget/title_detail_list.dart';
import '../../../tracking/tracking_detail/controller/tracking_detail_controller.dart';
import '../../../tracking/tracking_screen/controller/tracking_controller.dart';
import '../../../util/images.dart';
import '../../list_orders/controller/list_orders_controller.dart';

class OrderUpdate extends BaseView<OrderDetailController> {

  @override
  Widget body(BuildContext context) {
    return const OrderUpdateScreen();
  }
}

class OrderUpdateController {
}
class OrderUpdateScreen extends StatefulWidget {
  const OrderUpdateScreen({
    super.key,
  });

  @override
  State<OrderUpdateScreen> createState() => OrderUpdateScreenState();
}

class OrderUpdateScreenState extends State<OrderUpdateScreen> {
  final orderUpdateController = Get.find<OrderDetailController>();
  final trackingTypeController = Get.find<TrackingTypeController>();
  final orderController = Get.find<ListOrdersController>();

  TextEditingController customerController = TextEditingController();


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
                            "Sửa đơn hàng",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ))),
                ])),
            Expanded(child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Obx((){
                      return Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            ItemDetailListWidget(
                              head: "Mã đơn hàng",
                              endText: "${orderUpdateController.orders.value?.orderId}",
                              fontWeight: true,
                              fontSize: 16,
                            ),
                            Gap(8.h),
                            ItemDetailListWidget(
                              head: "Mã tracking",
                              endText: "${orderUpdateController.orders.value?.code}",
                              fontWeight: true,
                              fontSize: 16,
                            ),
                            Divider(color: Colors.grey,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              child: Column(children: [
                                AppTextInputField(
                                  label: "Tên sản phẩm",
                                  controller: orderUpdateController.productName,
                                  requiredLabel: true,
                                  showLabel: true,
                                  border: 6,
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
                                  controller: orderUpdateController.customerName,
                                  suggestionsCallback: (pattern) {
                                    return orderController.listCustomerName
                                        .where((TransactionName item) => "${item.nickName} | ${item.idCustomer} | ${item.name}"
                                        .toString()
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase()))
                                        .toList();
                                  },
                                  builder: (context, controller, focusNode) {
                                    return AppTextInputField(
                                      border: 6,
                                      focusNode: focusNode,
                                      controller:  orderUpdateController.customerName,
                                    );
                                  },
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      title: Text("${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}",style: const TextStyle(fontSize: 13)),
                                    );
                                  },
                                  onSelected: (suggestion) {
                                    orderUpdateController.customerName.text = "${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}";
                                    orderUpdateController.idCustomer.value = suggestion.id!;
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
                                  )
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
                                          hint: Text("${orderUpdateController.orders.value.trackingType?.name ?? "Chọn loại hàng hóa"}"),
                                          value: orderUpdateController.types.value,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: textPrimary
                                          ),
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          items: trackingTypeController.listTrackingType.map((valueItem){
                                            return DropdownMenuItem(
                                                onTap: (){
                                                  orderUpdateController.idTrackingType.value = valueItem.id!;
                                                },
                                                value: valueItem.name,
                                                child: Text("${valueItem.name}"));
                                          }).toList(),
                                          onChanged: ( newValue) async{
                                            orderUpdateController.types.value = newValue.toString();
                                          }
                                      );
                                    })
                                ),
                                Gap(16.h),
                                AppTextInputField(
                                  label: "Ghi chú",
                                  controller: orderUpdateController.note,
                                  showLabel: true,
                                  border: 6,
                                ),
                              ]),
                            ),
                          ]),
                        ),
                      );
                    }),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(children: [
                      Expanded(
                        child: ButtonWidget(
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
                            orderUpdateController.productName.text == ""
                                ? AppSnackBar.showError(message: "Chưa nhập tên sản phẩm")
                                : orderUpdateController.customerName.text.isEmpty
                                ? AppSnackBar.showError(message: "Chưa chọn khách hàng")
                                : orderUpdateController.idTrackingType.value == 0
                                ? AppSnackBar.showError(message: "Chưa chọn loại hàng hoá")
                                : orderUpdateController.updateOrder();
                          },
                          buttonText: "Chỉnh sửa",
                          fontSize: 13,
                          textColor: Colors.white,
                          bgcolor: AppColors.primary,
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ))
          ]),
        ),
      ),
    );
  }
}