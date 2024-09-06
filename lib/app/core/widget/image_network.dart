import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_colors.dart';

class CacheNetworkImage extends StatefulWidget {
  final String? image;
  final double? height;
  final double? width;
  final ImageWidgetBuilder? imageBuilder;

  const CacheNetworkImage({super.key, this.image, this.height, this.width, this.imageBuilder});

  @override
  State<CacheNetworkImage> createState() => _CacheNetworkImageState();
}

class _CacheNetworkImageState extends State<CacheNetworkImage> {
  @override
  void didUpdateWidget(covariant CacheNetworkImage oldWidget) {
    if (oldWidget.image != widget.image) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.image ?? '',
      imageBuilder: widget.imageBuilder ??
          (context, imageProvider) {
            return Container(
              height: widget.height ?? 50.h,
              width: widget.width ?? 50.w,
              decoration: BoxDecoration(image: DecorationImage(image: imageProvider)),
            );
          },
      placeholder: (_, __) {
        return Container(
          height: widget.height ?? 50.h,
          width: widget.width ?? 50.w,
          decoration: const BoxDecoration(color: AppColors.suffixImageColor),
        );
      },
      errorWidget: (_, __, ___) {
        return Container(
          height: widget.height ?? 50.h,
          width: widget.width ?? 50.w,
          decoration: const BoxDecoration(color: AppColors.suffixImageColor),
          child: const Icon(Icons.error),
        );
      },
    );
  }
}
