// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffDetailBusinessPartner _$StaffDetailBusinessPartnerFromJson(
        Map<String, dynamic> json) =>
    StaffDetailBusinessPartner(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      uid: json['uid'] as String?,
      isSyncing: json['isSyncing'] as bool?,
      syncStatus: json['syncStatus'] as String?,
      message: json['message'] as String?,
      lastSync: json['lastSync'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
    );

Map<String, dynamic> _$StaffDetailBusinessPartnerToJson(
        StaffDetailBusinessPartner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'uid': instance.uid,
      'isSyncing': instance.isSyncing,
      'syncStatus': instance.syncStatus,
      'message': instance.message,
      'lastSync': instance.lastSync,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
    };

StaffDetailRole _$StaffDetailRoleFromJson(Map<String, dynamic> json) =>
    StaffDetailRole(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      isDelete: json['isDelete'] as bool?,
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$StaffDetailRoleToJson(StaffDetailRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'isDelete': instance.isDelete,
      'actions': instance.actions,
    };

StaffDetailModel _$StaffDetailModelFromJson(Map<String, dynamic> json) =>
    StaffDetailModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      role: json['role'] == null
          ? null
          : StaffDetailRole.fromJson(json['role'] as Map<String, dynamic>),
      email: json['email'] as String?,
      type: json['type'] as String?,
      confirmed: json['confirmed'] as bool?,
      blocked: json['blocked'] as bool?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      businessPartner: json['businessPartner'] == null
          ? null
          : StaffDetailBusinessPartner.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      warehouseVN: json['warehouseVN'] == null
          ? null
          : StaffWarehouseVN.fromJson(
              json['warehouseVN'] as Map<String, dynamic>),
      createdById: json['createdById'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      provider: json['provider'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      updatedById: json['updatedById'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$StaffDetailModelToJson(StaffDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role': instance.role,
      'email': instance.email,
      'type': instance.type,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'businessPartner': instance.businessPartner,
      'warehouseVN': instance.warehouseVN,
      'createdById': instance.createdById,
      'avatarUrl': instance.avatarUrl,
      'provider': instance.provider,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'updatedById': instance.updatedById,
      'code': instance.code,
    };

StaffWarehouseVN _$StaffWarehouseVNFromJson(Map<String, dynamic> json) =>
    StaffWarehouseVN(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StaffWarehouseVNToJson(StaffWarehouseVN instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
