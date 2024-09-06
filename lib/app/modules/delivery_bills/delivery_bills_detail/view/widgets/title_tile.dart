import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/values/app_text_styles.dart';

class TitleTileOrder extends StatelessWidget {
  final Widget icon;
  final String label;
  const TitleTileOrder({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: icon,
              ),
              Gap(8.w),
              Text(label, style: Theme.of(context).neutralTextTile, )
            ],
      ),
    );
  }
}
