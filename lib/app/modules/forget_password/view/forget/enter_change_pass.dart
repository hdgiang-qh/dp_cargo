
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/authencation/views/sign_in_src.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';


class EnterChangePassScr extends StatefulWidget {
  const EnterChangePassScr({super.key});

  @override
  State<EnterChangePassScr> createState() => _EnterChangePassScrState();
}

class _EnterChangePassScrState extends State<EnterChangePassScr> {
  TextEditingController confirmPass = TextEditingController();
  TextEditingController password = TextEditingController();
  final FocusNode _password = FocusNode();
  final FocusNode _confirmPass = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/image/logo.svg",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppTextInputField(
                    label: "Mật khẩu",
                    requiredLabel: true,
                    hint: "Nhập mật khẩu",
                    showPassword: true,
                    obscureText: true,
                    controller: password,
                    textInputType: TextInputType.visiblePassword,
                    focusNode: _password,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_confirmPass);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextInputField(
                    label: "Nhập lại mật khẩu",
                    requiredLabel: true,
                    hint: "Nhập lại mật khẩu",
                    controller: confirmPass,
                    focusNode: _confirmPass,
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    showPassword: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: context.width,
                    height: 44,
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                      onPressed: () {
                        Get.offAll(()=> const SignInScr());
                      },
                      child: const Text(
                        "Xác nhận",
                        style: TextStyle(color: ColorApp.whiteFA),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/image/phone.svg"),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Hỗ trợ: 0987686780",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
