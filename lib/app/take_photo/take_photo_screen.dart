import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../core/base/base_view.dart';
import '../core/enum/delivery_bill_status.dart';
import '../core/values/app_colors.dart';
import '../core/values/app_text_styles.dart';
import '../core/widget/appbar/custom_appbar.dart';
import '../core/widget/dialog/app_snackbar.dart';
import '../core/widget/elevate_button.dart';
import '../core/widget/textfields/app_text_field.dart';
import '../data/model/model/delivery_bill.dart';
import '../data/model/model/delivery_bill_detail.dart';
import '../modules/delivery_bills/add_delivery_bills/controller/add_delivery_bill_controller.dart';
import '../modules/delivery_bills/delivery_bills_detail/controller/delivery_bill_detail_controller.dart';
import '../modules/delivery_bills/list_delivery_bills/controller/list_delivery_bills_controller.dart';
import '../modules/main/controllers/main_controller.dart';
import '../modules/main/views/main_view.dart';

class TakePhotoScreen extends StatefulWidget {
  final DeliveryBillDetail? deliveryBillDetail;
  const TakePhotoScreen({super.key, this.deliveryBillDetail});

  @override
  State<TakePhotoScreen> createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  final noteController = TextEditingController();
  final deliveryBillDetailController = Get.put(DeliveryBillDetailController());
  final addDeliveryBillController = Get.put(AddDeliveryBillController());
  final controllerList = Get.find<ListDeliveryBillController>();
  final noteKey = GlobalKey<FormState>();
  final FocusNode noteFocus = FocusNode();
  final deliveryBill = DeliveryBill();
  File? image;
  late final BaseView baseView;
  @override
  void dispose() {
    noteController.dispose();
    noteFocus.dispose();
    image?.delete();
    super.dispose();
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {
      print('Không có ảnh được chụp.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCheckStatus =
        deliveryBillDetailController.deliveryBill.value.deliveryBillStatus;
    return Scaffold(
      appBar: const AppbarCustom(
        title: 'Xác nhận trả hàng',
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/camera_ic.png'),
                        Positioned.fill(
                            child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              image != null
                                  ? SizedBox(
                                      height: 220,
                                      width: double.infinity,
                                      child: Image.file(
                                        height: 220,
                                        width: double.infinity,
                                        image!,
                                        fit: BoxFit.cover,
                                      ))
                                  : GestureDetector(
                                      onTap: () => _pickImageFromCamera(),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                              'assets/icons/ic_camera.png'),
                                          const Text('Chụp ảnh')
                                        ],
                                      )),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.note,
                          style: Theme.of(context).BodyText1,
                        ),
                        Gap(8.h),
                        Form(
                          key: noteKey,
                          child: AppTextFieldWidget(
                            inputController: noteController,
                            isPasswordField: false,
                            maxLine: 8,
                            focusNode: noteFocus,
                            hintText: 'Ghi Chú',
                            textInputType: TextInputType.multiline,
                            // expands: true,
                            onChanged: (_) {
                              noteKey.currentState!.validate();
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(noteFocus);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child: RedButton(
                  onTap: () => Get.back(),
                  text: 'Quay lại',
                  color: Colors.white,
                  border: Border.all(color: AppColors.primary),
                  style: const TextStyle(color: Colors.red),
                )),
                Gap(16.w),
                Expanded(
                    child: RedButton(
                  onTap: () {
                    if (image != null && noteController.text.isNotEmpty) {
                      final controller = Get.find<MainController>();
                      controller.updateDeliveryBill(
                          file: image!,
                          id: widget.deliveryBillDetail!.id!,
                          shipper_note: noteController.text);

                      AppSnackBar.successShipNote();
                      
                      Get.to(MainView());
                    } else {
                      AppSnackBar.failureShipNote(
                        title: noteController.text.isEmpty
                            ? "Vui lòng nhập ghi chú"
                            : image == null
                                ? "Vui lòng chụp ảnh đơn hàng"
                                : "Đã xảy ra một số lỗi!",
                      );
                    }
                  },
                  text: isCheckStatus == DeliveryStatus.delivering
                      ? 'Xác nhận trả hàng'
                      : 'Xác nhận nhận đơn',
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
