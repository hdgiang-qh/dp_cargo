import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../utils/media_permission.dart';
import '../../values/app_colors.dart';
import '../../values/app_text_styles.dart';
import 'dart:ui' as ui;

class ImageUploadTransaction extends StatefulWidget {
  final ValueChanged<File?>? onChanged;
  final String? image;

  const ImageUploadTransaction({super.key, this.onChanged, this.image});

  @override
  State<ImageUploadTransaction> createState() => _ImageUploadTransactionState();
}

class _ImageUploadTransactionState extends State<ImageUploadTransaction> {
  File? filePick;

  Widget get imageFile {
    Image image = Image.file(filePick!);
    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) => completer.complete(info.image)));
    return Stack(
      children: [
        FutureBuilder<ui.Image>(
            future: completer.future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AspectRatio(
                  aspectRatio: snapshot.data!.width.toDouble() / snapshot.data!.height.toDouble(),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: FileImage(filePick!), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(5.r)),
                  ),
                );
              }
              return const SizedBox();
            }),
        GestureDetector(
          onTap: () {
            setState(() {
              filePick = null;
            });
            widget.onChanged?.call(filePick);
          },
          child: const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  CupertinoIcons.clear,
                  color: AppColors.text_white,
                ),
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.image != null) {
      return CachedNetworkImage(
        imageUrl: widget.image!,
        imageBuilder: (context, imageProvider) {
          Completer<ui.Image> completer = Completer<ui.Image>();
          imageProvider
              .resolve(const ImageConfiguration())
              .addListener(ImageStreamListener((ImageInfo info, bool _) => completer.complete(info.image)));
          return FutureBuilder<ui.Image>(
              future: completer.future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AspectRatio(
                    aspectRatio: snapshot.data!.width.toDouble() / snapshot.data!.height.toDouble(),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(5.r)),
                    ),
                  );
                }
                return const SizedBox();
              });
        },
      );
    }
    return GestureDetector(
      onTap: widget.onChanged == null
          ? null
          : () async {
              final file = await MediaPermission.showBottomSelectImage(context);
              if (file != null) {
                setState(() {
                  filePick = file;
                });
                widget.onChanged?.call(file);
              }
            },
      child: filePick != null
          ? imageFile
          : DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(8.r),
              color: AppColors.dottedBorder,
              child: Container(
                padding: EdgeInsets.all(16.r),
                color: AppColors.blueColorBack,
                child: Row(
                  children: [
                    Assets.icons.icGallery.svg(),
                    Gap(12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.upload_image,
                            style:
                                Theme.of(context).Subtitle2Medium.copyWith(fontSize: 13, color: AppColors.dottedBorder),
                          ),
                          Text(
                            'Chỉ hỗ trợ định dạng PNG, PDF, JPEG với dung lượng <10MB mỗi ảnh hoặc PDF.',
                            style: Theme.of(context).labelNavBarStyle.copyWith(color: AppColors.text_hint_2),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
