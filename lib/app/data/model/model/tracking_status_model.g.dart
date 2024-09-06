// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingStatusModel _$TrackingStatusModelFromJson(Map<String, dynamic> json) =>
    TrackingStatusModel(
      name: json['name'] as String?,
      total: json['total'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$TrackingStatusModelToJson(
        TrackingStatusModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'total': instance.total,
      'id': instance.id,
    };
