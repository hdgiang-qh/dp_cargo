import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_text_styles.dart';

class AppbarCustom extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final double? height;
  final bool? centerTitle;
  final Widget? leading;
  final Widget? titleWidget;
  final double? width;
  final Color? backGroundColor;
  final Color? iconColor;
  final double? titleSpace;

  const AppbarCustom(
      {super.key,
      this.title,
      this.actions,
      this.height,
      this.centerTitle,
      this.leading,
      this.titleWidget,
      this.width,
      this.backGroundColor,
      this.iconColor,
      this.titleSpace});

  @override
  State<AppbarCustom> createState() => _AppbarCustomState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}

class _AppbarCustomState extends State<AppbarCustom> {
  Widget? get title {
    if (widget.titleWidget != null) return widget.titleWidget;
    if (widget.title != null) {
      return Text(widget.title!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.leading,
      actions: widget.actions,
      centerTitle: widget.centerTitle,
      titleSpacing: widget.titleSpace,
      elevation: 0,
      leadingWidth: widget.width,
      title: title,
      titleTextStyle: Theme.of(context).TitleStyle.copyWith(color: AppColors.greyScale),
      iconTheme: Theme.of(context).appBarTheme.iconTheme?.copyWith(color: widget.iconColor ?? AppColors.primary),
      backgroundColor: widget.backGroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
    );
  }
}
