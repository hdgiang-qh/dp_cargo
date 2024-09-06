import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../core/enum/boxes_status.dart';
import '../../core/enum/delivery_bill_status.dart';
import '../../core/values/app_text_styles.dart';
import '../../core/widget/appbar/custom_appbar.dart';
import '../../core/widget/elevate_button.dart';
import '../../take_photo/take_photo_screen.dart';
import '../barcode/widget/item_code.dart';
import '../delivery_bills/delivery_bills_detail/controller/delivery_bill_detail_controller.dart';
import '../delivery_bills/list_delivery_bills/controller/list_delivery_bills_controller.dart';

class MissingReceiveScreen extends StatefulWidget {
  const MissingReceiveScreen({super.key});

  @override
  State<MissingReceiveScreen> createState() => _MissingReceiveScreenState();
}

class _MissingReceiveScreenState extends State<MissingReceiveScreen> {
  final deliveryBillDetailController = Get.put(DeliveryBillDetailController());
  final listDeliveryBillDetailController =
      Get.put(ListDeliveryBillController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: const AppbarCustom(
        title: 'Xác nhận trả hàng',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.icons.icLef.svg(),
                const SizedBox(
                  width: 4,
                ),
                Center(
                    child: Column(
                  children: [
                    Text(
                      'Bạn chưa trả hết hàng',
                      style: Theme.of(context).BodyText2Bold,
                    ),
                  ],
                )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: deliveryBillDetailController.vnDeliveryBoxes
                  .where((box) => box.status == BoxesStatus.delivering)
                  .length,
              itemBuilder: (context, index) {
                final isCheckStatusBox = deliveryBillDetailController
                    .vnDeliveryBoxes
                    .where((box) => box.status == BoxesStatus.delivering)
                    .toList();
                final value = isCheckStatusBox[index];

                /// Kiểm tra xem mã vạch tại index đã được quét chưa
                final isChecked = deliveryBillDetailController.barcodes
                    .contains(isCheckStatusBox[index].code);

                /// Nếu mã vạch đã được quét, không hiển thị item đó
                if (isChecked) {
                  return const SizedBox.shrink();
                }

                /// Nếu mã vạch chưa được quét, hiển thị item đó
                return ItemCode(
                  vnDeliveryBoxes: value,
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RedButton(
            onTap: () {
              final isCheckStatus = deliveryBillDetailController
                  .deliveryBill.value.deliveryBillStatus;
              if (deliveryBillDetailController.barcodes.length <
                      deliveryBillDetailController.vnDeliveryBoxes.length &&
                  isCheckStatus == DeliveryStatus.delivering) {
                deliveryBillDetailController.receiveSingleBox();
              }
              if (deliveryBillDetailController.barcodes.length <
                      deliveryBillDetailController.vnDeliveryBoxes.length &&
                  isCheckStatus == DeliveryStatus.packing) {
                deliveryBillDetailController.receiveSingleBox();
              }
              Get.to(TakePhotoScreen(
                deliveryBillDetail:
                    deliveryBillDetailController.deliveryBill.value,
              ));
            },
            text: 'Xác nhận trả thiếu hàng',
          )),
    );
  }
}
