
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vncss/app/modules/hotline/widget/item_choose.dart';



class HotlineScr extends StatefulWidget {
  const HotlineScr({super.key});

  @override
  State<HotlineScr> createState() => _HotlineScrState();
}

class _HotlineScrState extends State<HotlineScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        borderRadius: const BorderRadius.all(Radius.circular(4))),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/image/note.svg"),
                        const Text(
                          "Chọn kho",
                          style:
                              TextStyle(fontSize: 13, color: Color(0xff7f7f7f)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SvgPicture.asset("assets/image/hotline.svg"),
              const ItemChoose(
                pre: Icons.phone,
                title: "Điện thoại: 0987686780",
              ),
              const ItemChoose(
                pre: Icons.email_outlined,
                title: "Email: gogo@gmail.com",
              ),
              const ItemChoose(
                pre: Icons.language_outlined,
                title: "Website: http://Cargogo.com.vn",
              ),
              const ItemChoose(
                pre: Icons.location_pin,
                title: "Địa chỉ: Số 99 Lê Văn Lương, Thanh Xuân, Hà Nội",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
