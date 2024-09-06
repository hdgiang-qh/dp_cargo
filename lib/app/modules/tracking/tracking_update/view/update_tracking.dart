import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/tracking/tracking_detail/controller/tracking_detail_controller.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/transaction.dart';
import '../../../common_widget/button_widget.dart';
import '../../../common_widget/textfield_widget.dart';
import '../../../util/fake_data.dart';
import '../../tracking_screen/controller/tracking_controller.dart';


class UpdateTracking extends BaseView<TrackingDetailController> {
  Future<void> onRefreshPage() async {
    await controller.getDetailTracking();
  }

  @override
  Widget body(BuildContext context) {
    return const UpdateTrackingScreen();
  }
}
class UpdateTrackingScreen extends StatefulWidget {
  const UpdateTrackingScreen();

  @override
  State<UpdateTrackingScreen> createState() => _UpdateTrackingScreenState();
}

class _UpdateTrackingScreenState extends State<UpdateTrackingScreen> {
  final trackingDetailController = Get.find<TrackingDetailController>();
  final trackingTypeController = Get.find<TrackingTypeController>();
  final trackingController = Get.find<TrackingController>();

  bool _isLinkDetected = false;

  void _checkForLink(String? text) {
    final linkPattern = RegExp(r'https?:\/\/|\.');

    setState(() {
      _isLinkDetected = linkPattern.hasMatch(text!);
    });

    if (_isLinkDetected) {
      AppSnackBar.showError(message: 'Đường link không được phép nhập vào.');
    }
  }

  TextEditingController customerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                                "Sửa tracking",
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
                              hint: trackingDetailController.trackings.value.code ?? S.current.isNull,
                              border: 6,
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              label: "Tên sản phẩm",
                              requiredLabel: true,
                              border: 6,
                              controller: trackingDetailController.productName,
                              error: _isLinkDetected ? 'Không được phép nhập đường link.' : null,
                              onChanged: _checkForLink,
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
                              controller: trackingDetailController.customerController,
                              suggestionsCallback: (pattern) {
                                return trackingController.listCustomerName
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
                                  controller: trackingDetailController.customerController,
                                );
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text("${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}",style: const TextStyle(fontSize: 13)),
                                );
                              },
                              onSelected: (suggestion) {
                                trackingDetailController.customerController.text ="${suggestion.nickName} | ${suggestion.idCustomer} | ${suggestion.name}";
                                trackingDetailController.idCustomer.value = suggestion.id!;
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
                                      hint: Text("${trackingDetailController.trackings.value.trackingType?.name ?? "Chọn loại hàng hóa"}"),
                                      value: trackingDetailController.types.value,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: textPrimary
                                      ),
                                      isExpanded: true,
                                      underline: const SizedBox(),
                                      items: trackingTypeController.listTrackingType.map((valueItem){
                                        return DropdownMenuItem(
                                            onTap: (){
                                              trackingDetailController.idTrackingType.value = valueItem.id.toString();
                                            },
                                            value: valueItem.name,
                                            child: Text("${valueItem.name}"));
                                      }).toList(),
                                      onChanged: ( newValue) async{
                                        trackingDetailController.types.value = newValue.toString();
                                      }
                                  );
                                })
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              label: "Giá trị hàng hóa (VNĐ)",
                              border: 6,
                              textInputType: TextInputType.phone,
                              controller: trackingDetailController.price,
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              label: "Mô tả",
                              border: 6,
                              controller: trackingDetailController.description,
                            ),
                            Gap(16.h),
                            AppTextInputField(
                              showLabel: true,
                              label: "Ghi chú",
                              border: 6,
                              controller: trackingDetailController.note,
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
                            borderColor: primaryColor,
                            bgcolor: Colors.white,
                          ),
                        ),
                        Gap(16.w),
                        Expanded(
                          child: ButtonWidget(
                            onTap: (){
                              trackingDetailController.customerController.text == ""
                                  ? AppSnackBar.showError(message: "Chưa chọn tên khách hàng")
                                  : trackingDetailController.productName.text == ""
                                  ? AppSnackBar.showError(message: "Chưa nhập tên sản phẩm")
                                  : trackingDetailController.idTrackingType.toString() == ""
                                  ? AppSnackBar.showError(message: "Chưa chọn loại hàng hoá")
                                  : trackingDetailController.isNumeric(trackingDetailController.price.text)
                                  ? AppSnackBar.showError(message: "Giá trị hàng hoá không được chưa ký tự ngoài số")
                                  : trackingDetailController.updateTracking();
                            },
                            buttonText: "Xác nhận",
                            fontSize: 13,
                            textColor: Colors.white,
                            borderColor: AppColors.primary,
                            bgcolor: AppColors.primary,
                          ),
                        ),

                      ]),
                ),
              ]);
        }),
      ),
    );
  }
}
