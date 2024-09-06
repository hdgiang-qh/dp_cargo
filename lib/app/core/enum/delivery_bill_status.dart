import 'dart:ui';
import 'package:flutter/material.dart';

enum DeliveryStatus {
  newDeliveryBill('Phiếu mới tạo',  Color(0xffF2994A), Color(0x33F2994A)),
  saleApproved('Sale duyệt',  Color(0xffB573C7), Color(0x33B573C7)),
  accountantApproved("Kế toán duyệt", Color(0xff0057E8), Color(0x330057E8)),
  warehouse("Yêu cầu xuất kho", Color(0xff4DACC8), Color(0x334DACC8)),
  packing('Đã đóng hàng',   Color(0xff2D346F), Color(0x332D346F)),
  delivering('Đang giao hàng', Color(0xffFFCB00), Color(0x33FFCB00)),
  completed('Hoàn thành đơn hàng',  Color(0xff27AE60), Color(0x3327AE60)),
  uncompleted('Đơn hàng giao không thành công', Color(0xffCC3333), Color(0x33CC3333)),
  cancelled('Hủy PXK', Color(0xffCC3333), Color(0x33CC3333));

  final String value;
  final Color color;
  final Color colorBg;

  const DeliveryStatus(this.value, this.color, this.colorBg);

  static DeliveryStatus? fromValue(String? value) {
    if (value == null) return null;
    try {
      return DeliveryStatus.values.firstWhere(
        (status) => status.value == value,
      );
    } catch (e) {
      return null;
    }
  }
}
