import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../../data/model/model/data_customers.dart';
import '../../../common_widget/item_list_widget.dart';
import '../../../util/images.dart';


class ItemCustomer extends StatelessWidget {
  final DataCustomers data_customer;
  //final CommonApi commonApi = CommonApi();

  const ItemCustomer(
      {super.key,
        required this.data_customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(color: Colors.white,),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(children: [
            SvgPicture.asset(Images.customer, width: 14,),
            const SizedBox(width: 8),
            Container(width: 300, child: Text("${data_customer.customer?.name ?? S.current.isNull} - ${data_customer.customer?.nickName ?? S.current.isNull}", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),)),
          ]),
        ),
        ItemListWidget(headText: "Sale phụ trách", endText: "${data_customer.customer?.sale?.fullname ?? "--"}"),
        ItemListWidget(headText: "Nhân viên CSKH", endText: "${data_customer.customer?.customerServiceStaff?.fullname ?? "--"}"),
        ItemListWidget(headText: "Công nợ tối đa", endText: "${formatNumberCommas("${data_customer.customer?.creditAmount ?? 0}")} đ"),
        ItemListWidget(headText: "Công nợ", endText: "${formatNumberCommas("${data_customer.customer?.balance ?? 0}")} đ"),

      ]),
    );
  }
}


