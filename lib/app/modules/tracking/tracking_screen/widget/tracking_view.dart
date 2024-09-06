import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import '../../../../../generated/l10n.dart';
import '../../../../data/model/model/tracking.dart';
import '../../../common_widget/item_list_widget.dart';


class TrackingView extends StatefulWidget {
  final Trackings tracking;

  const TrackingView({
    super.key,
    required this.tracking,
  });

  @override
  State<TrackingView> createState() => _TrackingViewState();
}

class _TrackingViewState extends State<TrackingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(children: [
        ItemListWidget(
          showIcon: true,
          showChip: true,
          fontWeightHead: true,
          svgPath: "assets/image/copy_text.svg",
          headText:  "${widget.tracking.code}",
          color: widget.tracking.status?.selectedColor,
          endText: "${widget.tracking.status?.value}",
          colorText: widget.tracking.status?.color,
          onCopyText: () {
            Clipboard.setData(ClipboardData(
                text: "${widget.tracking.code}"));
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
        ),
        ItemListWidget(headText: "Mã đơn hàng", endText: widget.tracking.orderId ?? S.current.isNull),
        ItemListWidget(headText: "Khách hàng:", endText: widget.tracking.customer?.name ?? S.current.isNull ),
        ItemListWidget(headText: "Thời gian nhập VN:", endText: "${Const.convertDate(widget.tracking.vnImportDate)}"  ),
      ]),
    );
  }
}