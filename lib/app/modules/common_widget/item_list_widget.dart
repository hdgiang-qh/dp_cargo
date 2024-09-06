import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../core/values/app_colors.dart';
import 'const.dart';

class ItemListWidget extends StatelessWidget {
  final String headText, endText;
  final String? svgPath;
  final Color? color;
  final Color? colorText;
  final bool showIcon;
  final bool showChip;
  final bool fontWeightHead;
  final bool isAddress;
  final Function()? onCopyText;

  const ItemListWidget({
    super.key,
    required this.headText,
    required this.endText,
    this.color,
    this.svgPath,
    this.showIcon = false,
    this.showChip = false,
    this.colorText,
    this.fontWeightHead = false,
    this.isAddress = false,
    this.onCopyText,
  });

  @override
  Widget build(BuildContext context) {
    String displayHeadText = headText.length > 20
        ? '...${headText.substring(headText.length - 20)}'
        : headText;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            isAddress ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: showChip ? 1 : 2,
            child: Row(
              children: [
                showIcon
                    ? GestureDetector(
                        onTap: onCopyText as void Function()?,
                        child: SvgPicture.asset(
                          "$svgPath",
                          color: AppColors.neutral,
                        ))
                    : const SizedBox(),
                showIcon
                    ? const SizedBox(
                        width: 8,
                      )
                    : const SizedBox(),
                Text(
                  displayHeadText,
                  style: TextStyle(
                      fontSize: 13,
                      color: textPrimary,
                      fontWeight:
                          fontWeightHead ? FontWeight.w700 : FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Gap(16.w),
          showChip
              ? Container(
                  width: endText.length > 25 ? context.width * 0.5 : null,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    endText,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorText ?? ColorApp.whiteFA, fontSize: 13),
                  ),
                )
              : Expanded(
                  flex: 3,
                  child: Text(
                    endText,
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: textPrimary, fontSize: 13),
                  ),
                )
        ],
      ),
    );
  }
}
