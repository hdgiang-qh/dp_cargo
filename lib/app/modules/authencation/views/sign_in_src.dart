
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';
import 'package:vncss/app/modules/forget_password/view/forget/confirm_phone.dart';


class SignInScr extends StatefulWidget {
  const SignInScr({super.key});

  @override
  State<SignInScr> createState() => _SignInScrState();
}

class _SignInScrState extends State<SignInScr> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  final FocusNode _name = FocusNode();
  final FocusNode _password = FocusNode();

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
                children: [const SizedBox(height: 10,),
                  SvgPicture.asset(
                    "assets/image/logo.svg",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 20,
                    child: Text(
                      "Chào mừng trở lại!",
                      style: TextStyle(color: Color(0xff747474), fontSize: 13),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppTextInputField(
                    label: "Email hoặc số điện thoại",
                    requiredLabel: true,
                    hint: "Nhập Email hoặc số điện thoại",
                    controller: name,
                    focusNode: _name,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_password);
                    },
                  ),
                  AppTextInputField(
                    label: "Mật khẩu",
                    requiredLabel: true,
                    hint: "Nhập mật khẩu",
                    controller: password,
                    focusNode: _password,
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    showPassword: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {Get.to(()=> const ConfirmPhoneScr());},
                        child: const Text(
                          "Quên mật khẩu?",
                          style: TextStyle(
                            fontSize: 13,
                            color: primaryColor,
                          ),
                        )),
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

                      },
                      child: const Text(
                        "Đăng nhập",
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
