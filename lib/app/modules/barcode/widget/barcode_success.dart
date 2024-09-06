import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/enum/boxes_status.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../delivery_bills/delivery_bills_detail/controller/delivery_bill_detail_controller.dart';

class BarCodeSuccess extends StatefulWidget {
  const BarCodeSuccess({super.key});

  @override
  State<BarCodeSuccess> createState() => _BarCodeState();
}

class _BarCodeState extends State<BarCodeSuccess> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  double? widthDevice;
  final deliveryBillDetailController = Get.put(DeliveryBillDetailController());
  @override
  Widget build(BuildContext context) {
    widthDevice = MediaQuery.of(context).size.width;
    return _buildQrView(context);
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      cameraFacing: CameraFacing.unknown,
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutHeight: widthDevice! / 1.8,
          cutOutWidth: widthDevice! / 1.15,
          cutOutBottomOffset: -50,
          borderColor: Colors.red,
          borderLength: 0,
          borderWidth: 0),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    bool isCheck = false;
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      final scannedCode = scanData.code;
      final isStatus = deliveryBillDetailController.vnDeliveryBoxes
          .where((element) => element.status == BoxesStatus.delivering)
          .toSet()
          .toList();

      final isScannedCodeExist =
      isStatus.any((element) => element.code == scannedCode);

      if (scannedCode?.isNotEmpty ?? false) {
        deliveryBillDetailController.onUpdateBarCode(scannedCode!);
        if (isScannedCodeExist) {
          if (!isCheck) {
            AppSnackBar.showSuccess(message: "Thêm thùng tành công",);
            isCheck = true;
            await Future.delayed(const Duration(seconds: 5));
            setState(() {
              isCheck = false;
            });
          }
        } else {
          if (!isCheck) {
            AppSnackBar.failure();
            isCheck = true;
            await Future.delayed(const Duration(seconds: 5));
            setState(() {
              isCheck = false;
            });
          }
        }
      }
    });
  }

  void updateCheckedState(String code) {
    final index = deliveryBillDetailController
        .deliveryBill.value.vnDeliveryBoxes!
        .indexWhere((box) => box.code == code);
    if (index != -1) {
      deliveryBillDetailController.barcodes[index] =
      deliveryBillDetailController.barcodes[index];
      // update();
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   // const SnackBar(content: Text('no Permission')),
      // );
      AppSnackBar.showError(message: 'No Permission', title: 'Error');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
