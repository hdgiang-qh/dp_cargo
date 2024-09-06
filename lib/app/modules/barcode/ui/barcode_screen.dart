import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../../core/widget/elevate_button.dart';
import '../../../data/model/model/vn_delivery_box.dart';
import '../../../routes/app_pages.dart';
import '../../main/controllers/main_controller.dart';
import '../../main/views/main_view.dart';

class BarCodeScreen extends StatefulWidget {
  final List<VnDeliveryBox>? vnDeliveryBoxes;
  const BarCodeScreen({super.key, this.vnDeliveryBoxes});

  @override
  State<BarCodeScreen> createState() => _BarCodeScreen();
}

class _BarCodeScreen extends State<BarCodeScreen> {
  double? widthDevice;
  Size? sizeDevice;
  List<Barcode> scannedCodes = [];
  List<Widget> widGet = [];
  QRViewController? controller;
  bool? isCheck;
  bool isScanner = false;
  final mainController = Get.find<MainController>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(child: _buildQrView(context)),
                  Positioned(
                    top: 20,
                    left: 20,
                    right: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: CircleAvatar(
                              radius: 26,
                              backgroundColor: AppColors.backButtonColor,
                              child: Assets.icons.icArrowBack.svg(
                                  width: 36,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.colorWhite, BlendMode.srcIn)),
                            ),
                          ),
                          const Text("Quét mã vạch",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          const SizedBox(
                            width: 52,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            scannedCodes.isEmpty
                ? Expanded(
                    child: Center(
                        child: Text(
                            'Vui lòng quét mã Barcode để xác nhận thông tin',
                            style: Theme.of(context).BodyText1)))
                : Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: scannedCodes.length,
                            itemBuilder: (context, index) {
                              final scannedCode = scannedCodes[index];
                              final widget = widGet[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 6),
                                child: Row(
                                  children: [
                                    widget,
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${scannedCode.code}',
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RedButton(
            onTap: () =>     Get.to(MainView()),
            text: 'Quay lại',
          ),
        ));
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      cameraFacing: CameraFacing.unknown,
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutHeight: sizeDevice!.width / 1.8,
          cutOutWidth: sizeDevice!.width / 1.15,
          cutOutBottomOffset: -50,
          borderColor: Colors.red,
          borderLength: 0,
          borderWidth: 0),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      if (!isScanner) {
        final scannedCode = scanData.code;
        isScanner = true;
        if (scannedCode != null) {
          mainController.getListDeliveryBill(scannedCode);
          Future.delayed(const Duration(seconds: 1)).then((_) {
            if (mainController.listDeliveryBill.isNotEmpty) {
              Get.offNamed(Routes.DELIVERY_BILL, arguments: {
                'id': mainController.listDeliveryBill.first.id,
              })?.then((_) {
                isScanner = false;
                mainController.listDeliveryBill.clear();
              });
            } else {
              failure(context);
            }
          });
        }
      }
    });
  }

  void failure(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          content: Container(
            width: double.infinity,
            height: 54,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                border: Border.all(color: AppColors.primary, width: 1)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        'Không tìm thấy thùng',
                        style: TextStyle(color: AppColors.primary),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      isScanner = false;
                    },
                    child: const Icon(
                      Icons.close,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              left: 12, right: 12, bottom: sizeDevice!.height - 200),
          backgroundColor: Colors.transparent,
        ))
        .closed
        .then((_) => isScanner = false);
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   // const SnackBar(content: Text('no Permission')),
      // );
      AppSnackBar.showError(message: 'Chưa cấp quyền Camera', title: 'Error');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
