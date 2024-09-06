import 'package:vncss/app/data/model/model/box.dart';
import 'package:vncss/app/data/model/model/business_parter.dart';

import '../../../core/enum/orders_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracking_customer_detail_model.g.dart';

@JsonSerializable()
class TrackingCustomerDetailModel {
  int? id;
  String? code;
  String? description;
  BusinessPartner? businessPartner;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  OrderStatus? status;
  String? importDate;
  String? packedDate;
  String? exploitedDate;
  Box? box;
  Box? awb;
  BusinessPartner? warehouse;
  TrackingCustomerDetailCustomer? customer;
  bool? isSplit;
  bool? isDeleted;
  String? imageUrl;
  String? note;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  OrderStatus? exploitStatus;
  int? shippingFee;
  String? trackingMiningWeight;
  String? trackingCalculationWeight;
  String? trackingBarrelCoefficient;
  String? trackingShippingCost;
  String? trackingShippingFee;
  String? trackingDeliveryFee;
  String? trackingOtherFee;
  int? trackingDiscountAmount;
  String? trackingTotalMoney;
  String? weight;
  TrackingCustomerDeliveryBill? deliveryBill;
  int? trackingAmount;
  String? orderId;
  BusinessPartner? warehouseVn;
  TrackingCustomerExploitedBy? exploitedBy;
  String? createdAt;
  String? updatedAt;
  bool? isRenamed;
  int? whTrackingId;
  String? vnPackedDate;
  String? vnImportDate;
  String? vnExportDate;
  int? vnPackedById;
  String? productName;

  TrackingCustomerDetailModel({this.id,
    this.code,
    this.description,
    this.businessPartner,
    this.status,
    this.importDate,
    this.packedDate,
    this.exploitedDate,
    this.box,
    this.awb,
    this.warehouse,
    this.customer,
    this.isSplit,
    this.isDeleted,
    this.imageUrl,
    this.note,
    this.exploitStatus,
    this.shippingFee,
    this.trackingMiningWeight,
    this.trackingCalculationWeight,
    this.trackingBarrelCoefficient,
    this.trackingShippingCost,
    this.trackingShippingFee,
    this.trackingDeliveryFee,
    this.trackingOtherFee,
    this.trackingDiscountAmount,
    this.trackingTotalMoney,
    this.weight,
    this.deliveryBill,
    this.trackingAmount,
    this.orderId,
    this.warehouseVn,
    this.exploitedBy,
    this.createdAt,
    this.updatedAt,
    this.isRenamed,
    this.whTrackingId,
    this.vnPackedDate,
    this.vnImportDate,
    this.vnExportDate,
    this.vnPackedById,
    this.productName});

  factory TrackingCustomerDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingCustomerDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingCustomerDetailModelToJson(this);

  static OrderStatus? _statusFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _statusToJson(OrderStatus? status) => status?.value;
}

@JsonSerializable()
class TrackingCustomerDetailCustomer {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? nickName;
  int? shippingCost;
  String? idCustomer;
  bool? isSubcribeToEmailNotification;
  bool? isSubcribeToFcmNotification;

  TrackingCustomerDetailCustomer(
      {this.id,
        this.name,
        this.phone,
        this.address,
        this.email,
        this.nickName,
        this.shippingCost,
        this.idCustomer,
        this.isSubcribeToEmailNotification,
        this.isSubcribeToFcmNotification});

  factory TrackingCustomerDetailCustomer.fromJson(Map<String, dynamic> json) =>
      _$TrackingCustomerDetailCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingCustomerDetailCustomerToJson(this);
}

@JsonSerializable()
class TrackingCustomerDeliveryBill {
  int? id;
  String? code;
  String? createdAt;

  TrackingCustomerDeliveryBill({this.id, this.code, this.createdAt});

  factory TrackingCustomerDeliveryBill.fromJson(Map<String, dynamic> json) =>
      _$TrackingCustomerDeliveryBillFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingCustomerDeliveryBillToJson(this);

}

@JsonSerializable()
class TrackingCustomerExploitedBy {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? fullname;

  TrackingCustomerExploitedBy({this.id, this.username, this.email, this.phone, this.fullname});

  factory TrackingCustomerExploitedBy.fromJson(Map<String, dynamic> json) =>
      _$TrackingCustomerExploitedByFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingCustomerExploitedByToJson(this);

}

