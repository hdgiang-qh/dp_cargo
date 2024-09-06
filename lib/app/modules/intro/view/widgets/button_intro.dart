import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';

class LoginButton extends StatefulWidget {
  final double? height;
  final double? width;
  final String text;
  final VoidCallback? onTap;

  const LoginButton({super.key, required this.text, this.onTap, this.height, this.width});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: widget.height ?? 48.h,
          width: widget.width ?? 382.w,
          padding: EdgeInsets.symmetric(horizontal: 9.w),
          decoration: BoxDecoration(
              color: AppColors.neutralsWhite,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1.0, color: AppColors.primary)),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundColor: AppColors.circleBackground1,
                  child: Assets.icons.accountCircle
                      .svg(colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn))),
              Gap(12.w),
              Expanded(
                child: Center(
                    child: Text(
                  widget.text,
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.primary),
                )),
              ),
              const Icon(
                Icons.arrow_forward,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterButton extends StatefulWidget {
  final double? height;
  final double? width;
  final String text;
  final VoidCallback? onTap;

  const RegisterButton({super.key, required this.text, this.onTap, this.height, this.width});

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: widget.height ?? 48.h,
          width: widget.width ?? 382.w,
          padding: EdgeInsets.symmetric(horizontal: 9.w),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(width: 1.0, color: AppColors.neutralsWhite)),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundColor: AppColors.circleBackground2,
                  child: Assets.icons.accountCircle
                      .svg(colorFilter: const ColorFilter.mode(AppColors.neutralsWhite, BlendMode.srcIn))),
              Gap(12.w),
              Expanded(
                child: Center(
                    child: Text(
                  widget.text,
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutralsWhite),
                )),
              ),
              const Icon(
                Icons.arrow_forward,
                color: AppColors.neutralsWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
