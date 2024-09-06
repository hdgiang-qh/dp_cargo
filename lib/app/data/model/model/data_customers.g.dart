// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_customers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCustomers _$DataCustomersFromJson(Map<String, dynamic> json) =>
    DataCustomers(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      customer: json['customer'] == null
          ? null
          : Customers.fromJson(json['customer'] as Map<String, dynamic>),
      type: json['type'] as String?,
      confirmed: json['confirmed'] as bool?,
      blocked: json['blocked'] as bool?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DataCustomersToJson(DataCustomers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
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
