// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingsType _$TrackingsTypeFromJson(Map<String, dynamic> json) =>
    TrackingsType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      uid: json['uid'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
    );

Map<String, dynamic> _$TrackingsTypeToJson(TrackingsType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
    };
