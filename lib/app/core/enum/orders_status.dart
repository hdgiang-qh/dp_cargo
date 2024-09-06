import 'dart:ui';

import 'package:flutter/material.dart';

import '../values/app_colors.dart';

enum OrderStatus {
  all('Tất cả', AppColors.allTracking, AppColors.allTrackingSelected),
  waitingForWarehouseUS('Chờ nhập kho US', AppColors.waitingForWarehouseUS, AppColors.waitingForWarehouseUSSelected),
  enteredWarehouseUS('Đã nhập kho US', AppColors.enteredWarehouseUS, AppColors.enteredWarehouseUSSelected),
  transportingToVN('Đang vận chuyển về VN', AppColors.transportingToVN, AppColors.transportingToVNSelected),
  enteredWarehouseVN('Đã nhập kho VN', AppColors.enteredWarehouseVN, AppColors.enteredWarehouseVNSelected),
  exploited('Đã khai thác', AppColors.exploited, AppColors.exploitedSelected),
  packed('Đã đóng hàng', AppColors.packed, AppColors.packedSelected),
  delivering('Đang giao hàng', AppColors.delivering, AppColors.deliveringSelected),
  completed('Hoàn thành', AppColors.completed, AppColors.completedSelected),
  cancelled('Đã hủy bỏ', AppColors.canceled, AppColors.canceledSelected);

  final String value;
  final Color color;
  final Color selectedColor;

  const OrderStatus(this.value, this.color, this.selectedColor);

  static OrderStatus? fromValue(String? value) {
    if (value == null) return null;
    try {
      return OrderStatus.values.firstWhere(
        (status) => status.value == value,
      );
    } catch (e) {
      return null;
    }
  }
}
enum OrderStatusvn {
  all('Tất cả', AppColors.allTracking, AppColors.allTrackingSelected),
  waitingForWarehouseUS('Chờ nhập kho US', AppColors.waitingForWarehouseUS, AppColors.waitingForWarehouseUSSelected),
  enteredWarehouseUS('Đã nhập kho US', AppColors.enteredWarehouseUS, AppColors.enteredWarehouseUSSelected),
  transportingToVN('Đang vận chuyển về vn', AppColors.transportingToVN, AppColors.transportingToVNSelected),
  enteredWarehouseVN('Đã vận chuyển về vn', AppColors.enteredWarehouseVN, AppColors.enteredWarehouseVNSelected),
  exploited('Đã khai thác', AppColors.exploited, AppColors.exploitedSelected),
  packed('Đã đóng hàng', AppColors.packed, AppColors.packedSelected),
  delivering('Đang giao hàng', AppColors.delivering, AppColors.deliveringSelected),
  completed('Hoàn thành', AppColors.completed, AppColors.completedSelected),
  cancelled('Đã hủy bỏ', AppColors.canceled, AppColors.canceledSelected);

  final String value;
  final Color color;
  final Color selectedColor;

  const OrderStatusvn(this.value, this.color, this.selectedColor);

  static OrderStatusvn? fromValue(String? value) {
    if (value == null) return null;
    try {
      return OrderStatusvn.values.firstWhere(
            (status) => status.value == value,
      );
    } catch (e) {
      return null;
    }
  }
}
Color statusOrderColor(String status){
  Color color = Colors.black54;
  switch(status){
    case "Chờ nhập kho US":
      color = Color(0xffF2994A);
    case "Đã nhập kho US":
      color = Color(0xffB573C7);
    case "Đang vận chuyển về vn":
      color = Color(0xff70BBFD);
    case "Đã nhập kho VN":
      color = Color(0xff4DACC8);
    case "Đã khai thác":
      color = Color(0xff367A56);
    case "Đã đóng hàng":
      color = Color(0xff2D346F);
    case "Đang giao hàng":
      color = Color(0xffFFCB00);
    case "Hoàn thành":
      color = Color(0xff27AE60);
    case "Đã hủy bỏ":
      color = Color(0xffCC3333);
  }
  return color;
}
Color statusBGOrderColor(String status){
  Color color = Colors.black54;
  switch(status){
    case "Chờ nhập kho US":
      color = Color(0x33F2994A);
    case "Đã nhập kho US":
      color = Color(0x33B573C7);
    case "Đang vận chuyển về vn":
      color = Color(0x3370BBFD);
    case "Đã nhập kho VN":
      color = Color(0x334DACC8);
    case "Đã khai thác":
      color = Color(0x33367A56);
    case "Đã đóng hàng":
      color = Color(0x332D346F);
    case "Đang giao hàng":
      color = Color(0x33FFCB00);
    case "Hoàn thành":
      color = Color(0x3327AE60);
    case "Đã hủy bỏ":
      color = Color(0x33CC3333);
  }
  return color;
}


