
import 'package:flutter/material.dart';
import 'package:vncss/app/modules/common_widget/const.dart';


class CustomTextFieldUpdate extends StatelessWidget {
  final double? width;
  final double? height;
  final String? hintText;
  final IconButton? icon;
  final String? text;
  final String? requiredText;
  final TextEditingController? controller;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final Function(String)? onCompleted;

  const CustomTextFieldUpdate(
      {super.key,
      this.hintText,
      this.text,
      this.requiredText,
      this.controller,
      this.errorText,
      this.validator,
      this.onChanged,
      this.onCompleted,
      this.icon,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$text",
            style: const TextStyle(
              fontSize: 16,
              color: ColorApp.greyA9,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextField(
            style: const TextStyle(
              fontSize: 16,
              color: textPrimary,
              fontWeight: FontWeight.w400,
            ),
            controller: controller,
            decoration: InputDecoration(
                enabled: false,
                hintText: hintText,
                suffixIcon: icon,
                errorText: errorText),
          ),
        ],
      ),
    );
  }
}
