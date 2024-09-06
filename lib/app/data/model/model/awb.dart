import 'package:vncss/app/data/model/model/sale.dart';

import '../../../core/enum/awb_status.dart';
import '../../../core/enum/orders_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'awb.g.dart';
@JsonSerializable()
class AWBModel {
  int? id;
  String? code;
  double? weight;
  int? boxQuantity;
  String? completedAt;
  String? flightDate;
  String? arrivalDate;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  AwbStatus? exploitStatus;
  String? createdAt;
  String? updatedAt;
  String? syncStatus;
  double? trackingTotalMoney;
  double? trackingCalculationWeight;
  double? trackingMiningWeight;
  List<String>? trackingCode;
  List<String>? boxCode;
  int? trackingQuantity;

  AWBModel(
      {this.id,
        this.code,
        this.weight,
        this.boxQuantity,
        this.completedAt,
        this.flightDate,
        this.arrivalDate,
        this.exploitStatus,
        this.createdAt,
        this.updatedAt,
        this.syncStatus,
        this.trackingTotalMoney,
        this.trackingCalculationWeight,
        this.trackingMiningWeight,
        this.trackingCode,
        this.boxCode,
        this.trackingQuantity});

  factory AWBModel.fromJson(Map<String, dynamic> json) =>
      _$AWBModelFromJson(json);

  Map<String, dynamic> toJson() => _$AWBModelToJson(this);

  static AwbStatus? _statusFromJson(String? value) =>
      AwbStatus.fromValue(value);

  static String? _statusToJson(AwbStatus? status) => status?.value;
}

@JsonSerializable()
class AwbDetailModel {
  int? id;
  String? code;
  double? weight;
  int? boxQuantity;
  String? completedAt;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  AwbStatus? exploitStatus;
  String? createdAt;
  String? updatedAt;
  String? syncStatus;
  List<BoxAwbDetail>? box;
  int? trackingTotalMoney;
  double? trackingCalculationWeight;
  double? trackingMiningWeight;
  int? trackingQuantity;
  int? trackingExploitedQuantity;

  AwbDetailModel(
      {this.id,
        this.code,
        this.weight,
        this.boxQuantity,
        this.completedAt,
        this.exploitStatus,
        this.createdAt,
        this.updatedAt,
        this.syncStatus,
        this.box,
        this.trackingTotalMoney,
        this.trackingCalculationWeight,
        this.trackingMiningWeight,
        this.trackingQuantity,
        this.trackingExploitedQuantity});

  factory AwbDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AwbDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AwbDetailModelToJson(this);

  static AwbStatus? _statusFromJson(String? value) =>
      AwbStatus.fromValue(value);

  static String? _statusToJson(AwbStatus? status) => status?.value;

}

@JsonSerializable()
class BoxAwbDetail {
  int? id;
  String? code;
  String? description;
  int? trackingQuantity;
  String? status;
  int? weight;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  AwbStatus? exploitStatus;
  String? exploitStartDate;
  String? exploitEndDate;
  String? createdAt;
  String? updatedAt;
  List<WarehouseVN>? warehouseVN;

  BoxAwbDetail(
      {this.id,
        this.code,
        this.description,
        this.trackingQuantity,
        this.status,
        this.weight,
        this.exploitStatus,
        this.exploitStartDate,
        this.exploitEndDate,
        this.createdAt,
        this.updatedAt,
        this.warehouseVN});

  factory BoxAwbDetail.fromJson(Map<String, dynamic> json) =>
      _$BoxAwbDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BoxAwbDetailToJson(this);

  static AwbStatus? _statusFromJson(String? value) =>
      AwbStatus.fromValue(value);

  static String? _statusToJson(AwbStatus? status) => status?.value;
}

@JsonSerializable()
class WarehouseVN {
  int? id;
  String? name;

  WarehouseVN({this.id, this.name});

  factory WarehouseVN.fromJson(Map<String, dynamic> json) =>
      _$WarehouseVNFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseVNToJson(this);

}

@JsonSerializable()
class AwbBoxData {
  AwbBoxInfo? boxInfo;
  List<ExploitedTrackingCount>? exploitedTrackingCount;
  List<AwbTrackings>? trackings;

  AwbBoxData({this.boxInfo, this.exploitedTrackingCount, this.trackings});

  factory AwbBoxData.fromJson(Map<String, dynamic> json) =>
      _$AwbBoxDataFromJson(json);

  Map<String, dynamic> toJson() => _$AwbBoxDataToJson(this);
}

@JsonSerializable()
class AwbBoxInfo {
  int? id;
  String? code;
  String? description;
  int? trackingQuantity;
  String? status;
  int? weight;
  String? exploitStatus;
  String? exploitStartDate;
  String? exploitEndDate;
  String? boxRate;
  String? createdAt;
  String? updatedAt;
  WarehouseVN? warehouseVN;

  AwbBoxInfo(
      {this.id,
        this.code,
        this.description,
        this.trackingQuantity,
        this.status,
        this.weight,
        this.exploitStatus,
        this.exploitStartDate,
        this.exploitEndDate,
        this.boxRate,
        this.createdAt,
        this.updatedAt,
        this.warehouseVN});


  factory AwbBoxInfo.fromJson(Map<String, dynamic> json) =>
      _$AwbBoxInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AwbBoxInfoToJson(this);
}

@JsonSerializable()
class ExploitedTrackingCount {
  String? count;

  ExploitedTrackingCount({this.count});

  factory ExploitedTrackingCount.fromJson(Map<String, dynamic> json) =>
      _$ExploitedTrackingCountFromJson(json);

  Map<String, dynamic> toJson() => _$ExploitedTrackingCountToJson(this);
}

@JsonSerializable()
class AwbTrackings {
  int? id;
  String? code;
  AwbTrackingType? trackingType;
  String? description;
  WarehouseVN? businessPartner;
  String? importDate;
  String? packedDate;
  String? exportDate;
  String? arrivalDate;
  String? exploitedDate;
  String? invoicedDate;
  String? checkingDate;
  bool? isRepack;
  WarehouseVN? warehouse;
  AwbBoxCustomer? customer;
  bool? isSplit;
  bool? isDeleted;
  String? imageUrl;
  String? note;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  OrderStatusvn? exploitStatus;
  @JsonKey(fromJson: _statusTrackingFromJson, toJson: _statusTrackingToJson)
  OrderStatus? status;
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
  double? weight;
  AwbBoxDeliveryBill? deliveryBill;
  int? trackingAmount;
  String? orderId;
  WarehouseVN? warehouseVn;
  AwbBoxExploitedBy? exploitedBy;
  String? price;
  Sale? sale;
  String? createdAt;
  String? updatedAt;
  bool? isRenamed;
  int? whTrackingId;
  String? vnPackedDate;
  String? vnImportDate;
  String? vnExportDate;
  int? vnPackedById;
  String? productName;

  AwbTrackings(
      {this.id,
        this.code,
        this.trackingType,
        this.description,
        this.businessPartner,
        this.importDate,
        this.packedDate,
        this.exportDate,
        this.arrivalDate,
        this.exploitedDate,
        this.invoicedDate,
        this.checkingDate,
        this.isRepack,
        this.warehouse,
        this.customer,
        this.isSplit,
        this.isDeleted,
        this.imageUrl,
        this.note,
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
        this.weight,
        this.deliveryBill,
        this.trackingAmount,
        this.orderId,
        this.warehouseVn,
        this.exploitedBy,
        this.price,
        this.sale,
        this.createdAt,
        this.updatedAt,
        this.isRenamed,
        this.whTrackingId,
        this.vnPackedDate,
        this.vnImportDate,
        this.vnExportDate,
        this.vnPackedById,
        this.productName,});

  factory AwbTrackings.fromJson(Map<String, dynamic> json) =>
      _$AwbTrackingsFromJson(json);

  Map<String, dynamic> toJson() => _$AwbTrackingsToJson(this);

  static OrderStatusvn? _statusFromJson(String? value) =>
      OrderStatusvn.fromValue(value);

  static String? _statusToJson(OrderStatusvn? status) => status?.value;

  static OrderStatus? _statusTrackingFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _statusTrackingToJson(OrderStatus? status) => status?.value;

}

@JsonSerializable()
class AwbTrackingType {
  int? id;
  String? name;

  AwbTrackingType({this.id, this.name});

  factory AwbTrackingType.fromJson(Map<String, dynamic> json) =>
      _$AwbTrackingTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AwbTrackingTypeToJson(this);

}

@JsonSerializable()
class AwbBoxCustomer {
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

  AwbBoxCustomer(
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

  factory AwbBoxCustomer.fromJson(Map<String, dynamic> json) =>
      _$AwbBoxCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$AwbBoxCustomerToJson(this);
}

@JsonSerializable()
class AwbBoxDeliveryBill {
  int? id;
  String? code;
  String? createdAt;

  AwbBoxDeliveryBill({this.id, this.code, this.createdAt});

  factory AwbBoxDeliveryBill.fromJson(Map<String, dynamic> json) =>
      _$AwbBoxDeliveryBillFromJson(json);

  Map<String, dynamic> toJson() => _$AwbBoxDeliveryBillToJson(this);
}

@JsonSerializable()
class AwbBoxExploitedBy {
  int? id;
  String? email;
  String? phone;
  String? fullname;

  AwbBoxExploitedBy({this.id, this.email, this.phone, this.fullname});

  factory AwbBoxExploitedBy.fromJson(Map<String, dynamic> json) =>
      _$AwbBoxExploitedByFromJson(json);

  Map<String, dynamic> toJson() => _$AwbBoxExploitedByToJson(this);
}

