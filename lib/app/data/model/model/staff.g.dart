// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffRole _$StaffRoleFromJson(Map<String, dynamic> json) => StaffRole(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      isDelete: json['isDelete'] as bool?,
    );

Map<String, dynamic> _$StaffRoleToJson(StaffRole instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'isDelete': instance.isDelete,
    };

Staff _$StaffFromJson(Map<String, dynamic> json) => Staff(
      id: json['id'] as int?,
      username: json['username'] as String?,
      role: json['role'] == null
          ? null
          : StaffRole.fromJson(json['role'] as Map<String, dynamic>),
      email: json['email'] as String?,
      type: json['type'] as String?,
      confirmed: json['confirmed'] as bool?,
      blocked: json['blocked'] as bool?,
      warehouseVN: json['warehouseVN'] == null
          ? null
          : StaffWarehouseVN.fromJson(
              json['warehouseVN'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      createdById: json['createdById'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      provider: json['provider'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      updatedById: json['updatedById'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role': instance.role,
      'email': instance.email,
      'type': instance.type,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'warehouseVN': instance.warehouseVN,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'createdById': instance.createdById,
      'avatarUrl': instance.avatarUrl,
      'provider': instance.provider,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'updatedById': instance.updatedById,
      'code': instance.code,
    };

StaffRoleName _$StaffRoleNameFromJson(Map<String, dynamic> json) =>
    StaffRoleName(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      isDelete: json['isDelete'] as bool?,
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : StaffAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StaffRoleNameToJson(StaffRoleName instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'isDelete': instance.isDelete,
      'actions': instance.actions,
    };
