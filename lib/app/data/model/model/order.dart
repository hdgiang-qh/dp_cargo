import '../../../core/enum/orders_status.dart';
import 'business_parter.dart';
import 'customer.dart';
import 'exploited_by.dart';
import 'tracking_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  int? id;
  String? code;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  OrderStatus? status;
  TrackingsType? trackingType;
  String? description;
  BusinessPartner? businessPartner;
  DateTime? importDate;
  DateTime? packedDate;
  DateTime? exportDate;
  DateTime? exploitedDate;
  bool? isRepack;
  BusinessPartner? warehouse;
  Customer? customer;
  bool? isSplit;
  bool? isDeleted;
  String? note;
  String? exploitStatus;
  int? shippingFee;
  String? trackingMiningWeight;
  String? trackingCalculationWeight;
  String? trackingBarrelCoefficient;
  String? trackingShippingCost;
  String? trackingShippingFee;
  String? trackingSurcharge;
  String? trackingDeliveryFee;
  String? trackingOtherFee;
  String? imageUrl;
  String? trackingTotalMoney;
  String? weight;
  int? trackingAmount;
  String? orderId;
  BusinessPartner? warehouseVn;
  ExploitedBy? exploitedBy;
  ExploitedBy? sale;
  String? price;
  String? uid;
  String? createdAt;
  String? updatedAt;
  bool? isRenamed;
  String? productName;
  bool? hasError;


  Order(
      {this.id,
      this.code,
      this.trackingType,
      this.description,
      this.businessPartner,
      this.importDate,
      this.packedDate,
      this.exportDate,
      this.exploitedDate,
      this.isRepack,
      this.warehouse,
      this.customer,
      this.isSplit,
      this.isDeleted,
      this.note,
      this.imageUrl,
      this.exploitStatus,
      this.shippingFee,
      this.trackingMiningWeight,
      this.trackingCalculationWeight,
      this.trackingBarrelCoefficient,
      this.trackingShippingCost,
      this.trackingShippingFee,
      this.trackingSurcharge,
      this.trackingDeliveryFee,
      this.trackingOtherFee,
      this.trackingTotalMoney,
      this.weight,
      this.trackingAmount,
      this.orderId,
      this.warehouseVn,
      this.exploitedBy,
      this.sale,
      this.price,
      this.uid,
      this.createdAt,
      this.updatedAt,
      this.isRenamed,
      this.productName,
      this.hasError,
      this.status});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  static OrderStatus? _statusFromJson(String? value) => OrderStatus.fromValue(value);
  static String? _statusToJson(OrderStatus? status) => status?.value;
}
