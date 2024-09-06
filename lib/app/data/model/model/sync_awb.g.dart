// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_awb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncAwb _$SyncAwbFromJson(Map<String, dynamic> json) => SyncAwb(
      processing: (json['processing'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notSynced: (json['notSynced'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SyncAwbToJson(SyncAwb instance) => <String, dynamic>{
      'processing': instance.processing,
      'notSynced': instance.notSynced,
    };
