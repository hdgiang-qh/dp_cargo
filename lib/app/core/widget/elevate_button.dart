import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../values/app_colors.dart';
import '../values/app_text_styles.dart';

class RedButton extends StatefulWidget {
  final double? height;
  final double? width;
  final String text;
  final BorderRadius? radius;
  final Widget? prefixIcon;
  final Color? color;
  final TextStyle? style;
  final Border? border;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const RedButton(
      {super.key,
      required this.text,
      this.onTap,
      this.height,
      this.width,
      this.prefixIcon,
      this.suffixIcon,
      this.radius,
      this.color,
      this.style,
      this.border});

  @override
  State<RedButton> createState() => _RedButtonState();
}

class _RedButtonState extends State<RedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 48.h,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: widget.color ?? Theme.of(context).primaryColor,
          borderRadius: widget.radius ?? BorderRadius.circular(8),
          border: widget.border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.prefixIcon ?? const SizedBox.shrink(),
            Center(
                child: Text(
              widget.text,
              style: widget.style ??
                  Theme.of(context)
                      .BodyText1
                      .copyWith(color: AppColors.neutralsWhite),
            )),
            widget.suffixIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class WhiteButton extends StatefulWidget {
  final double? height;
  final double? width;
  final String text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const WhiteButton(
      {super.key,
      required this.text,
      this.onTap,
      this.height,
      this.width,
      this.prefixIcon,
      this.suffixIcon});

  @override
  State<WhiteButton> createState() => _WhiteButtonState();
}

class _WhiteButtonState extends State<WhiteButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 48.h,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1.0, color: AppColors.primary)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.prefixIcon ?? const SizedBox.shrink(),
            Center(
                child: Text(
              widget.text,
              style: Theme.of(context)
                  .BodyText1
                  .copyWith(color: AppColors.primary),
            )),
            widget.suffixIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class NeutralsButton extends StatefulWidget {
  final double? height;
  final double? width;
  final String text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const NeutralsButton(
      {super.key,
      required this.text,
      this.onTap,
      this.height,
      this.width,
      this.prefixIcon,
      this.suffixIcon});

  @override
  State<NeutralsButton> createState() => _NeutralsButtonState();
}

class _NeutralsButtonState extends State<NeutralsButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 48.h,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppColors.neutral03,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.prefixIcon ?? const SizedBox.shrink(),
            Center(
                child: Text(
              widget.text,
              style: Theme.of(context)
                  .BodyText1
                  .copyWith(color: AppColors.neutrals08),
            )),
            widget.suffixIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
