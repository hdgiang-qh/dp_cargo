
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'const.dart';


class FilterSearch extends StatefulWidget {
  final bool readOnly;
  final bool enable;
  final bool showSuffix;
  final bool obscureText;
  final bool showLabel;
  final bool textEnd;
  final TextEditingController? controller;
  final String? hint;
  final String? error;
  final String? suffixPath;
  final Widget? leading;
  final Widget? trailing;
  final String? label;
  final FocusNode? focusNode;
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
  final Function? onPress;

  const FilterSearch(
      {super.key,
      this.readOnly = false,
      this.showSuffix = false,
      this.obscureText = false,
      this.enable = true,
      this.controller,
      this.hint,
      this.leading,
      this.trailing,
      this.focusNode,
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
      this.onPress,
      this.suffixPath,
      this.label, this.showLabel = false,  this.textEnd = false});

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  late final FocusNode _focusNode;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;
    _focusNode.addListener(() {
      setState(() {});
    });
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
       widget.showLabel ? Align(
         alignment: Alignment.topLeft,
         child: Text("${widget.label}",
             style: const TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.w500,
               color: Color(0xff1f1f1f),
             )),
       ): Container(),
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
          cursorColor: const Color(0xff902524),
          enabled: widget.enable,
          textAlign: widget.textEnd ? TextAlign.end : TextAlign.start,
          focusNode: _focusNode,
          initialValue: widget.initialValue,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          style: const TextStyle(fontSize: 13),
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
            suffixIcon: widget.showSuffix
                ? GestureDetector(
                    onTap: widget.onPress as void Function()?,
                    child: Transform.scale(
                        scale: 0.6,
                        child: SvgPicture.asset("${widget.suffixPath}")))
                : null,
            suffixIconColor: const Color(0xFFB9B9B9),
            hintText: widget.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ColorApp.greyA9, fontSize: 14),
            errorText: widget.error,
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: ColorApp.greyA9)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: primaryColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: ColorApp.greyA9)),
          ),
        ),
      ],
    );
  }
}
