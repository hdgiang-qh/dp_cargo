import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../modules/barcode/controller/barcode_controller.dart';
import '../../values/app_colors.dart';
import '../elevate_button.dart';

DialogMessage({
  required BuildContext context,
  required String message,
  // String title = "Thông báo",
  Function()? onConfirm,
  Function()? onCancel,
}) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      // title: Text(
      //   title,
      //   style: GoogleFonts.roboto(
      //     color: AppColors.black,
      //     fontSize: 20,
      //     fontWeight: FontWeight.w700,
      //   ),
      // ),
      content: Text(
        message,
        style: GoogleFonts.roboto(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        if (onConfirm != null) ...[
          Container(
            height: 30,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    child: RedButton(
                  onTap: onCancel ??
                      () {
                        Navigator.pop(context);
                      },
                  text: 'Thoát',
                  style: const TextStyle(color: AppColors.primary),
                  color: Colors.white,
                  border: Border.all(color: AppColors.primary, width: 1),
                )),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: RedButton(
                  onTap: onCancel ??
                      () {
                        final barCodeController = Get.put(BarCodeController());
                        barCodeController.receiveVnBox();
                      },
                  text: 'Nhận đơn',
                )),
              ],
            ),
          ),
        ],
      ],
    ),
  );
}
