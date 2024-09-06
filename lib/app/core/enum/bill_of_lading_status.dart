import 'package:flutter/material.dart';

import '../utils/color_app.dart';

enum BillOfLadingStatus {
  all(10,"Tất cả",primaryColor),
  newCode(0, "Mã mới tạo",ColorApp.yellowFF),
  delivering(1, "Đang giao hàng",ColorApp.orangeF2),
  complete(2, "Hoàn thành",ColorApp.green08),
  deliveryFailed(3, "Giao hàng không thành công",ColorApp.redE7),
  cancelled(4, "Đã hủy bỏ",ColorApp.redB6);

  final int id;
  final String value;
  final Color color;


  const BillOfLadingStatus(this.id, this.value,this.color);

  static BillOfLadingStatus? fromId(int? id) {
    if (id == null) return null;
    try {
      return BillOfLadingStatus.values.firstWhere(
            (status) => status.id == id,
      );
    } catch (e) {
      return null;
    }
  }
  static BillOfLadingStatus? fromValue(String? value) {
    try {
      return BillOfLadingStatus.values.firstWhere(
            (values) => values.value == value,
      );
    } catch (e) {
      return null;
    }
  }
}