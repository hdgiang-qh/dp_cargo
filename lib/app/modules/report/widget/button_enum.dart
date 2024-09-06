import 'package:flutter/material.dart';

class ButtonEnum extends StatelessWidget {
  final String buttonText;
  final double? height;
  final double? width;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final Border? border;
  final bool isSelected;

  const ButtonEnum(
      {super.key,
      this.height,
      this.width,
      this.bgColor,
      this.textColor,
      this.borderColor,
      this.border,
      required this.buttonText,
      this.isSelected = false,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: bgColor,
          border: border,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              buttonText,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
