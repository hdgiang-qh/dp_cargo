import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/color_app.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../data/model/model/awb.dart';

class ItemListTrackingBox extends StatelessWidget {
  final AwbTrackings awbBox;
  const ItemListTrackingBox({required this.awbBox});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey))
        ),
        child: Column(children: [
          Row(children: [
            SvgPicture.asset("assets/image/note_search.svg", width: 20,color: ColorApp.grey74),
            const SizedBox(width: 8),
            Text("${awbBox.code}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)
          ]),
          Gap(10.h),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SvgPicture.asset("assets/image/scale.svg", width: 20, color: ColorApp.grey74,),
                  const SizedBox(width: 8),
                  Text("${awbBox.trackingMiningWeight ?? 0} kg", style: TextStyle(fontSize: 16,))
                ]),
                Row(children: [
                  SvgPicture.asset("assets/image/coin.svg", width: 20, color: ColorApp.grey74),
                  const SizedBox(width: 8),
                  Text("${formatNumberCommas(awbBox.trackingTotalMoney ?? "0")} đ ", style: TextStyle(fontSize: 16),)
                ]),
              ]
          )
        ])
    );
  }
}
