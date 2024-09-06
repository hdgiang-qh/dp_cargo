
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/forget_password/view/forget/enter_change_pass.dart';



class ConfirmOtpScr extends StatefulWidget {
  const ConfirmOtpScr({super.key});

  @override
  State<ConfirmOtpScr> createState() => _ConfirmOtpScrState();
}

class _ConfirmOtpScrState extends State<ConfirmOtpScr> {
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: SvgPicture.asset(
                "assets/image/logo.svg",
              ),
            ),
            ButtonWidget(
              onTap: () {
                Get.to(() => const EnterChangePassScr());
              },
              width: context.width,
              buttonText: 'Xác nhận',
              bgcolor: primaryColor,
              textColor: ColorApp.whiteFA,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bạn không nhận được mã?",
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorApp.grey7F,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Gửi lại mã",
                    style: TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
