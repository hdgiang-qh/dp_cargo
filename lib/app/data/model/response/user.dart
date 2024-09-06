import 'package:json_annotation/json_annotation.dart';

import '../model/customer.dart';
import '../model/staff.dart';

part 'user.g.dart';

@JsonSerializable()
class UserInfo {
  int? id;
  Role? role;
  String? email;
  String? type;

  List<StaffWarehouseVN>? warehouseVN;
  bool? confirmed;
  bool? blocked;
  String? phone;
  String? fullname;
  BusinessPartner? businessPartner;
  String? resetPasswordToken;
  String? createdAt;
  String? updatedAt;
  int? updatedById;
  String? avatarUrl;
  String? errorMessage;
  String? message;
  Customer? customer;

  UserInfo(
      {this.id,
      this.role,
      this.email,
      this.type,
       this.warehouseVN,
      this.confirmed,
      this.blocked,
      this.phone,
      this.fullname,
      this.businessPartner,
      this.resetPasswordToken,
      this.createdAt,
      this.updatedAt,
      this.updatedById,
      this.avatarUrl,
      this.errorMessage,
      this.message,
      this.customer});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

@JsonSerializable()
class Role {
  int? id;
  String? name;
  String? type;
  bool? isDelete;

  Role({this.id, this.name, this.type, this.isDelete});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable()
class BusinessPartner {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? email;
  String? uid;
  bool? isSyncing;
  String? syncStatus;
  String? lastSync;
  String? createdAt;
  String? updatedAt;

  BusinessPartner(
      {this.id,
      this.name,
      this.address,
      this.phone,
      this.email,
      this.uid,
      this.isSyncing,
      this.syncStatus,
      this.lastSync,
      this.createdAt,
      this.updatedAt});

  factory BusinessPartner.fromJson(Map<String, dynamic> json) =>
      _$BusinessPartnerFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessPartnerToJson(this);
}
