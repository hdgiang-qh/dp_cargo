import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';

class SelectedHeading extends StatelessWidget {
  SelectedHeading(
      {super.key, this.text, required this.leading, this.onTap, this.textSpan});
  final String? text;
  Widget? textSpan;
  Widget leading;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: leading,
      title: textSpan ??
          Text(
            text ?? '',
            style:
                Theme.of(context).BodyText1.copyWith(color: AppColors.neutral),
          ),
    );
  }
}
