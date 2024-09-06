import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../generated/l10n.dart';
import '../values/app_colors.dart';
import '../values/app_values.dart';

class MediaPermission {
  static String appName = 'cargo';
  static var picker = ImagePicker();

  static Future<File?> checkPermissionAndPickImage(
      String type, BuildContext context) async {
    if (type == 'gallery') {
      return await getImage(ImageSource.gallery);
    }
    if (type == 'camera') {
      return await getImage(ImageSource.camera);
    }
    return null;
  }

  static Future<File?> getImage(ImageSource imageSource) async {
    try {
      final pickedFile =
          await picker.pickImage(source: imageSource, imageQuality: 100);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      throw (e.toString());
    }
    return null;
  }

  static Future<bool> bottomDialog(
      String title, String content, BuildContext context) async {
    final bool openSetting = await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('Không cho phép'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Cho phép'),
          ),
        ],
      ),
    );
    return openSetting;
  }

  static Future bottomErrorDialog(BuildContext context) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
          title: const Text('Có lỗi xảy ra!'),
          content: const Text('Quyền truy cập đã bị từ chối.'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => Navigator.pop(context, false),
              child: const Text('OK'),
            ),
          ]),
    );
  }

  static Future<Uint8List> testComporessList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 50,
    );
    return result;
  }

  static Future<File?> showBottomSelectImage(BuildContext context) {
    return showModalBottomSheet<File?>(
        context: context,
        builder: (context) {
          return const BottomSelectImage();
        });
  }
}

class BottomSelectImage extends StatefulWidget {
  const BottomSelectImage({super.key});

  @override
  State<BottomSelectImage> createState() => _BottomSelectImageState();
}

class _BottomSelectImageState extends State<BottomSelectImage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.margin_20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(8),
            Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffe2eaf3))),
            const Gap(8),
            Text(
              S.of(context).select_media,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const Gap(8),
            ListTile(
              onTap: () async {
                final file = await MediaPermission.checkPermissionAndPickImage(
                    'gallery', context);
                if (context.mounted) {
                  Navigator.pop(context, file);
                }
              },
              textColor: AppColors.lineColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(
                'Thư viện',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.primary),
              ),
            ),
            Gap(16.h),
            ListTile(
              onTap: () async {
                final file = await MediaPermission.checkPermissionAndPickImage(
                    'camera', context);
                if (context.mounted) {
                  Navigator.pop(context, file);
                }
              },
              textColor: AppColors.lineColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(
                'Camera',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.primary),
              ),
            ),
            const Gap(23),
          ],
        ),
      ),
    );
  }
}
