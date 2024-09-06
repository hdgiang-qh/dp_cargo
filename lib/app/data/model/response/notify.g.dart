// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notify _$NotifyFromJson(Map<String, dynamic> json) => Notify(
      receiver: json['receiver'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      type: json['type'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      locationId: json['location_id'] as String?,
      gatewaySerial: json['gateway_serial'] as String?,
      readed: json['readed'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotifyToJson(Notify instance) => <String, dynamic>{
      'receiver': instance.receiver,
      'timestamp': instance.timestamp?.toIso8601String(),
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'location_id': instance.locationId,
      'gateway_serial': instance.gatewaySerial,
      'readed': instance.readed,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      timestamp: json['timestamp'] as int?,
      status: json['status'] as int?,
      battery: json['battery'] as int?,
      nType: json['nType'] as String?,
      nId: json['nId'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'status': instance.status,
      'battery': instance.battery,
      'nType': instance.nType,
      'nId': instance.nId,
    };
