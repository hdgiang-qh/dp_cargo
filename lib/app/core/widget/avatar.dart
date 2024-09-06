import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../utils/media_permission.dart';
import '../values/app_colors.dart';
import '../values/app_text_styles.dart';

class AvatarWidget extends StatefulWidget {
  final String? url;
  final double? height;
  final ValueChanged<File>? onChanged;
  final double? sizeIcon;

  const AvatarWidget({super.key, this.url, this.height, this.onChanged, this.sizeIcon});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  File? avatarFile;

  Widget get defaultAvatar {
    return GestureDetector(
      onTap: widget.onChanged != null
          ? () async {
              final newFile =
                  await MediaPermission.showBottomSelectImage(context);
              if (newFile != null) {
                setState(() {
                  avatarFile = newFile;
                });
                widget.onChanged?.call(avatarFile!);
              }
            }
          : null,
      child: CircleAvatar(
        radius: widget.height ?? 50.r,
        backgroundColor: AppColors.text_grey,
        child: Icon(
          Icons.person,
          size: widget.sizeIcon ?? 70.r,
          color: AppColors.neutral06,
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AvatarWidget oldWidget) {
    if (oldWidget.url != widget.url) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        avatarWidget(),
        Visibility(
          visible: widget.onChanged != null,
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final newFile =
                        await MediaPermission.showBottomSelectImage(context);
                    if (newFile != null) {
                      setState(() {
                        avatarFile = newFile;
                      });
                      widget.onChanged?.call(avatarFile!);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 16.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.neutral06)),
                    child: Text(
                      'Chọn ảnh',
                      style:
                          Theme.of(context).BodyText2Bold.copyWith(height: 1.2),
                    ),
                  ),
                ),
              ),
              Gap(12.h),
              Center(
                  child: Text(
                'Dụng lượng file tối đa 1 MB',
                style: Theme.of(context).BodyText1,
              )),
              Gap(12.h),
              Center(
                  child: Text(
                'Định dạng:.JPEG, .PNG',
                style: Theme.of(context).BodyText1,
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget avatarWidget() {
    if (avatarFile != null) {
      return GestureDetector(
        onTap: widget.onChanged != null
            ? () async {
                final newFile =
                    await MediaPermission.showBottomSelectImage(context);
                if (newFile != null) {
                  setState(() {
                    avatarFile = newFile;
                  });
                  widget.onChanged?.call(avatarFile!);
                }
              }
            : null,
        child: Container(
          height: widget.height ?? 100.h,
          width: widget.height ?? 100.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: FileImage(avatarFile!), fit: BoxFit.cover)),
        ),
      );
    }
    if (widget.url == null) {
      return defaultAvatar;
    }
    return CachedNetworkImage(
      imageUrl: widget.url!,
      imageBuilder: (context, imageProvider) {
        return GestureDetector(
          onTap: widget.onChanged != null
              ? () async {
                  final newFile =
                      await MediaPermission.showBottomSelectImage(context);
                  if (newFile != null) {
                    setState(() {
                      avatarFile = newFile;
                    });
                    widget.onChanged?.call(avatarFile!);
                  }
                }
              : null,
          child: Container(
            height: widget.height ?? 100.h,
            width: widget.height ?? 100.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          ),
        );
      },
      errorWidget: (_, __, ___) {
        return defaultAvatar;
      },
    );
  }
}
