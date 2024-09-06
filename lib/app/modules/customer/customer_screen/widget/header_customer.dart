import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/model/model/overview.dart';
import '../../../common_widget/const.dart';
import '../../../util/images.dart';

class HeaderCustomerWidget extends StatelessWidget {
  OverviewModel overviewData;
  HeaderCustomerWidget({required this.overviewData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        Container(
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(children: [
                    SvgPicture.asset("assets/image/coin2.svg", color: Colors.amber, width: 24,),
                    const SizedBox(width: 16,),
                    Column(children: [
                      Container(
                          width: 113,
                          alignment: Alignment.topLeft,
                          child: Text("Công nợ", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400))
                      ),
                      Container(
                          width: 113,
                          alignment: Alignment.topLeft,
                          child: Text(Const.formatNumberEng("${overviewData.totalBalance ?? 0}"), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),)
                      )
                    ]),
                  ]),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(children: [
                    Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            shape: BoxShape.circle
                        ),
                        child: SvgPicture.asset("assets/image/tick.svg")
                    ),
                    const SizedBox(width: 16,),
                    Column(children: [
                      Container(
                          width: 113,
                          alignment: Alignment.topLeft,
                          child: Text("Tổng thanh toán", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400))
                      ),
                      Container(
                          width: 113,
                          alignment: Alignment.topLeft,
                          child: Text(Const.formatNumberEng("${overviewData.totalPayment ?? 0}"), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),)
                      )
                    ]),
                  ]),
                )),
          ]),
        ),
        const SizedBox(height: 16),
        Container(
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(children: [
                    SvgPicture.asset("assets/image/coin2.svg", color: Colors.red, width: 24,),
                    const SizedBox(width: 16,),
                    Column(children: [
                      Container(
                          width: 113,
                          alignment: Alignment.topLeft,
                          child: Text("Tiền đã nạp", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400))
                      ),
                      Container(
                          width: 113,
                          alignment: Alignment.topLeft,
                          child: Text(Const.formatNumberEng("${overviewData.totalDeposit ?? 0}"), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),)
                      )
                    ]),
                  ]),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(children: [
                    Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            color: Colors.amber.shade100,
                            shape: BoxShape.circle
                        ),
                        child: SvgPicture.asset("assets/image/person_timer.svg")
                    ),
                    const SizedBox(width: 16,),
                    Column(children: [
                      Container(
                          width: 113,
                          alignment: Alignment.topLeft,
                          child: Text("Tổng số lượng khách", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400))
                      ),
                      Container(
                          width: 113,
                          alignment: Alignment.topLeft,
                          child: Text("${overviewData.customerCount}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),)
                      )
                    ]),
                  ]),
                )),
          ]),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Row(children: [
                  SvgPicture.asset(Images.tag, color: Colors.blue,),
                  const Text("Được công nợ", style: TextStyle(fontSize: 13, color: Colors.blue))
                ])),
            Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Images.tag, color: Colors.green),
                      const Text("Free ship", style: TextStyle(fontSize: 13, color: Colors.green),)
                    ])),
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(Images.tag, color: Colors.red),
                        const Text("Thu tiền trước", style: TextStyle(fontSize: 13, color: Colors.red),)
                      ]),
                ))
          ]),
        )
      ]),
    );
  }
}
