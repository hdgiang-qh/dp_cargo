

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/account/update_acc_src.dart';
import 'package:vncss/app/modules/account/widget/item_choose.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/button_widget.dart';

import '../change_password/view/change_pass_src.dart';
import 'information_src.dart';
import 'policy_src.dart';


class AccountScr extends StatefulWidget {
  const AccountScr({super.key});

  @override
  State<AccountScr> createState() => _AccountScrState();
}

class _AccountScrState extends State<AccountScr> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/image/logo.svg"),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5, color: const Color(0xffc4c4c4)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/image/note.svg"),
                          const Text(
                            "Chọn kho",
                            style:
                                TextStyle(fontSize: 13, color: ColorApp.grey7F),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nguyễn Văn Sinh - NVGH001",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("DP-HN Official")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tài khoản",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      ItemChoose(
                        onTap: () {
                          Get.to(()=> const UpdateAccountScr());
                        },
                        title: 'Cập nhật tài khoản',
                        pre: Icons.insert_emoticon,
                      ),
                      ItemChoose(
                        onTap: () {
                          Get.to(()=> const InformationScr());
                        },
                        title: 'Chi tiết tài khoản',
                        pre: Icons.account_circle,
                      ),
                      ItemChoose(
                        onTap: () {
                          Get.to(()=> const ChangePassScr());
                        },
                        title: 'Đổi mật khẩu',
                        pre: Icons.sync_lock,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Chính sách - Hỗ trợ",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      ItemChoose(
                        onTap: () {
                         Get.to(()=> const PolicyScr());
                        },
                        title: 'Điều khoản và chính sách',
                        pre: Icons.security,
                      ),
                      ItemChoose(
                        onTap: () {},
                        title: 'Chia sẻ trên MXH',
                        pre: Icons.share,
                      ),
                      ItemChoose(
                        onTap: () {},
                        title: 'Đăng xuất',
                        pre: Icons.logout_sharp,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Thông báo",
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Thông báo & Nhắc nhở", style: TextStyle(
                                fontSize: 16),),
                                Text(
                                  "Cập nhật về giá giảm. mục dạo và các chương trình khác trên ứng dụng",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: ColorApp.greyA9, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Switch(
                                activeColor: const Color(0xff26a44d),
                                value: show,
                                inactiveThumbColor: Colors.white,
                                onChanged: (bool value) {
                                  setState(() {
                                    show = value;
                                  });
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                  width: context.width,
                  buttonText: 'Xoá tài khoản',
                  bgcolor: primaryColor,
                  textColor: ColorApp.whiteFA,
                  onTap: (){},
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
