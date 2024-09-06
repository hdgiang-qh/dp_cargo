import 'package:json_annotation/json_annotation.dart';
import 'package:vncss/app/core/enum/orders_status.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import 'box.dart';

part 'orders_detail.g.dart';

@JsonSerializable()
class OrdersDetailSale {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? fullname;
  String? avatarUrl;

  OrdersDetailSale({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.fullname,
    this.avatarUrl,
  });

  factory OrdersDetailSale.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailSaleFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailSaleToJson(this);
}

@JsonSerializable()
class OrdersDetailExploitedBy {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? fullname;

  OrdersDetailExploitedBy({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.fullname,
  });

  factory OrdersDetailExploitedBy.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailExploitedByFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailExploitedByToJson(this);
}

@JsonSerializable()
class OrdersDetailWarehouseVn {
  int? id;
  String? name;

  OrdersDetailWarehouseVn({
    this.id,
    this.name,
  });

  factory OrdersDetailWarehouseVn.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailWarehouseVnFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailWarehouseVnToJson(this);
}

@JsonSerializable()
class OrdersDetailDeliveryBill {
  int? id;
  String? code;
  String? createdAt;

  OrdersDetailDeliveryBill({
    this.id,
    this.code,
    this.createdAt,
  });

  factory OrdersDetailDeliveryBill.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailDeliveryBillFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailDeliveryBillToJson(this);
}

@JsonSerializable()
class OrdersDetailCustomerUser {
  int? id;
  String? username;
  String? email;
  String? password;
  String? type;
  bool? confirmed;
  bool? blocked;
  String? phone;
  String? fullname;
  String? createdById;
  String? resetPasswordToken;
  String? avatarUrl;
  String? provider;
  String? confirmationToken;
  String? confirmPassword;
  String? tmpPassword;
  String? createdAt;
  String? updatedAt;
  String? updatedById;
  String? code;

  OrdersDetailCustomerUser({
    this.id,
    this.username,
    this.email,
    this.password,
    this.type,
    this.confirmed,
    this.blocked,
    this.phone,
    this.fullname,
    this.createdById,
    this.resetPasswordToken,
    this.avatarUrl,
    this.provider,
    this.confirmationToken,
    this.confirmPassword,
    this.tmpPassword,
    this.createdAt,
    this.updatedAt,
    this.updatedById,
    this.code,
  });

  factory OrdersDetailCustomerUser.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailCustomerUserFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailCustomerUserToJson(this);
}

@JsonSerializable()
class OrdersDetailCustomerTags {
  int? id;
  String? name;
  String? color;

  OrdersDetailCustomerTags({
    this.id,
    this.name,
    this.color,
  });

  factory OrdersDetailCustomerTags.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailCustomerTagsFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailCustomerTagsToJson(this);
}

@JsonSerializable()
class OrdersDetailCustomer {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? nickName;
  List<OrdersDetailCustomerUser?>? user;
  int? shippingCost;
  List<OrdersDetailCustomerTags?>? tags;
  String? idCustomer;
  bool? isSubcribeToEmailNotification;
  bool? isSubcribeToFcmNotification;

  OrdersDetailCustomer({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.nickName,
    this.user,
    this.shippingCost,
    this.tags,
    this.idCustomer,
    this.isSubcribeToEmailNotification,
    this.isSubcribeToFcmNotification,
  });

  factory OrdersDetailCustomer.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailCustomerToJson(this);
}

@JsonSerializable()
class OrdersDetailBusinessPartner {
  int? id;
  String? name;

  OrdersDetailBusinessPartner({
    this.id,
    this.name,
  });

  factory OrdersDetailBusinessPartner.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailBusinessPartnerFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailBusinessPartnerToJson(this);
}

@JsonSerializable()
class OrdersDetailTrackingType {
  int? id;
  String? name;
  String? color;

  OrdersDetailTrackingType({
    this.id,
    this.name,
    this.color,
  });

  factory OrdersDetailTrackingType.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailTrackingTypeFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailTrackingTypeToJson(this);
}

@JsonSerializable()
class OrdersDetailStatusLogs {
  int? id;
  String? name;
  String? updatedTime;
  int? trackingId;

  OrdersDetailStatusLogs({
    this.id,
    this.name,
    this.updatedTime,
    this.trackingId,
  });

  factory OrdersDetailStatusLogs.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailStatusLogsFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailStatusLogsToJson(this);
  String get formattedCustomerTransactionDate {
    return Const.convertDate(updatedTime);
  }
}

@JsonSerializable()
class OrdersDetailVnPackedBy {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? fullname;
  String? avatarUrl;

  OrdersDetailVnPackedBy({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.fullname,
    this.avatarUrl,
  });

  factory OrdersDetailVnPackedBy.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailVnPackedByFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailVnPackedByToJson(this);
}

@JsonSerializable()
class OrdersDetailBackLogExtraDataCustomerUser {
  int? id;
  String? type;
  String? email;
  String? phone;
  bool? blocked;
  String? fullname;
  String? password;
  String? username;
  bool? confirmed;
  String? createdAt;
  String? updatedAt;

  OrdersDetailBackLogExtraDataCustomerUser({
    this.id,
    this.type,
    this.email,
    this.phone,
    this.blocked,
    this.fullname,
    this.password,
    this.username,
    this.confirmed,
    this.createdAt,
    this.updatedAt,
  });

  factory OrdersDetailBackLogExtraDataCustomerUser.fromJson(
          Map<String, dynamic> json) =>
      _$OrdersDetailBackLogExtraDataCustomerUserFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OrdersDetailBackLogExtraDataCustomerUserToJson(this);
}

@JsonSerializable()
class OrdersDetailBackLogExtraDataCustomer {
  int? id;
  String? name;
  List<OrdersDetailBackLogExtraDataCustomerUser?>? user;
  String? email;
  String? phone;
  String? address;
  String? nickName;
  String? idCustomer;
  int? shippingCost;
  bool? isSubcribeToFcmNotification;
  bool? isSubcribeToEmailNotification;

  OrdersDetailBackLogExtraDataCustomer({
    this.id,
    this.name,
    this.user,
    this.email,
    this.phone,
    this.address,
    this.nickName,
    this.idCustomer,
    this.shippingCost,
    this.isSubcribeToFcmNotification,
    this.isSubcribeToEmailNotification,
  });

  factory OrdersDetailBackLogExtraDataCustomer.fromJson(
          Map<String, dynamic> json) =>
      _$OrdersDetailBackLogExtraDataCustomerFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OrdersDetailBackLogExtraDataCustomerToJson(this);
}

@JsonSerializable()
class OrdersDetailBackLogExtraDataSale {
  int? id;
  String? email;
  String? phone;
  String? fullname;
  String? username;
  String? avatarUrl;

  OrdersDetailBackLogExtraDataSale({
    this.id,
    this.email,
    this.phone,
    this.fullname,
    this.username,
    this.avatarUrl,
  });

  factory OrdersDetailBackLogExtraDataSale.fromJson(
          Map<String, dynamic> json) =>
      _$OrdersDetailBackLogExtraDataSaleFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OrdersDetailBackLogExtraDataSaleToJson(this);
}

@JsonSerializable()
class OrdersDetailBackLogExtraData {
  int? id;
  Box? awb;
  Box? box;
  String? code;
  String? note;
  OrdersDetailSale? sale;
  String? price;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  OrderStatus? status;
  String? orderId;
  OrdersDetailBackLogExtraDataCustomer? customer;
  String? createdAt;
  bool? isDeleted;
  bool? isRenamed;
  String? updatedAt;
  String? description;
  OrdersDetailExploitedBy? exploitedBy;
  String? productName;
  OrdersDetailWarehouseVn? warehouseVn;
  OrdersDetailTrackingType? trackingType;
  String? vnImportDate;
  @JsonKey(fromJson: _exploitStatusFromJson, toJson: _exploitStatusToJson)
  OrderStatus? exploitStatus;
  String? exploitedDate;
  int? trackingAmount;
  OrdersDetailBusinessPartner? businessPartner;
  String? trackingOtherFee;
  String? trackingSurcharge;
  String? trackingTotalMoney;
  String? trackingDeliveryFee;
  String? trackingShippingFee;
  String? trackingMiningWeight;
  String? trackingShippingCost;
  int? trackingDiscountAmount;
  String? trackingBarrelCoefficient;
  String? trackingCalculationWeight;

  OrdersDetailBackLogExtraData({
    this.id,
    this.awb,
    this.box,
    this.code,
    this.note,
    this.sale,
    this.price,
    this.status,
    this.orderId,
    this.customer,
    this.createdAt,
    this.isDeleted,
    this.isRenamed,
    this.updatedAt,
    this.description,
    this.exploitedBy,
    this.productName,
    this.warehouseVn,
    this.trackingType,
    this.vnImportDate,
    this.exploitStatus,
    this.exploitedDate,
    this.trackingAmount,
    this.businessPartner,
    this.trackingOtherFee,
    this.trackingSurcharge,
    this.trackingTotalMoney,
    this.trackingDeliveryFee,
    this.trackingShippingFee,
    this.trackingMiningWeight,
    this.trackingShippingCost,
    this.trackingDiscountAmount,
    this.trackingBarrelCoefficient,
    this.trackingCalculationWeight,
  });

  factory OrdersDetailBackLogExtraData.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailBackLogExtraDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailBackLogExtraDataToJson(this);

  static OrderStatus? _statusFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _statusToJson(OrderStatus? status) => status?.value;

  static OrderStatus? _exploitStatusFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _exploitStatusToJson(OrderStatus? exploitStatus) =>
      exploitStatus?.value;
}

@JsonSerializable()
class OrdersDetailBackLog {
  int? id;
  String? actionTime;
  String? actionType;
  String? trackingCode;
  String? updatedAt;
  int? trackingId;

  OrdersDetailBackLog({
    this.id,
    this.actionTime,
    this.actionType,
    this.trackingCode,
    this.updatedAt,
    this.trackingId,
  });

  factory OrdersDetailBackLog.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailBackLogFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailBackLogToJson(this);
}

@JsonSerializable()
class OrdersDetail {
  int? id;
  String? code;
  OrdersDetailTrackingType? trackingType;
  String? description;
  OrdersDetailBusinessPartner? businessPartner;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  OrderStatus? status;
  String? exploitedDate;
  String? packedDate;
  Box? box;
  Box? awb;
  OrdersDetailCustomer? customer;
  OrdersDetailWarehouseVn? warehouse;
  bool? isDeleted;
  String? note;
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
  OrdersDetailDeliveryBill? deliveryBill;
  int? trackingAmount;
  String? orderId;
  OrdersDetailWarehouseVn? warehouseVn;
  OrdersDetailExploitedBy? exploitedBy;
  String? price;
  OrdersDetailSale? sale;
  String? createdAt;
  String? updatedAt;
  bool? isRenamed;
  String? vnPackedDate;
  String? vnImportDate;
  String? vnExportDate;
  int? vnPackedById;
  String? productName;
  OrdersDetailVnPackedBy? vnPackedBy;
  List<OrdersDetailStatusLogs?>? statusLogs;
  List<OrdersDetailBackLog?>? backlogs;

  OrdersDetail(
      {this.id,
      this.code,
      this.trackingType,
      this.description,
      this.businessPartner,
      this.status,
      this.exploitedDate,
      this.packedDate,
      this.box,
      this.awb,
      this.warehouse,
      this.customer,
      this.isDeleted,
      this.note,
      this.exploitStatus,
      this.trackingMiningWeight,
      this.trackingCalculationWeight,
      this.trackingBarrelCoefficient,
      this.trackingShippingCost,
      this.trackingShippingFee,
      this.sale,
      this.trackingSurcharge,
      this.trackingDeliveryFee,
      this.trackingOtherFee,
      this.trackingDiscountAmount,
      this.trackingTotalMoney,
      this.deliveryBill,
      this.trackingAmount,
      this.orderId,
      this.warehouseVn,
      this.exploitedBy,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.isRenamed,
      this.vnPackedDate,
      this.vnImportDate,
      this.vnExportDate,
      this.vnPackedById,
      this.productName,
      this.vnPackedBy,
      this.statusLogs,
      this.backlogs});

  factory OrdersDetail.fromJson(Map<String, dynamic> json) =>
      _$OrdersDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDetailToJson(this);

  static OrderStatus? _statusFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _statusToJson(OrderStatus? status) => status?.value;

  static OrderStatus? _exploitStatusFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _exploitStatusToJson(OrderStatus? exploitStatus) =>
      exploitStatus?.value;
}
