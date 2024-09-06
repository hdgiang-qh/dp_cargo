import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/converter_utils.dart';
import '../../../../data/model/model/config_price.dart';
import '../../../common_widget/item_detail_list_widget.dart';

class ItemBottomSheetConfigPrice extends StatelessWidget {
  ConfigPriceData configPrice;
  ItemBottomSheetConfigPrice({required this.configPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: configPrice.configValue?.config?.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(children: [
                ItemDetailListWidget(head: "Loại hàng hóa:", endText: "${configPrice.configValue?.config?[index]!.trackingType?.trackingType ?? ""}", fontWeight: true,),
                ItemDetailListWidget(head: "Kho:", endText: "${configPrice.configValue?.config?[index]!.warehouseConfigId?.warehouse}", fontWeight: true,),
                ItemDetailListWidget(head: "Giá cước:", endText: "${formatNumberCommas("${configPrice.configValue?.config?[index]?.cost ?? 0}")} đ", fontWeight: true,)

              ]),
            );
          }
      ),
    );
  }
}
