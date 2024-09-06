
import 'package:json_annotation/json_annotation.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
part 'create_bill_custom_model.g.dart';

@JsonSerializable()
class CreateBCTModel {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? balance;
  String? customerCode;
  String? accountCode;
  String? birthday;
  String? displayName;
  String? note;
  String? chargeMoney;
  String? depositMoney;
  String? addressList;
  String? phoneList;
  String? nickName;
  String? isAllowDebt;
  CreateBCTModelShippingCost? shippingCost;
  String? taxId;
  String? createdById;
  String? idCustomer;
  int? creditAmount;
  bool? isSubcribeToEmailNotification;
  bool? isSubcribeToFcmNotification;
  String? gender;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? updatedById;
  String? shippingCostOld;
  String? latitude;
  String? longitude;
  int? moneyTemporary;
  CreateBCTModelUser? user;
  CreateBCTModelSale? sale;
  String? customerServiceStaff;

  CreateBCTModel({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.balance,
    this.customerCode,
    this.accountCode,
    this.birthday,
    this.displayName,
    this.note,
    this.chargeMoney,
    this.depositMoney,
    this.addressList,
    this.phoneList,
    this.nickName,
    this.isAllowDebt,
    this.shippingCost,
    this.taxId,
    this.createdById,
    this.idCustomer,
    this.creditAmount,
    this.isSubcribeToEmailNotification,
    this.isSubcribeToFcmNotification,
    this.gender,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.updatedById,
    this.shippingCostOld,
    this.latitude,
    this.longitude,
    this.moneyTemporary,
    this.user,
    this.sale,
    this.customerServiceStaff,
  });
 factory CreateBCTModel.fromJson(Map<String, dynamic> json) => _$CreateBCTModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBCTModelToJson(this);

  String get formattedCreditAmount{
    return Const.convertPrice(creditAmount);
  }

  String get formattedBalance{
    return Const.convertPrice(balance);
  }

  String get formattedMoneyTemporary{
    return Const.convertPrice(moneyTemporary);
  }
}

class CreateBCTModelSale {

  int? id;
  String? email;
  String? phone;
  String? fullname;

  CreateBCTModelSale({
    this.id,
    this.email,
    this.phone,
    this.fullname,
  });
  CreateBCTModelSale.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    fullname = json['fullname']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['fullname'] = fullname;
    return data;
  }
}

class CreateBCTModelUser {

  int? id;
  String? email;
  String? phone;
  String? type;
  String? fullname;
  bool? blocked;
  String? avatarUrl;

  CreateBCTModelUser({
    this.id,
    this.email,
    this.phone,
    this.type,
    this.fullname,
    this.blocked,
    this.avatarUrl,
  });
  CreateBCTModelUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    type = json['type']?.toString();
    fullname = json['fullname']?.toString();
    blocked = json['blocked'];
    avatarUrl = json['avatar_url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['type'] = type;
    data['fullname'] = fullname;
    data['blocked'] = blocked;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}

class CreateBCTModelShippingCostConfigValueConfig {

  int? trackingType;
  int? warehouseConfigId;
  int? cost;

  CreateBCTModelShippingCostConfigValueConfig({
    this.trackingType,
    this.warehouseConfigId,
    this.cost,
  });
  CreateBCTModelShippingCostConfigValueConfig.fromJson(Map<String, dynamic> json) {
    trackingType = json['tracking_type']?.toInt();
    warehouseConfigId = json['warehouse_config_id']?.toInt();
    cost = json['cost']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tracking_type'] = trackingType;
    data['warehouse_config_id'] = warehouseConfigId;
    data['cost'] = cost;
    return data;
  }
}

class CreateBCTModelShippingCostConfigValueInfo {

  String? title;
  String? description;

  CreateBCTModelShippingCostConfigValueInfo({
    this.title,
    this.description,
  });
  CreateBCTModelShippingCostConfigValueInfo.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    description = json['description']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class CreateBCTModelShippingCostConfigValue {

  CreateBCTModelShippingCostConfigValueInfo? info;
  List<CreateBCTModelShippingCostConfigValueConfig?>? config;

  CreateBCTModelShippingCostConfigValue({
    this.info,
    this.config,
  });
  CreateBCTModelShippingCostConfigValue.fromJson(Map<String, dynamic> json) {
    info = (json['info'] != null) ? CreateBCTModelShippingCostConfigValueInfo.fromJson(json['info']) : null;
    if (json['config'] != null) {
      final v = json['config'];
      final arr0 = <CreateBCTModelShippingCostConfigValueConfig>[];
      v.forEach((v) {
        arr0.add(CreateBCTModelShippingCostConfigValueConfig.fromJson(v));
      });
      config = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (config != null) {
      final v = config;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['config'] = arr0;
    }
    return data;
  }
}

class CreateBCTModelShippingCost {

  int? id;
  String? configKey;
  CreateBCTModelShippingCostConfigValue? configValue;

  CreateBCTModelShippingCost({
    this.id,
    this.configKey,
    this.configValue,
  });
  CreateBCTModelShippingCost.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    configKey = json['configKey']?.toString();
    configValue = (json['configValue'] != null) ? CreateBCTModelShippingCostConfigValue.fromJson(json['configValue']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['configKey'] = configKey;
    if (configValue != null) {
      data['configValue'] = configValue!.toJson();
    }
    return data;
  }
}