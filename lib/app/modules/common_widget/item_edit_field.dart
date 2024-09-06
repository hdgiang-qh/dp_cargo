import 'package:flutter/material.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import '../../core/widget/textfields/app_text_field.dart';

class ItemEditFieldWidget extends StatelessWidget {
  final String head;
  final bool fontWeight;
  final double fontSize;
  final TextEditingController controller;

  const ItemEditFieldWidget({
    super.key,
    required this.head,
    required this.controller,
    this.fontWeight = false,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Text(
              head,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: textPrimary),
            ),
          ),
          Expanded(
            child: AppTextFieldWidget(
              inputController: controller,
              textAlign: true,
              textInputType: TextInputType.number,
            ),
          )
        ],
      ),
    );
  }
}
