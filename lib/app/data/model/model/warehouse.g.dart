// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WareHouse _$WareHouseFromJson(Map<String, dynamic> json) => WareHouse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
    );

Map<String, dynamic> _$WareHouseToJson(WareHouse instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
    };
