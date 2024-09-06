// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vn_delivery_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VnDeliveryOrder _$VnDeliveryOrderFromJson(Map<String, dynamic> json) =>
    VnDeliveryOrder(
      id: json['id'] as int?,
      code: json['code'] as String?,
      quantity: json['quantity'] as int?,
      deliveryBillId: json['deliveryBillId'] as int?,
      status: json['status'] as int?,
      vnDeliveryUnitId: json['vnDeliveryUnitId'] as int?,
      vnDeliveryUnit: json['vnDeliveryUnit'] == null
          ? null
          : VnDeliveryUnit.fromJson(
              json['vnDeliveryUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VnDeliveryOrderToJson(VnDeliveryOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'quantity': instance.quantity,
      'deliveryBillId': instance.deliveryBillId,
      'status': instance.status,
      'vnDeliveryUnitId': instance.vnDeliveryUnitId,
      'vnDeliveryUnit': instance.vnDeliveryUnit,
    };
