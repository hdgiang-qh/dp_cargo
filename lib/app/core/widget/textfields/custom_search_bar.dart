import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../../utils/validator.dart' as av;

import '../../../../gen/assets.gen.dart';
import '../../values/app_colors.dart';
import '../../values/app_text_styles.dart';

class CustomSearchBar extends StatefulWidget {
  final TextfieldTagsController? controller;
  final List<String>? initialTags;
  final String? Function(String dynamic)? validator;
  final String? hintText;
  final double? borderRadius;
  final void Function(String)? onSubmitted;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.initialTags,
    this.validator,
    this.hintText,
    this.borderRadius,
    this.onSubmitted,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> with av.Validator {
  late TextfieldTagsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextfieldTagsController();
  }

  final TextEditingController _editingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFieldTags(
          textEditingController: _editingController,
          inputFieldBuilder: (context, textFieldTagValues) => Padding(
            padding: const EdgeInsets.all(0),
            child: TextField(
              controller: textFieldTagValues.textEditingController,
              cursorColor: AppColors.greyScale,
              focusNode: textFieldTagValues.focusNode,
              decoration: InputDecoration(
                fillColor: Colors.white,
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 6),
                  borderSide: const BorderSide(
                    color: AppColors.bordersFlat,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 6),
                  borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 6),
                  borderSide: const BorderSide(
                    color: AppColors.bordersFlat,
                    width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 6),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 6),
                  borderSide: const BorderSide(
                    width: 1,
                  ),
                ),
                contentPadding: EdgeInsets.only(top: 14.h, bottom: 14.h, left: 14.w, right: 50.w),
                hintText: textFieldTagValues.tags.isNotEmpty ? '' : widget.hintText,
                hintStyle: Theme.of(context).BodyText1.copyWith(color: const Color(0xff828282)),
                errorText: textFieldTagValues.error,
                prefixIcon: textFieldTagValues.tags.isNotEmpty
                    ? Container(
                        padding: EdgeInsets.only(right: 50.w),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: SingleChildScrollView(
                          controller: textFieldTagValues.tagScrollController,
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 9.h, top: 9.h, right: 12.w),
                            child: Row(
                                children: textFieldTagValues.tags.map((e) {
                              final tag = e;
                              return Container(
                                constraints: BoxConstraints(maxWidth: 136.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 6),
                                  border: Border.all(
                                    color: AppColors.bordersFlat,
                                    width: 1,
                                  ),
                                ),
                                margin: const EdgeInsets.only(right: 8.0),
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        child: Text(
                                          tag,
                                          maxLines: 1,
                                          style: Theme.of(context).BodyText1.copyWith(
                                              color: const Color(0xff828282), overflow: TextOverflow.ellipsis),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    InkWell(
                                      child: const Icon(
                                        Icons.close,
                                        size: 14.0,
                                        color: Color(0xffbdbdbd),
                                      ),
                                      onTap: () {
                                        textFieldTagValues.onTagRemoved(tag);
                                      },
                                    )
                                  ],
                                ),
                              );
                            }).toList()),
                          ),
                        ),
                      )
                    : null,
              ),
              onChanged: textFieldTagValues.onTagChanged,
              onSubmitted: (val) {
                textFieldTagValues.onTagSubmitted.call(val);
                widget.onSubmitted?.call(textFieldTagValues.tags.map((e) => e).toList().join(','));
              },
            ),
          ),
          textfieldTagsController: _controller,
          initialTags: widget.initialTags,
          textSeparators: const [' ', ','],
          letterCase: LetterCase.normal,
          // validator: widget.validator ?? checkEmptyY,
        ),
        Positioned(
          right: 14,
          top: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              _controller.onTagSubmitted.call(_editingController.text);
              widget.onSubmitted?.call(_controller.getTags!.map((e) => e).toList().join(","));
            },
            child: Assets.icons.icSearchHome.svg(),
          ),
        )
      ],
    );
  }

  String? checkEmptyY(text) {
    if (text is! String) {
      return null;
    }
    if (text.trim().isEmpty) {
      return 'Vui lòng nhập';
    } else {
      return null;
    }
  }
}
