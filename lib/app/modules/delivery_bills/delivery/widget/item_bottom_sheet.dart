import 'package:flutter/material.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/common_widget/filter_search.dart';

import '../../../common_widget/textfield_widget.dart';



class ItemBottomSheet extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String title;
  final String? hint;
  final String? pathSuffix;
  final bool showSuffix;
  final TextInputType textInputType;
  final Function()? onTap;

  const ItemBottomSheet(
      {super.key,
      required this.controller,
      this.focusNode,
      this.nextFocusNode,
      this.hint,
      this.showSuffix = false,
      this.pathSuffix,
      required this.textInputType, required this.title, this.onTap});

  @override
  State<ItemBottomSheet> createState() => _ItemBottomSheetState();
}

final List<String> _title = [
  'Tất cả',
  'Phiếu tạo mới',
  'Sale đã duyệt',
  'Kế toán duyệt',
  'Đã đóng băng',
  'Đang giao hàng',
  "Hoàn thành",
  "Đã huỷ",
  "Yêu cầu xuất kho",
  "Giao không thành công"
];

class _ItemBottomSheetState extends State<ItemBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: ColorApp.grey74),
          ),
        ),
        Expanded(
          flex: 3,
          child: AppTextInputField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            textInputType: widget.textInputType,
            showSuffix: widget.showSuffix,
            hint: widget.hint,
            suffixPath: widget.pathSuffix,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            },
            onSuffix: widget.onTap,
          ),
        ),
      ],
    );
  }
}
