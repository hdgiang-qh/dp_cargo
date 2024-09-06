
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/common_widget/custom_textfield_update.dart';


class InformationScr extends StatefulWidget {
  const InformationScr({super.key});

  @override
  State<InformationScr> createState() => _InformationScrState();
}

class _InformationScrState extends State<InformationScr> {
  TextEditingController name = TextEditingController(text: "Trần Bình An");
  TextEditingController address =
      TextEditingController(text: "Bố của Shipper");
  TextEditingController phone = TextEditingController(text: "02403638758");
  TextEditingController date = TextEditingController(text: "22/12/2002");
  TextEditingController gender = TextEditingController(text: "Nam");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
            height: 26,
            width: 26,
            child: IconButton(
                onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back))),
        title: const Text(
          "Thông tin cá nhân",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                      width: 32,
                      height: 32,
                      top: 67,
                      left: 56,
                      child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffF5F5F5)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              size: 14,
                            ),
                          )))
                ],
              ),
              Column(
                children: [
                  CustomTextFieldUpdate(
                    text: "Họ và tên",
                    controller: name,
                    hintText: "Họ và tên",
                  ),
                  CustomTextFieldUpdate(
                    text: "Chức vụ",
                    controller: address,
                    hintText: "Chức vụ",
                  ),
                  CustomTextFieldUpdate(
                    text: "Số điện thoại",
                    controller: phone,
                    hintText: "Số điện thoại",
                  ),
                  CustomTextFieldUpdate(
                    text: "Ngày sinh",
                    controller: date,
                    hintText: "dd/mm/yy",
                    icon: IconButton(
                        onPressed: () async {
                          late final formatter = DateFormat('dd/MM/yyyy');
                          DateTime? picker = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030));
                          setState(() {
                            date.text = formatter.format(picker!);
                          });
                        },
                        icon: const Icon(Icons.calendar_month)),
                  ),
                  CustomTextFieldUpdate(
                    text: "Giới tính",
                    controller: gender,
                    hintText: "Giới tính",
                  ),
                ],
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(
                    onTap: () {},
                    buttonText: "Đổi mật khẩu",
                    width: 164,
                    bgcolor: ColorApp.greyF2,
                  ),
                  ButtonWidget(
                    onTap: () {
                      Get.dialog(
                        CustomDialog(
                          title: "Bạn có chắc muốn cập nhật!",
                          onTapYes: () async {
                            Get.back();
                            Get.snackbar(
                              "GeeksforGeeks",
                              "",
                              icon: const Icon(Icons.person, color: Colors.white),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          onTapNo: () { Get.back();},
                        ),
                      );
                    },
                    buttonText: "Cập nhật",
                    width: 164,
                    bgcolor: primaryColor,
                    textColor: ColorApp.whiteFA,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
