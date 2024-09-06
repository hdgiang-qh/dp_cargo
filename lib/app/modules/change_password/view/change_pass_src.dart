
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';


class ChangePassScr extends StatefulWidget {
  const ChangePassScr({super.key});

  @override
  State<ChangePassScr> createState() => _ChangePassScrState();
}

class _ChangePassScrState extends State<ChangePassScr> {
  TextEditingController oldPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  final FocusNode _oldPass = FocusNode();
  final FocusNode _newPass = FocusNode();
  final FocusNode _confirmPass = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Đổi mật khẩu",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 8,),
            AppTextInputField(
              label: "Nhập mật khẩu cũ",
              requiredLabel: true,
              controller: oldPass,
              focusNode: _oldPass,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_newPass);
              },
              hint: "Nhập mật khẩu",
            ),
            const SizedBox(height: 8,),
            AppTextInputField(
              label: "Nhập mật khẩu mới",
              requiredLabel: true,
              controller: newPass,
              focusNode: _newPass,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_confirmPass);
              },
              hint: "Nhập mật khẩu",
            ),
            const SizedBox(height: 8,),
            AppTextInputField(
              label: "Xác nhận mật khẩu cũ",
              requiredLabel: true,
              controller: confirmPass,
              focusNode: _confirmPass,
              hint: "Nhập mật khẩu",
            ),
            const SizedBox(height: 16,),
            ButtonWidget(
              onTap: (){},
              buttonText: "Cập nhật",
              width: context.width,
              textColor: ColorApp.whiteFA,
              bgcolor: primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
