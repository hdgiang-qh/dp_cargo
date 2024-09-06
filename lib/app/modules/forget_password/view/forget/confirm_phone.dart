
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/forget_password/view/forget/confirm_otp.dart';



class ConfirmPhoneScr extends StatefulWidget {
  const ConfirmPhoneScr({super.key});

  @override
  State<ConfirmPhoneScr> createState() => _ConfirmPhoneScrState();
}

class _ConfirmPhoneScrState extends State<ConfirmPhoneScr> {
  TextEditingController phone = TextEditingController();
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
              AppTextInputField(
                label: "Số điện thoại",
                requiredLabel: true,
                hint: "Nhập số điện thoại",
                controller: phone,
                textInputType: TextInputType.phone,
              ),
              const SizedBox(
                height: 24,
              ),
              ButtonWidget(
                onTap: (){
                  Get.to(()=> const ConfirmOtpScr());
                },
                width: context.width, buttonText: 'Xác nhận',
                bgcolor: primaryColor,
                textColor: ColorApp.whiteFA,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
