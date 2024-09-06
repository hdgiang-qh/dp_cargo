import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/title_detail_list.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/delivery_detail/controller/detail_delivery_controller.dart';
import 'package:vncss/app/modules/search/controller/search_tracking_controller.dart';

import '../../common_widget/app_bar_widget.dart';
import '../../common_widget/button_widget.dart';
import '../../common_widget/const.dart';

class BarCodeDeliveryTrackingCheck extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BarCodeSearchState();
}

class _BarCodeSearchState extends State<BarCodeDeliveryTrackingCheck> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  final controllerSearch = Get.find<SearchTrackingController>();
  final controllerDeliveryTracking = Get.find<DetailDeliveryController>();
  bool hasScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBarWidget(
              title: "Quét mã tìm kiếm tracking",
              onBack: () => Get.back(result: true),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: QRView(
                cameraFacing: CameraFacing.unknown,
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutWidth: context.width * 0.8,
                  cutOutHeight: 150,
                ),
                onPermissionSet: (ctrl, p) =>
                    _onPermissionSet(context, ctrl, p),
              ),
            ),
            Expanded(
              child: Obx(() {
                return Column(
                  children: [
                    const TitleDetailList(
                      svgPath: "assets/image/list1.svg",
                      headText: "Danh sách Trackings",
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                            itemCount:
                                controllerDeliveryTracking.tracking.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              bool isChecked = controllerDeliveryTracking
                                      .tracking[index].exploitStatus?.value ==
                                  "Đã đóng hàng";
                              controllerDeliveryTracking
                                  .checkItemTracking[index] = isChecked;
                              return Row(
                                children: [
                                  Obx(() {
                                    return SizedBox(
                                      height: 40,
                                      width: 24,
                                      child: Checkbox(
                                        value: controllerDeliveryTracking
                                            .checkItemTracking[index],
                                        activeColor: ColorApp.redB6,
                                        onChanged: (bool? value) {
                                          // controllerDeliveryTracking
                                          //         .checkItemTracking[index] =
                                          //     value!;
                                          // controllerDeliveryTracking
                                          //     .checkItemTracking
                                          //     .removeAt(index);
                                          // controllerDeliveryTracking
                                          //     .checkItemTracking
                                          //     .insert(index, value);
                                        },
                                      ),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(controllerDeliveryTracking
                                        .tracking[index].code
                                        .toString()),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                    ButtonWidget(
                      buttonText: "Xác nhận",
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      textColor: ColorApp.whiteFA,
                      bgcolor: primaryColor,
                      borderColor: primaryColor,
                      onTap: () {
                        controllerDeliveryTracking.idTrackingExport.isEmpty
                            ? AppSnackBar.showError(
                                message: "Danh sách đóng hàng trống")
                            : Get.dialog(
                                CustomDialog(
                                  title: "Xác nhận đóng hàng và thanh toán?",
                                  onTapYes: () async {
                                    controllerDeliveryTracking
                                        .exportDeliveryBill();
                                    Get.back();
                                    Get.back();
                                    Get.back(result: true);
                                  },
                                  onTapNo: () {
                                    Get.back();
                                  },
                                ),
                              );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      if (!hasScanned) {
        hasScanned = true;
        result = scanData;

        final index = controllerDeliveryTracking.tracking.indexWhere(
          (tracking) => tracking.code.toString() == scanData.code.toString(),
        );
        if (index != -1) {
          controllerDeliveryTracking.checkItemTracking[index] = true;
          controllerDeliveryTracking.packTrackingDeliveryBill(
              idTracking: controllerDeliveryTracking.tracking[index].id);
        } else {
          AppSnackBar.showError(
              message:
                  'Mã tracking: ${scanData.code} không tồn tại trong danh sách.');
          AppSnackBar.playSound("assets/sounds/notfound_vn.mp3");
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      AppSnackBar.showError(message: 'Camera thiết bị lỗi', title: 'Error');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
