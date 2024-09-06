import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import '../../values/app_colors.dart';
import '../../values/app_text_styles.dart';

class AppDropDownWidget<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final String? hintText;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final TextStyle? labelStyle;
  final Color? filledColor;
  final bool? filled;
  final Color? iconColor;
  final double? borderRadius;

  const AppDropDownWidget(
      {super.key,
      required this.items,
      this.value,
      this.hintText,
      this.onChanged,
      this.label,
      this.labelStyle,
      this.filledColor,
      this.filled,
      this.iconColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: label != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                label ?? "",
                style: labelStyle ?? Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
              ),
            )),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            isDense: true,
            value: value,
            isExpanded: true,
            onChanged: onChanged,
            style: Theme.of(context).BodyText1.copyWith(color: AppColors.black),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
                borderSide: const BorderSide(
                  color: AppColors.neutral300,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
                borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
                borderSide: const BorderSide(
                  color: AppColors.neutral300,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
              filled: filled,
              fillColor: filledColor ?? Colors.white,
              isDense: true,
              hintText: hintText,
              hintStyle: Theme.of(context).BodyText1.copyWith(color: const Color(0xff828282)),
              contentPadding: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h, bottom: 12.h),
            ),
            icon: Padding(
              padding: EdgeInsets.only(left: 10.w, top: 10),
              child: Assets.icons.icArrowDown.svg(),
            ),
            items: items,
          ),
        ),
      ],
    );
  }
}
