import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/values/app_colors.dart';
import 'const.dart';

class TitleDetailList extends StatelessWidget {
  final String? svgPath, svgPathEnd;
  final String? headText, endText;
  final bool showEnd;

  const TitleDetailList(
      {super.key,
      this.svgPath,
      this.svgPathEnd,
      this.headText,
      this.endText,
      this.showEnd = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  "$svgPath",
                  color: AppColors.primary,
                  width: 24,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    "$headText",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          showEnd
              ? Row(
                  children: [
                    SvgPicture.asset("$svgPathEnd"),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "$endText",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
