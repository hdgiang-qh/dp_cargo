import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:vncss/app/data/model/model/orders.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_text_styles.dart';
import '../../../../common_widget/item_list_widget.dart';

class OrderWidget extends StatelessWidget {
  final Orders order;
  const OrderWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        children: [
          Column(children: [
            ItemListWidget(
              showIcon: true,
              showChip: true,
              fontWeightHead: true,
              svgPath: "assets/image/copy_text.svg",
              headText:  "${order.orderId}",
              color: order.status?.selectedColor,
              endText: "${order.status?.value}",
              colorText: order.status?.color,
              onCopyText: () {
                Clipboard.setData(ClipboardData(
                    text: "${order.orderId}"));
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
            ItemListWidget(headText: "Mã tracking", endText: order.code ?? "--"),
            ItemListWidget(headText: "Khách hàng:", endText: order.customer?.name ?? "--"),
            ItemListWidget(headText: "Loại hàng :", endText: "${order.trackingType?.name ?? "--"}"  ),
          ]),
        ],
      ),
    );
  }
}