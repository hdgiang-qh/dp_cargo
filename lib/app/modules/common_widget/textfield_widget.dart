import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

class AppTextInputField extends StatefulWidget {
  final bool readOnly;
  final bool enable;
  final bool showLabel;
  final bool showPassword;
  final bool showSuffix;
  final bool obscureText;
  final TextEditingController? controller;
  final String? hint;
  final String? error;
  final String? suffixPath;
  final Widget? leading;
  final Widget? trailing;
  final FocusNode? focusNode;
  final String? label;
  final TextInputType? textInputType;
  final BoxConstraints? prefixIconConstraint;
  final String? initialValue;
  final int? maxLength;
  final bool requiredLabel;
  final VoidCallback? onTap;
  final FormFieldSetter<String>? onChanged;
  final FormFieldSetter<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function? onSuffix;
  final double? border;

  const AppTextInputField(
      {super.key,
      this.readOnly = false,
      this.showPassword = false,
      this.showSuffix = false,
      this.obscureText = false,
      this.enable = true,
      this.controller,
      this.hint,
      this.leading,
      this.trailing,
      this.focusNode,
      this.label,
      this.requiredLabel = false,
      this.error,
      this.textInputType,
      this.prefixIconConstraint,
      this.initialValue,
      this.maxLength,
      this.validator,
      this.onChanged,
      this.inputFormatters,
      this.onFieldSubmitted,
      this.onTap,
      this.onSuffix,
      this.suffixPath,
      this.showLabel = false,
      this.border = 4});

  @override
  State<AppTextInputField> createState() => _AppTextInputFieldState();
}

class _AppTextInputFieldState extends State<AppTextInputField> {
  late final FocusNode _focusNode;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;
    _focusNode.addListener(() {});
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.showLabel
            ? Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("${widget.label}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: textPrimary,
                            fontStyle: FontStyle.normal)),
                  ),
                  widget.requiredLabel
                      ? const Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        )
                      : const SizedBox()
                ],
              )
            : const SizedBox(),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          onTap: widget.onTap,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          controller: widget.controller,
          cursorColor: primaryColor,
          enabled: widget.enable,
          focusNode: _focusNode,
          initialValue: widget.initialValue,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: widget.maxLength,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'https?:\/\/')),
            //FilteringTextInputFormatter.deny(RegExp(r'\.')),
          ],
          style: const TextStyle(
            fontSize: 13,
          ),
          buildCounter: (context,
              {required int currentLength,
              required bool isFocused,
              required int? maxLength}) {
            return const SizedBox();
          },
          keyboardType: widget.textInputType ?? TextInputType.text,
          onTapOutside: (event) {
            _focusNode.unfocus();
          },
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: widget.leading,
            prefixIconColor: Colors.black,
            prefixIconConstraints: widget.prefixIconConstraint,
            suffixIcon: widget.showPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ))
                : widget.showSuffix
                    ? GestureDetector(
                        onTap: widget.onSuffix as void Function()?,
                        child: Transform.scale(
                            scale: 0.5,
                            child: SvgPicture.asset("${widget.suffixPath}")))
                    : const SizedBox(),
            suffixIconColor: ColorApp.greyD7,
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorApp.greyA9,
                  fontSize: 13,
                ),
            errorText: widget.error,
            contentPadding: const EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border!),
                borderSide: const BorderSide(color: ColorApp.greyD7)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border!),
                borderSide: const BorderSide(color: primaryColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.border!),
                borderSide: const BorderSide(color: ColorApp.greyA9)),
          ),
        ),
      ],
    );
  }
}

class UppercaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
