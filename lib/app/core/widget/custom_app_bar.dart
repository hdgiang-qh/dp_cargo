import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/widget/app_bar_title.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final double? height;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
    this.height, this.centerTitle,
  });

  @override
  Size get preferredSize {
    if (height != null) {
      return Size.fromHeight(height!);
    }
    return AppBar().preferredSize;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: centerTitle?? true,
      elevation: 0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions ?? [],
      iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
      title: AppBarTitle(text: appBarTitleText),
    );
  }
}
