import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import '../values/app_text_styles.dart';

class AppBarTitle extends StatelessWidget {
  final String text;

  const AppBarTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).TitleStyle.copyWith(color: AppColors.neutralsWhite),
      textAlign: TextAlign.center,
    );
  }
}
