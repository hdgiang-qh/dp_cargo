import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../data/model/model/awb.dart';
import '../../../common_widget/item_detail_list_widget.dart';
import '../../../common_widget/item_list_widget.dart';

class MawbView extends StatefulWidget {
  final AWBModel awbModel;

  const MawbView({
    super.key,
    required this.awbModel,
  });

  @override
  State<MawbView> createState() => _MawbViewState();
}

class _MawbViewState extends State<MawbView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(color: Colors.black12)),
          color: Colors.white
      ),
      child: Column(children: [
        Container(
          height: 28,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: widget.awbModel.exploitStatus?.colorBg
          ),
          child: Center(
            child: Text(
                widget.awbModel.exploitStatus?.value ?? S.current.isNull,
              style: TextStyle(color: widget.awbModel.exploitStatus?.color)
            ),
          ),
        ),
        Row(children: [
          Gap(16.w),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(
                  text: "${widget.awbModel.code}"));
              Fluttertoast.showToast(
                  msg: "Đã copy",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },
            child: SvgPicture.asset("assets/image/copy_text.svg"),
          ),
          Gap(8.w),
          Text(
            "${widget.awbModel.code}",
            style: const TextStyle(
                fontSize: 13,
                color: textPrimary,
                fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
          )
        ]),
        ItemDetailListWidget(head: "Số lượng tracking", endText: "${widget.awbModel.trackingQuantity ?? "--"}"),
        ItemDetailListWidget(head: "TLTT/TLKT(kg)", endText: "${widget.awbModel.trackingMiningWeight ?? S.current.isNull} kg"),
        ItemDetailListWidget(head: "Tổng tiền(VNĐ)", endText: "${formatNumberCommas("${widget.awbModel.trackingTotalMoney ?? 0}")} đ"),
      ]),
    );
  }
}