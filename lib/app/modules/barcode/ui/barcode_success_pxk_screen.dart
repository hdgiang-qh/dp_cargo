import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/enum/boxes_status.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/elevate_button.dart';
import '../../../core/widget/loading.dart';
import '../../delivery_bills/add_delivery_bills/controller/add_delivery_bill_controller.dart';
import '../../delivery_bills/delivery_bills_detail/controller/delivery_bill_detail_controller.dart';
import '../controller/barcode_controller.dart';
import '../widget/barcode_success.dart';
import '../widget/item_code.dart';

class BarcodeSuccessPxkScreen extends StatefulWidget {
  const BarcodeSuccessPxkScreen({super.key});

  @override
  State<BarcodeSuccessPxkScreen> createState() =>
      _BarcodeSuccessPxkScreenState();
}

class _BarcodeSuccessPxkScreenState extends State<BarcodeSuccessPxkScreen> {
  final deliveryBillDetailController = Get.put(DeliveryBillDetailController());
  final addDeliveryBillController = Get.put(AddDeliveryBillController());
  final barCodeController = Get.put(BarCodeController());
  final scrollController = ScrollController();
  Barcode? result;
  QRViewController? controller;
  bool? isCheck;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  double? widthDevice;

  @override
  void dispose() {
    deliveryBillDetailController.barcodes.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  const Positioned.fill(child: BarCodeSuccess()),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () => Get.back(),
                              child: Image.asset('assets/icons/ic_circle.png')),
                          const SizedBox(width: 80),
                          const Text("Quét mã vạch",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              'Danh sách mã vận đơn',
                              style: Theme.of(context).BodyText2Bold,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  Obx(() {
                    final isEmptyData =
                        deliveryBillDetailController.vnDeliveryBoxes.isNotEmpty;
                    if (!isEmptyData) {
                      return Expanded(
                        child: Center(
                          child: FutureBuilder(
                            future: Future.delayed(const Duration(seconds: 2)),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Loading();
                              } else {
                                return const Text('Không có dữ liệu');
                              }
                            },
                          ),
                        ),
                      );
                    }
                    final listBoxDelivering = deliveryBillDetailController
                        .vnDeliveryBoxes
                        .where((element) =>
                            element.status == BoxesStatus.delivering)
                        .toSet()
                        .toList();
                    return Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: listBoxDelivering.length,
                        itemBuilder: (context, index) {
                          final value = listBoxDelivering[index];
                          return Obx(() {
                            final isChecked = deliveryBillDetailController
                                .barcodes
                                .contains(listBoxDelivering[index].code);
                            return ItemCode(
                              widget: isChecked
                                  ? Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: AppColors.primary),
                                      child:
                                          Image.asset('assets/icons/img.png'),
                                    )
                                  : Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.greyScale,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Colors.white),
                                    ),
                              vnDeliveryBoxes: value,
                            );
                          });
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox();
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: RedButton(
                    onTap: () {
                      deliveryBillDetailController.failedDeliveryBill();
                    },
                    text: 'Khách hủy',
                  ),
                ),
                Gap(16.w),
                Expanded(
                  child: RedButton(
                    onTap: () => barCodeController.successVnBox(),
                    text: 'Trả hàng',
                  ),
                ),
              ],
            )));
  }
}
