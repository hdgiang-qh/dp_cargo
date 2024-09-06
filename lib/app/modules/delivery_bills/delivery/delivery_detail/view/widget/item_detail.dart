import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ItemTracking extends StatelessWidget {
  final String svgPath;
  final String title;
  final bool codeTracking;
  final bool alignEnd;

  const ItemTracking({
    super.key,
    required this.svgPath,
    required this.title,
    this.codeTracking = false,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(svgPath,color: Colors.black,),
        Gap(10.w),
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: codeTracking ? FontWeight.w700 : FontWeight.w400,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}

class ItemExpense extends StatelessWidget {
  final String title;
  final String value;
  final bool fontW;

  const ItemExpense({
    super.key,
    required this.title,
    required this.value,
    this.fontW = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: fontW ? FontWeight.w700 : FontWeight.w400,
                fontSize: 16,
                color:
                    fontW ? const Color(0xff23262f) : const Color(0xff777e90)),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
