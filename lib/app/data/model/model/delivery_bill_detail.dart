import '../../../modules/common_widget/const.dart';
import '../../../core/enum/delivery_bill_status.dart';
import 'tracking_bill.dart';

import 'customer.dart';
import 'package:json_annotation/json_annotation.dart';

import 'employee.dart';
import 'vn_delivery_box.dart';
import 'vn_delivery_order.dart';

part 'delivery_bill_detail.g.dart';

@JsonSerializable()
class DeliveryBillDetail {
  int? id;
  String? code;
  String? customerName;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  DeliveryStatus? deliveryBillStatus;
  String? customerAddress;
  String? customerPhone;
  String? description;
  String? note;
  bool? isConfirmedByCustomer;
  bool? isPackaged;
  bool? isCharged;
  int? createdById;
  List<TrackingsBill>? trackings;
  List<VnDeliveryOrder>? vnDeliveryOrder;
  List<VnDeliveryBox>? vnDeliveryBoxes;
  Customer? customer;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? email;
  String? updatedById;
  Employee? employee;
  double? totalTrackingMiningWeight;
  double? totalTrackingCalculationWeight;
  int? trackingTotalMoney;
  String? shipperNote;
  String? deliveredImageUrl;

  DeliveryBillDetail(
      {this.id,
      this.code,
      this.customerName,
      this.deliveryBillStatus,
      this.customerAddress,
      this.customerPhone,
      this.description,
      this.note,
      this.isConfirmedByCustomer,
      this.isPackaged,
      this.isCharged,
      this.createdById,
      this.trackings,
      this.vnDeliveryOrder,
      this.vnDeliveryBoxes,
      this.customer,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.email,
      this.updatedById,
      this.employee,
      this.totalTrackingMiningWeight,
      this.totalTrackingCalculationWeight,
      this.trackingTotalMoney,
      this.shipperNote,
      this.deliveredImageUrl});

  factory DeliveryBillDetail.fromJson(Map<String, dynamic> json) =>
      _$DeliveryBillDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryBillDetailToJson(this);

  static DeliveryStatus? _statusFromJson(String? value) =>
      DeliveryStatus.fromValue(value);

  static String? _statusToJson(DeliveryStatus? status) => status?.value;

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }

  String get formattedTrackingTotalMoney2 {
    return Const.convertPrice(trackingTotalMoney);
  }

  String get formattedTrackingTotalWeight {
    return Const.convertWeight(totalTrackingCalculationWeight);
  }

  String get formattedTrackingMiningWeight {
  return Const.convertWeight2(totalTrackingMiningWeight);}

}


@JsonSerializable()
class AddTrackingDeliveryBill {
  int? id;
  String? code;
  String? customerName;
  String? deliveryBillStatus;
  String? customerAddress;
  String? customerPhone;
  String? description;
  String? note;
  bool? isConfirmedByCustomer;
  bool? isPackaged;
  bool? isCharged;
  int? createdById;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? email;
  String? updatedById;
  String? deliveredImageUrl;
  String? shipperNote;
  String? message;

  AddTrackingDeliveryBill({
    this.id,
    this.code,
    this.customerName,
    this.deliveryBillStatus,
    this.customerAddress,
    this.customerPhone,
    this.description,
    this.note,
    this.isConfirmedByCustomer,
    this.isPackaged,
    this.isCharged,
    this.createdById,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
    this.updatedById,
    this.deliveredImageUrl,
    this.shipperNote,
    this.message,
  });
 factory AddTrackingDeliveryBill.fromJson(Map<String, dynamic> json) => _$AddTrackingDeliveryBillFromJson(json);

  Map<String, dynamic> toJson() => _$AddTrackingDeliveryBillToJson(this);
}

