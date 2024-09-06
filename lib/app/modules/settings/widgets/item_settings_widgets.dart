import 'package:flutter/material.dart';
import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/asset_image_view.dart';
import '/app/core/widget/ripple.dart';

class ItemSettings extends StatelessWidget with BaseWidgetMixin {
  final Widget prefixImage;
  final String? suffixImage;
  final String title;
  final Function()? onTap;
  final Color? color;

  ItemSettings({
    required this.prefixImage,
    this.suffixImage,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget body(BuildContext context) {
    return Ripple(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Row(
          children: [
            prefixImage,
            const SizedBox(width: AppValues.smallPadding),
            Text(title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color, fontWeight: FontWeight.w500)),
            const Spacer(),
            if (suffixImage != null)
              AssetImageView(
                fileName: suffixImage!,
                color: AppColors.suffixImageColor,
                height: AppValues.iconSmallerSize,
                width: AppValues.iconSmallerSize,
              ),
          ],
        ),
      ),
    );
  }
}
