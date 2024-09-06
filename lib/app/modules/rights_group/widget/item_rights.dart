import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/util/images.dart';

import '../right_group_edit_screen.dart';

class ItemRightsView extends StatefulWidget {
  final icon;
  final tittle;
  final subTittle;
  Function() func;

  ItemRightsView(
      {Key? key,
      required this.icon,
      required this.tittle,
      required this.subTittle,
      required this.func})
      : super(key: key);

  @override
  State<ItemRightsView> createState() => _ItemRightsViewState();
}

class _ItemRightsViewState extends State<ItemRightsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 250,
            child: Row(children: [
              SvgPicture.asset(
                widget.icon,
                color: Colors.black,
                width: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.tittle,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ]),
          ),
          const SizedBox(height: 4),
          Row(children: [
            Container(
                width: 250,
                child: Text(
                  widget.subTittle,
                  style: const TextStyle(fontSize: 13),
                ))
          ]),
        ]),
        Row(children: [
          InkWell(
            onTap: () {
              Get.to(() =>  RightsGroupEditScreen());
            },
            child: Column(children: [
              SvgPicture.asset(
                Images.edit2,
              //  color: Colors.blue,
              ),
              const Text("Sửa")
            ]),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {},
            child: Column(
                children: [SvgPicture.asset(Images.trash), const Text("Xóa")]),
          )
        ])
      ]),
    );
  }
}

final List<Map<String, dynamic>> ItemRights = [
  {
    "icon": Images.truck,
    "tittle": "Shipper",
    "subTittle": "Tài khoản cho người vận chuyển nội bộ",
    "func": () {}
  },
  {
    "icon": Images.customer_support,
    "tittle": "Nhân viên CSKH",
    "subTittle": "Chăm sóc khách hàng",
    "func": () {}
  },
  {
    "icon": Images.calculator,
    "tittle": "Kế Toán",
    "subTittle": "Kế Toán",
    "func": () {}
  },
  {
    "icon": Images.pc,
    "tittle": "Nhân viên khai thác",
    "subTittle": "Khai thác",
    "func": () {}
  },
  {
    "icon": Images.bag_suicase,
    "tittle": "Quản lý",
    "subTittle": "Quản lý",
    "func": () {}
  },
  {
    "icon": Images.customer2,
    "tittle": "Khách hàng",
    "subTittle": "Khách hàng1",
    "func": () {}
  },
  {
    "icon": Images.sales_staff,
    "tittle": "Nhân viên kinh doanh",
    "subTittle": "Cái j cũng bán mỗi khi được giá",
    "func": () {}
  },
  {
    "icon": Images.superadmin,
    "tittle": "SpAdmin",
    "subTittle": "Bố",
    "func": () {}
  },
];
