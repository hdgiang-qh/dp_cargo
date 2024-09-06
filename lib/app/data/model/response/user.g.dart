// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as int?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      email: json['email'] as String?,
      type: json['type'] as String?,
      warehouseVN: (json['warehouseVN'] as List<dynamic>?)
          ?.map((e) => StaffWarehouseVN.fromJson(e as Map<String, dynamic>))
          .toList(),
      confirmed: json['confirmed'] as bool?,
      blocked: json['blocked'] as bool?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      businessPartner: json['businessPartner'] == null
          ? null
          : BusinessPartner.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      resetPasswordToken: json['resetPasswordToken'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      updatedById: json['updatedById'] as int?,
      avatarUrl: json['avatarUrl'] as String?,
      errorMessage: json['errorMessage'] as String?,
      message: json['message'] as String?,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'email': instance.email,
      'type': instance.type,
      'warehouseVN': instance.warehouseVN,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'businessPartner': instance.businessPartner,
      'resetPasswordToken': instance.resetPasswordToken,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'updatedById': instance.updatedById,
      'avatarUrl': instance.avatarUrl,
      'errorMessage': instance.errorMessage,
      'message': instance.message,
      'customer': instance.customer,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      isDelete: json['isDelete'] as bool?,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'isDelete': instance.isDelete,
    };

BusinessPartner _$BusinessPartnerFromJson(Map<String, dynamic> json) =>
    BusinessPartner(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      uid: json['uid'] as String?,
      isSyncing: json['isSyncing'] as bool?,
      syncStatus: json['syncStatus'] as String?,
      lastSync: json['lastSync'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$BusinessPartnerToJson(BusinessPartner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'uid': instance.uid,
      'isSyncing': instance.isSyncing,
      'syncStatus': instance.syncStatus,
      'lastSync': instance.lastSync,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
