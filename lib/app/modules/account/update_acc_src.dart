
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/textfield_widget.dart';


class UpdateAccountScr extends StatefulWidget {
  const UpdateAccountScr({super.key});

  @override
  State<UpdateAccountScr> createState() => _UpdateAccountScrState();
}

class _UpdateAccountScrState extends State<UpdateAccountScr> {
  int _selectedValue = 1;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedValue = value ?? 1;
    });
  }

  Widget buildRadioBox() {
    return SizedBox(
      height: 24,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Radio(
                  activeColor: primaryColor,
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: _handleRadioValueChange,
                ),
                const Text("Nam"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Radio(
                  activeColor: primaryColor,
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: _handleRadioValueChange,
                ),
                const Text("Nữ"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Radio(
                  activeColor: primaryColor,
                  value: 3,
                  groupValue: _selectedValue,
                  onChanged: _handleRadioValueChange,
                ),
                const Text("Khác"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cập nhật tài khoản",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: context.width,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                  color: primaryColor, shape: BoxShape.circle),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                  color: const Color(0xffFAEBEB),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: const Center(
                  child: Text(
                "Chọn ảnh",
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("Dụng lượng file tối đa 1 MB"),
            const Text("Định dạng:.JPEG, .PNG"),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              height: 1,thickness: 0.5,
            ),
            const SizedBox(
              height: 16,
            ),
            const AppTextInputField(
              label: "Họ và tên",
              hint: "Họ và tên",
            ),
            const SizedBox(
              height: 16,
            ),
            const AppTextInputField(
              label: "Email",
              hint: "Nhập email",
            ),
            const SizedBox(
              height: 16,
            ),
            const AppTextInputField(
              label: "Ngày sinh",
              hint: "Ngày sinh",
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Giới tính",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1f1f1f))),
                buildRadioBox()
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  onTap: (){},
                  buttonText: "Đổi mật khẩu",
                  width: 164,
                  bgcolor: ColorApp.greyF2,
                ),
                ButtonWidget(
                  onTap: (){},
                  buttonText: "Xác nhận",
                  width: 164,
                  bgcolor: primaryColor,
                  textColor: ColorApp.whiteFA,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
