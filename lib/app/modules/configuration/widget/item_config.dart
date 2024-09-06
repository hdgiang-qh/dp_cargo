import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../common_widget/const.dart';
import '../../util/images.dart';
import '../../rights_group/rights_group_screen.dart';
import '../acoount_bank.dart';
import '../configuration_price.dart';

class ItemConfigView extends StatelessWidget {
  final String icon;
  final String title;
  final String subTittle;
  Function() func;

   ItemConfigView(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTittle,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: ColorApp.greyA9),
            borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          SvgPicture.asset(
            icon,
            height: 70,
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            width: 250,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              ]),
              const SizedBox(height: 4),
              Row(children: [
                SizedBox(
                    width: 250,
                    child: Text(
                      subTittle,
                      style: const TextStyle(fontSize: 16),
                    ))
              ]),
            ]),
          )
        ]),
      ),
    );
  }
}

