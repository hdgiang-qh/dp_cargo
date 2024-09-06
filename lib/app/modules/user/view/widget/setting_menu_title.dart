import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';

class SettingMenuTitle extends StatelessWidget {
  const SettingMenuTitle({super.key, required this.title, required this.subTitle, this.trailing, this.onTap});
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutral),),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodyMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
