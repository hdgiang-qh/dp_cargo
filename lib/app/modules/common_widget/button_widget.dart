import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'const.dart';

class ButtonWidget extends StatelessWidget {
  final bool enalble;
  final String buttonText;
  final String? assetPath;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final IconData? icon;
  final Color? bgcolor;
  final Color? textColor;
  final Color borderColor;
  final Function? onTap;
  final bool showIcon;
  final bool createDelivery;

  const ButtonWidget({
    super.key,
    required this.buttonText,
    this.enalble = true,
    this.margin,
    this.width,
    this.height,
    this.fontSize,
    this.icon,
    this.bgcolor,
    this.textColor,
    this.borderColor = ColorApp.whiteFA,
    this.onTap,
    this.showIcon = false,
    this.assetPath,
    this.createDelivery = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enalble ? onTap as void Function()? : null ,
      child: Container(
        width: createDelivery ? 90 : width,
        height: createDelivery ? 90 : 44,
       // padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: margin,
        decoration: BoxDecoration(
            color: bgcolor,
            border: Border.all(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon ? SvgPicture.asset("$assetPath") : Container(),
            showIcon
                ? const SizedBox(
                    width: 5,
                  )
                : Container(),
            Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
