import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/color_app.dart';
import '../../../routes/app_pages.dart';
import '../view/report_item.dart';

class ItemReport extends StatefulWidget {
  final int index;
  final String title, content, svgPath;

  const ItemReport(
      {super.key,
      required this.index,
      required this.title,
      required this.content,
      required this.svgPath});

  @override
  State<ItemReport> createState() => _ItemReportState();
}

class _ItemReportState extends State<ItemReport> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.REPORT, arguments: widget.index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: ColorApp.greyA9),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: const BoxDecoration(),
              child: Transform.scale(
                  scale: 1.0, child: SvgPicture.asset(widget.svgPath)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: widget.content != "" ? 10 : 0,
                ),
                widget.content != ""
                    ? Text(widget.content,
                        style: const TextStyle(
                            fontSize: 13, color: ColorApp.grey74))
                    : const SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
