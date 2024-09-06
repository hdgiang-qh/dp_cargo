import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:vncss/app/data/model/model/delivery_bill.dart';
import 'package:vncss/app/modules/common_widget/const.dart';


import '../../../../../../gen/assets.gen.dart';
import '../../../../../../generated/l10n.dart';
import '../../../common_widget/item_list_widget.dart';
import 'info_delivery_bill_admin.dart';


class DeliveryBillAdmin extends StatelessWidget {
  final DeliveryBill deliveryBill;
  final VoidCallback onTap;
  final bool action;

  const DeliveryBillAdmin({super.key,
    required this.onTap,
    required this.deliveryBill,
    required this.action});

  @override
  Widget build(BuildContext context) {
    int getQuantity(int? orderId) {
      return deliveryBill.vnDeliveryBoxes
          ?.where((deliveryBox) => deliveryBox.vnDeliveryOrderId == orderId)
          .length ??
          0;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Column(
              children: [
                InfoDeliveryBillAdmin(
                  label: deliveryBill.code ?? S.current.isNull,
                  data: '',
                  icon: SvgPicture.asset("assets/image/copy_text.svg"),
                  status: deliveryBill.deliveryBillStatus,
                  isCode: true,
                ),
                InfoDeliveryBillAdmin(
                  label: "Khách hàng",
                  data: deliveryBill.name ?? S.current.isNull,
                  icon: SvgPicture.asset("assets/image/add_per1.svg"),
                ),
                InfoDeliveryBillAdmin(
                  label: "Địa chỉ",
                  data: deliveryBill.customerAddress ?? S.current.isNull,
                  icon: SvgPicture.asset("assets/image/local.svg"),
                ),
                //    if (deliveryBill.vnDeliveryOrder!.isNotEmpty)
                Column(
                  children: [
                    Gap(8.h),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: ColorApp.greyD7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/image/list.svg"),
                                Gap(10.w),
                                const Text(
                                  "Danh sách mã vận đơn",
                                  style: TextStyle(
                                      color: ColorApp.grey74, fontSize: 12),
                                )
                              ],
                            ),
                            Gap(4.h),
                            Column(
                              children: deliveryBill.vnDeliveryOrder
                                  ?.map((vnDeliveryOrder) =>
                                  InfoDeliveryBillAdmin(
                                    label: vnDeliveryOrder.code ??
                                        S.current.isNull,
                                    data:
                                    '${vnDeliveryOrder.quantity} box',
                                    isCode: true,
                                  ))
                                  .toList() ??
                                  [],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

