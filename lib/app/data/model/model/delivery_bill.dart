import '../../../core/enum/orders_status.dart';
import '../../../core/enum/delivery_bill_status.dart';
import '../../../modules/common_widget/const.dart';
import 'box.dart';
import 'tracking_bill.dart';

import 'customer.dart';
import 'package:json_annotation/json_annotation.dart';

import 'employee.dart';
import 'vn_delivery_box.dart';
import 'vn_delivery_order.dart';

part 'delivery_bill.g.dart';

@JsonSerializable()
class DeliveryBill {
  int? id;
  String? code;
  String? customerName;
  @JsonKey(
      fromJson: _statusFromJson,
      toJson: _statusToJson,
      name: 'deliveryBillStatus')
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
  List<Customer>? customer;
  List<VnDeliveryOrder>? vnDeliveryOrder;
  List<VnDeliveryBox>? vnDeliveryBoxes;
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

  DeliveryBill(
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
      this.customer,
      this.vnDeliveryOrder,
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

  factory DeliveryBill.fromJson(Map<String, dynamic> json) =>
      _$DeliveryBillFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryBillToJson(this);

  static DeliveryStatus? _statusFromJson(String? value) =>
      DeliveryStatus.fromValue(value);

  static String? _statusToJson(DeliveryStatus? status) => status?.value;

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }
}

class TotalBillModel {
  String? name;
  int? total;
  int? id;

  TotalBillModel({
    this.name,
    this.total,
    this.id,
  });

  TotalBillModel.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    total = json['total']?.toInt();
    id = json['id']?.toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['total'] = total;
    data['id'] = id;
    return data;
  }
}

class CreateBillModelTags {
  int? id;
  String? name;
  String? color;

  CreateBillModelTags({
    this.id,
    this.name,
    this.color,
  });

  CreateBillModelTags.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    color = json['color']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}

@JsonSerializable()
class CreateBillModel {
  int? id;
  String? name;
  String? phone;
  String? nickName;
  String? balance;
  int? moneyTemporary;
  List<CreateBillModelTags?>? tags;
  int? quantityTracking;
  double? totalExploitWeight;
  double? totalFlyingWeight;

  CreateBillModel({
    this.id,
    this.name,
    this.phone,
    this.nickName,
    this.balance,
    this.moneyTemporary,
    this.tags,
    this.quantityTracking,
    this.totalExploitWeight,
    this.totalFlyingWeight,
  });

  factory CreateBillModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBillModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBillModelToJson(this);

  String get formattedMoneyTemporary {
    return Const.convertPrice(moneyTemporary);
  }

  String get formattedTotalFlyingWeight {
    return Const.convertWeight(totalFlyingWeight);
  }

  String get formattedBalance {
    return Const.convertPrice(balance);
  }
}

@JsonSerializable()
class TrackingCustom {
  int? id;
  String? code;
  List<CreateBillModelTags?>? trackingType;
  String? description;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  OrderStatus? status;
  String? importDate;
  String? packedDate;
  String? exploitedDate;
  List<Box?>? box;
  List<Box?>? awb;
  @JsonKey(fromJson: _exploitStatusFromJson, toJson: _exploitStatusToJson)
  OrderStatus? exploitStatus;
  String? trackingMiningWeight;
  String? trackingCalculationWeight;
  String? trackingBarrelCoefficient;
  String? trackingShippingCost;
  String? trackingShippingFee;
  String? trackingSurcharge;
  String? trackingDeliveryFee;
  String? trackingOtherFee;
  int? trackingDiscountAmount;
  String? trackingTotalMoney;
  int? trackingAmount;
  String? orderId;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? vnPackedDate;
  String? vnImportDate;
  String? vnExportDate;
  int? vnPackedById;
  String? productName;

  TrackingCustom({
    this.id,
    this.code,
    this.trackingType,
    this.description,
    this.status,
    this.exploitedDate,
    this.box,
    this.awb,
    this.exploitStatus,
    this.trackingMiningWeight,
    this.trackingCalculationWeight,
    this.trackingBarrelCoefficient,
    this.trackingShippingCost,
    this.trackingShippingFee,
    this.trackingSurcharge,
    this.trackingDeliveryFee,
    this.trackingOtherFee,
    this.trackingDiscountAmount,
    this.trackingTotalMoney,
    this.trackingAmount,
    this.orderId,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.vnPackedDate,
    this.vnImportDate,
    this.vnExportDate,
    this.vnPackedById,
    this.productName,
  });

  factory TrackingCustom.fromJson(Map<String, dynamic> json) =>
      _$TrackingCustomFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingCustomToJson(this);

  static OrderStatus? _statusFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _statusToJson(OrderStatus? status) => status?.value;

  static OrderStatus? _exploitStatusFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _exploitStatusToJson(OrderStatus? exploitStatus) =>
      exploitStatus?.value;

  String get formattedTrackingCalculationWeight {
    return Const.convertWeight(trackingCalculationWeight);
  }

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }

  double get doubleTrackingTotalMoney{
   return double.parse(trackingTotalMoney ?? "0.0");
  }

  int get intTrackingDiscountAmount{
   return int.parse(trackingDiscountAmount.toString());
  }

  double get doubleTrackingSurcharge{
    return double.parse(trackingSurcharge ?? "0.0");
  }

  double get doubleTrackingOtherFee{
    return double.parse(trackingOtherFee ?? "0.0");
  }
}
