import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FeatIcon extends StatelessWidget {
  final String? textIcon;
  final double? width;
  final String pathIcon;
  final Function onTap;
  final Color? color;
  final bool showEndText;

  const FeatIcon(
      {super.key,
      this.textIcon,
      required this.pathIcon,
      required this.onTap, this.color, this.showEndText = false, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap as void Function()?,
            child: Container(
              height: 44,
              width: width ?? 44,
              margin: const EdgeInsets.only(bottom: 4),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Transform.scale(
                scale: 0.7,
                child: SvgPicture.asset(
                  pathIcon,
                ),
              ),
            ),
          ),
          showEndText ? Container() : Text(
            "$textIcon",
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
