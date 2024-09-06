import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/app_colors.dart';
import '../../values/app_text_styles.dart';

class AppTextFieldWidget extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final String? label;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool isPasswordField;
  final EdgeInsets? padding;
  final bool? filled;
  final Color? fillColor;
  final Widget? prefixIcon;
  final TextStyle? labelStyle;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool required;
  final Widget? leftLabel;
  final Widget? suffixIcon;
  final int? maxLine;
  final bool isUpCase;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final bool enable;
  final bool textAlign;

  const AppTextFieldWidget({
    super.key,
    this.inputController,
    this.onChanged,
    this.textInputType,
    this.label,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.padding,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.labelStyle,
    this.readOnly = false,
    this.textAlign = false,
    this.onTap,
    this.required = false,
    this.leftLabel,
    this.suffixIcon,
    this.maxLine = 1,
    this.isUpCase = false,
    this.errorText,
    this.focusedBorder,
    this.labelText,
    this.enabledBorder,
    this.isPasswordField = true,
    this.borderRadius,
    this.inputFormatters,
    this.enable = true,
  });

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: widget.label != null,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label ?? "",
                    style: widget.labelStyle ?? Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
                  ),
                  Visibility(
                    visible: widget.required,
                    child: Text(
                      " (*)",
                      style: widget.labelStyle ?? Theme.of(context).BodyText1.copyWith(color: AppColors.errorColor),
                    ),
                  ),
                  const Spacer(),
                  widget.leftLabel ?? const SizedBox()
                ],
              ),
            )),
        TextFormField(
          enabled: widget.enable,
          maxLines: widget.isPasswordField ? 1 : widget.maxLine,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign ? TextAlign.end : TextAlign.start,
          controller: widget.inputController,
          cursorColor: AppColors.greyScale,
          obscureText: _obscureText,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          style: Theme.of(context).BodyText1,
          inputFormatters: widget.isUpCase
              ? [
                  UpperCaseTextFormatter(),
                ]
              : widget.inputFormatters,
          decoration: InputDecoration(
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 16.w),
                      child: widget.prefixIcon,
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
                borderSide: const BorderSide(
                  color: AppColors.neutral300,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
                borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
                borderSide: const BorderSide(
                  color: AppColors.neutral300,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
                borderSide: const BorderSide(
                  color: AppColors.neutral300,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
                borderSide: const BorderSide(
                  width: 1,
                ),
              ),
              labelText: widget.labelText,
              errorText: widget.errorText,
              filled: widget.filled,
              fillColor: widget.fillColor ?? Colors.white,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).BodyText1.copyWith(color: const Color(0xff828282)),
              contentPadding: widget.padding ?? EdgeInsets.symmetric(horizontal: 0.h, vertical: 12.w),
              suffixIconConstraints: const BoxConstraints(maxHeight: 24),
              prefixIconConstraints: const BoxConstraints(maxHeight: 24),
              suffixIcon: Padding(
                padding: EdgeInsets.only(left: 10.w, right:widget.textAlign ? 0.w : 16.w),
                child: widget.suffixIcon ??
                    (widget.obscureText
                        ? GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: _obscureText
                                  ? const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.black,
                                    )
                                  : const Icon(Icons.remove_red_eye, color: Colors.black),
                            ),
                          )
                        : null),
              )),
          keyboardType: widget.textInputType,
          onChanged: widget.onChanged,
          validator: widget.validator,
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class ThousandSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('.', '').replaceAll(',', '');

    // Định dạng lại chuỗi dựa trên số lượng chữ số
    String formattedText = _formatNumber(newText);

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatNumber(String s) {
    if (s.length <= 3) {
      return s;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      buffer.write(s[s.length - 1 - i]);
      if ((i + 1) % 3 == 0 && i != s.length - 1) {
        buffer.write('.');
      }
    }

    // Đảo ngược chuỗi để có định dạng đúng
    return buffer.toString().split('').reversed.join('');
  }
}
