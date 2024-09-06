import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/utils/converter_utils.dart';
import '../../../common_widget/item_detail_list_widget.dart';
import '../../../util/images.dart';
import '../../customer_detail/controller/detail_customer_controller.dart';


class ConfigCustomerDetail extends BaseView<DetailCustomerController> {
  Future<void> onRefreshPage() async {
    await controller.getDetailCustomers();
  }

  @override
  Widget body(BuildContext context) {
    return const ConfigCustomerDetailView();
  }
}

class ConfigCustomerDetailView extends StatefulWidget {
  const ConfigCustomerDetailView();

  @override
  State<ConfigCustomerDetailView> createState() => _ConfigCustomerDetailViewState();
}

class _ConfigCustomerDetailViewState extends State<ConfigCustomerDetailView> {
  final controller = Get.find<DetailCustomerController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Column(children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Row(children: [
            SvgPicture.asset(Images.file2),
            const SizedBox(width: 8),
            Text("${controller.customers.value.shippingCost?.configValue?.info?.title}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)
          ]),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: controller.customers.value.shippingCost?.configValue?.config?.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(children: [
                    ItemDetailListWidget(head: "Loại hàng hóa:", endText: "${controller.customers.value.shippingCost?.configValue?.config?[index]!.trackingType?.trackingType}", fontWeight: true,),
                    ItemDetailListWidget(head: "Kho:", endText: "${controller.customers.value.shippingCost?.configValue?.config?[index]!.warehouseConfigId?.warehouse}", fontWeight: true,),
                    ItemDetailListWidget(head: "Giá cước:", endText: "${formatNumberCommas("${controller.customers.value.shippingCost?.configValue?.config?[index]?.cost ?? 0}")} đ", fontWeight: true,)

                  ]),
                );
              }
          ),
        )
      ]);
    });
  }
}
