import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/search/controller/search_tracking_controller.dart';

import '../../mawb_detail/controller/mawb_detail_controller.dart';
import '../../mawb_detail/controller/search_awb_tracking_controller.dart';

class SearchAwbTrackingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchAwbTrackingViewState();
}

class _SearchAwbTrackingViewState extends State<SearchAwbTrackingView> {
  final GlobalKey qrTrackingKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  final controllerSearch = Get.find<AWBDetailController>();
  bool hasScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quét mã tìm kiếm awb tracking'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            //  flex: 2,
            child: QRView(
              cameraFacing: CameraFacing.unknown,
              key: qrTrackingKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutWidth: context.width * 0.8,
                cutOutHeight: 150,
              ),
              onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text('Barcode Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          )
        ],
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
        controllerSearch.code.value.text = scanData.code.toString();
        await controller.pauseCamera();
        Get.back(result: true);
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
