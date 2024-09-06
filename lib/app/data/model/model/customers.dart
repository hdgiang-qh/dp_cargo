
import 'package:json_annotation/json_annotation.dart';

import '../../../core/enum/sex.dart';
import 'config_price.dart';

part 'customers.g.dart';
@JsonSerializable()
class Customers {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? balance;
  String? birthday;
  String? displayName;
  String? note;
  String? nickName;
  bool? isAllowDebt;
  ShippingCost? shippingCost;
  Sale? sale;
  String? idCustomer;
  int? creditAmount;
  bool? isSubcribeToEmailNotification;
  bool? isSubcribeToFcmNotification;
  Sex? gender;
  String? createdAt;
  String? updatedAt;
  Sale? customerServiceStaff;

  Customers({this.id,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.balance,
    this.birthday,
    this.displayName,
    this.note,
    this.nickName,
    this.isAllowDebt,
    this.shippingCost,
    this.sale,
    this.idCustomer,
    this.creditAmount,
    this.isSubcribeToEmailNotification,
    this.isSubcribeToFcmNotification,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.customerServiceStaff});

  factory Customers.fromJson(Map<String, dynamic> json) =>
      _$CustomersFromJson(json);

  Map<String, dynamic> toJson() => _$CustomersToJson(this);

}
@JsonSerializable()
class ShippingCost {
  int? id;
  String? configKey;
  ConfigValue? configValue;

  ShippingCost({this.id, this.configKey, this.configValue});

  factory ShippingCost.fromJson(Map<String, dynamic> json) =>
      _$ShippingCostFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingCostToJson(this);
}

@JsonSerializable()
class ConfigValue {
  Info? info;
  List<ConfigPrice?>? config;

  ConfigValue({this.info, this.config});
  factory ConfigValue.fromJson(Map<String, dynamic> json) =>
      _$ConfigValueFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigValueToJson(this);
}

@JsonSerializable()
class Info {
  String? title;
  String? description;

  Info({this.title, this.description});
  factory Info.fromJson(Map<String, dynamic> json) =>
      _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

// class Config {
//   int? trackingType;
//   int? warehouseConfigId;
//   int? cost;
//
//   Config({this.trackingType, this.warehouseConfigId, this.cost});
//
//   Config.fromJson(Map<String, dynamic> json) {
//     trackingType = json['tracking_type'];
//     warehouseConfigId = json['warehouse_config_id'];
//     cost = json['cost'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['tracking_type'] = trackingType;
//     data['warehouse_config_id'] = warehouseConfigId;
//     data['cost'] = cost;
//     return data;
//   }
// }

@JsonSerializable()
class Sale {
  int? id;
  String? fullname;

  Sale({this.id, this.fullname});
  factory Sale.fromJson(Map<String, dynamic> json) =>
      _$SaleFromJson(json);

  Map<String, dynamic> toJson() => _$SaleToJson(this);
}
