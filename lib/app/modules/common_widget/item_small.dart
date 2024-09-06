import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'const.dart';

class ItemSmall extends StatelessWidget {
  final String svgPath;
  final String value;
  const ItemSmall({super.key, required this.svgPath, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SvgPicture.asset(svgPath),
          Gap(4.w),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 13, fontWeight: FontWeight.w400, color: textPrimary),
          )
        ],
      ),
    );
  }
}
