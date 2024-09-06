import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/base/base_view.dart';
import '../../../common_widget/item_list_widget.dart';
import '../../../util/images.dart';
import '../controller/bill_customer_detail_controller.dart';

class BillCustomerDetail extends BaseView<BillCustomerDetailController> {
  Future<void> onRefreshPage() async {
    await controller.getBillCustomerDetail();
  }

  @override
  Widget body(BuildContext context) {
    return const BillCustomerDetailView();
  }
}

class BillCustomerDetailView extends StatefulWidget {
  const BillCustomerDetailView();

  @override
  State<BillCustomerDetailView> createState() => _BillCustomerDetailViewState();
}

class _BillCustomerDetailViewState extends State<BillCustomerDetailView> {
  final controller = Get.find<BillCustomerDetailController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Obx(() {
                return controller.billCustomerDetail.isEmpty
                    ? Center(child: Text("Chưa có phiếu xuất kho", style: TextStyle(fontSize: 16),))
                    : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.billCustomerDetail.length,
                      itemBuilder: (context, index){
                        return Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(children: [
                            ItemListWidget(
                              showIcon: true,
                              showChip: true,
                              fontWeightHead: true,
                              svgPath: "assets/image/copy_text.svg",
                              headText:  "${controller.billCustomerDetail[index].code}",
                              color: controller.billCustomerDetail[index].deliveryBillStatus?.colorBg,
                              endText: controller.billCustomerDetail[index].deliveryBillStatus?.value ?? S.current.isNull ,
                              colorText: controller.billCustomerDetail[index].deliveryBillStatus?.color,
                            ),
                            ItemListWidget(
                              headText: "Khách hàng",
                              showIcon: true,
                              endText: controller.billCustomerDetail[index].customer?[0]?.name ?? S.current.isNull,
                              svgPath: Images.customer2,
                            ),
                            ItemListWidget(
                              headText: "Địa chỉ",
                              showIcon: true,
                              svgPath: Images.local,
                              endText: controller.billCustomerDetail[index].customer?[0]?.address ?? S.current.isNull ,
                            ),
                            Divider(color: Colors.grey,),
                            Row(children: [
                              Gap(16.w),
                              Icon(Icons.menu, color: Colors.grey, size: 14,),
                              Gap(8.w),
                              Text("Danh sách mã vận đơn", style: TextStyle(color: Colors.grey, fontSize: 13),)
                            ]),
                            Container(
                              height: 30*controller.billCustomerDetail[index].vnDeliveryOrder!.length.toDouble(),
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.billCustomerDetail[index].vnDeliveryOrder?.length ?? 0,
                                  itemBuilder: (context, indexOrder){
                                    return ItemListWidget(
                                        headText: "${controller.billCustomerDetail[index].vnDeliveryOrder?[indexOrder]?.code}",
                                        endText: "${controller.billCustomerDetail[index].vnDeliveryOrder?[indexOrder]?.quantity ?? 0} box",
                                        fontWeightHead: true
                                    );
                                  }),
                            ),
                          ]),
                        );
                      });
              }),
            ),
      ]),
    );
  }
}
