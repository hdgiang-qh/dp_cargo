import 'dart:ui';

import '../values/app_colors.dart';

enum BoxesStatus {
  newCode(0, "Mã mới tạo", AppColors.waitingForWarehouseUS),
  delivering(1, "Đang giao hàng", AppColors.delivering),
  delivered(2, "Giao thành công", AppColors.completed),
  deliveryFailed(3, "Giao thất bại", AppColors.cancelled),
  cancelled(4, "Đã hủy bỏ", AppColors.cancelled);

  final int id;
  final String value;
  final Color color;

  const BoxesStatus(this.id, this.value, this.color);

  static BoxesStatus? fromId(int? id) {
    if (id == null) return null;
    try {
      return BoxesStatus.values.firstWhere(
        (status) => status.id == id,
      );
    } catch (e) {
      return null;
    }
  }
}