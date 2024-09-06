// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleEmployee _$SaleEmployeeFromJson(Map<String, dynamic> json) => SaleEmployee(
      id: json['id'] as int?,
      username: json['username'] as String?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      email: json['email'] as String?,
      customer: (json['customer'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Customers.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
      confirmed: json['confirmed'] as bool?,
      blocked: json['blocked'] as bool?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$SaleEmployeeToJson(SaleEmployee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role': instance.role,
      'email': instance.email,
      'customer': instance.customer,
      'type': instance.type,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'avatarUrl': instance.avatarUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
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
