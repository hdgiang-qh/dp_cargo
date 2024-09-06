import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_text_styles.dart';
import '../../../../common_widget/const.dart';

class ChipTypeStatus extends StatelessWidget {
  final Color color;
  final Color? textColor;
  final String label;
  final Color? backColor;
  final Color? selectedColor;

  final VoidCallback? onTap;
  final bool isSelected;

  const ChipTypeStatus(
      {super.key,
      required this.color,
      required this.label,
      this.onTap,
      this.textColor,
      required this.isSelected,
      this.backColor,
      this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 8.w, top: 5.h, bottom: 15.h),
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor ?? backColor : null,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(label,
                style: Theme.of(context).BodyText1.copyWith(
                    color: isSelected ? Colors.white : textColor ?? color)),
          ))),
    );
  }
}

class ChipStatus extends StatelessWidget {
  final Color color;
  final Color? textColor;
  final String label;
  final Color? backColor;
  final double? width;
  final VoidCallback? onTap;

  const ChipStatus(
      {super.key,
      required this.color,
      required this.label,
      this.onTap,
      this.textColor,
      this.backColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      decoration: BoxDecoration(
          color: color,
          borderRadius:
          const BorderRadius.all(Radius.circular(8))),
      child: Text(
        label,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: textColor ?? ColorApp.whiteFA, fontSize: 13,fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ChipTypeStatusB extends StatelessWidget {
  final Color color;
  final Color? textColor;
  final String label;
  final VoidCallback? onTap;
  final bool isSelected;

  const ChipTypeStatusB({
    super.key,
    required this.color,
    required this.label,
    this.onTap,
    this.textColor,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 8.w, top: 5.h, bottom: 15.h),
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: isSelected ? color : null,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(label,
                style: Theme.of(context).BodyText1.copyWith(
                    color: isSelected ? Colors.white : textColor ?? color)),
          ))),
    );
  }
}

class ChipStatusB extends StatelessWidget {
  final Color color;
  final Color? textColor;
  final String label;
  final VoidCallback? onTap;

  const ChipStatusB(
      {super.key,
      required this.color,
      required this.label,
      this.onTap,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(right: 14.w, left: 14.w, bottom: 4.h, top: 6.h),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(label,
                style: Theme.of(context)
                    .BodyText1
                    .copyWith(color: textColor ?? color, height: 1))));
  }
}
