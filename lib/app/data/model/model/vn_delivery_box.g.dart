// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vn_delivery_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VnDeliveryBox _$VnDeliveryBoxFromJson(Map<String, dynamic> json) =>
    VnDeliveryBox(
      id: json['id'] as int?,
      code: json['code'] as String?,
      vnDeliveryOrderId: json['vnDeliveryOrderId'] as int?,
      deliveredById: json['deliveredById'] as int?,
      receivedDate: json['receivedDate'] == null
          ? null
          : DateTime.parse(json['receivedDate'] as String),
      deliveredDate: json['deliveredDate'] == null
          ? null
          : DateTime.parse(json['deliveredDate'] as String),
      deliveredImageUrl: json['deliveredImageUrl'] as String?,
      note: json['note'] as String?,
      status: VnDeliveryBox._statusFromJson(json['status'] as int?),
    );

Map<String, dynamic> _$VnDeliveryBoxToJson(VnDeliveryBox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'vnDeliveryOrderId': instance.vnDeliveryOrderId,
      'deliveredById': instance.deliveredById,
      'receivedDate': instance.receivedDate?.toIso8601String(),
      'deliveredDate': instance.deliveredDate?.toIso8601String(),
      'deliveredImageUrl': instance.deliveredImageUrl,
      'note': instance.note,
      'status': VnDeliveryBox._statusToJson(instance.status),
    };
