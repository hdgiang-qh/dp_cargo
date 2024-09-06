import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vncss/app/core/utils/media_permission.dart';
import 'package:vncss/app/core/values/app_colors.dart';

import '../../../core/values/app_text_styles.dart';

class ChooseImage extends StatefulWidget {
  final String? url;
  final double? height;
  final ValueChanged<File>? onChanged;
  final double? sizeIcon;

  const ChooseImage(
      {super.key,
      this.url,
      this.height,
      this.onChanged,
      this.sizeIcon,
      });

  @override
  State<ChooseImage> createState() => ChooseImageState();
}

class ChooseImageState extends State<ChooseImage> {
  File? avatarFile;
  String? imageName;

  void deleteImage() {
    setState(() {
      avatarFile = null;
    });
  }

  @override
  void didUpdateWidget(covariant ChooseImage oldWidget) {
    if (oldWidget.url != widget.url) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

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
          height: widget.height ?? 150.h,
          width: widget.height ?? 150.w,
          decoration: BoxDecoration(
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: widget.onChanged != null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
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
                      border: Border.all(color: AppColors.neutral06)),
                  child: Text(
                    'Chọn ảnh',
                    style:
                        Theme.of(context).BodyText2Bold.copyWith(height: 1.2),
                  ),
                ),
              ),
              avatarWidget()
            ],
          ),
        ),
      ],
    );
  }
}
