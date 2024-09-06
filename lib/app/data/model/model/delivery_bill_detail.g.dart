// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_bill_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryBillDetail _$DeliveryBillDetailFromJson(Map<String, dynamic> json) =>
    DeliveryBillDetail(
      id: json['id'] as int?,
      code: json['code'] as String?,
      customerName: json['customerName'] as String?,
      deliveryBillStatus: DeliveryBillDetail._statusFromJson(
          json['deliveryBillStatus'] as String?),
      customerAddress: json['customerAddress'] as String?,
      customerPhone: json['customerPhone'] as String?,
      description: json['description'] as String?,
      note: json['note'] as String?,
      isConfirmedByCustomer: json['isConfirmedByCustomer'] as bool?,
      isPackaged: json['isPackaged'] as bool?,
      isCharged: json['isCharged'] as bool?,
      createdById: json['createdById'] as int?,
      trackings: (json['trackings'] as List<dynamic>?)
          ?.map((e) => TrackingsBill.fromJson(e as Map<String, dynamic>))
          .toList(),
      vnDeliveryOrder: (json['vnDeliveryOrder'] as List<dynamic>?)
          ?.map((e) => VnDeliveryOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      vnDeliveryBoxes: (json['vnDeliveryBoxes'] as List<dynamic>?)
          ?.map((e) => VnDeliveryBox.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      name: json['name'] as String?,
      email: json['email'] as String?,
      updatedById: json['updatedById'] as String?,
      employee: json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
      totalTrackingMiningWeight:
          (json['totalTrackingMiningWeight'] as num?)?.toDouble(),
      totalTrackingCalculationWeight:
          (json['totalTrackingCalculationWeight'] as num?)?.toDouble(),
      trackingTotalMoney: json['trackingTotalMoney'] as int?,
      shipperNote: json['shipperNote'] as String?,
      deliveredImageUrl: json['deliveredImageUrl'] as String?,
    );

Map<String, dynamic> _$DeliveryBillDetailToJson(DeliveryBillDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'customerName': instance.customerName,
      'deliveryBillStatus':
          DeliveryBillDetail._statusToJson(instance.deliveryBillStatus),
      'customerAddress': instance.customerAddress,
      'customerPhone': instance.customerPhone,
      'description': instance.description,
      'note': instance.note,
      'isConfirmedByCustomer': instance.isConfirmedByCustomer,
      'isPackaged': instance.isPackaged,
      'isCharged': instance.isCharged,
      'createdById': instance.createdById,
      'trackings': instance.trackings,
      'vnDeliveryOrder': instance.vnDeliveryOrder,
      'vnDeliveryBoxes': instance.vnDeliveryBoxes,
      'customer': instance.customer,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'email': instance.email,
      'updatedById': instance.updatedById,
      'employee': instance.employee,
      'totalTrackingMiningWeight': instance.totalTrackingMiningWeight,
      'totalTrackingCalculationWeight': instance.totalTrackingCalculationWeight,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'shipperNote': instance.shipperNote,
      'deliveredImageUrl': instance.deliveredImageUrl,
    };

AddTrackingDeliveryBill _$AddTrackingDeliveryBillFromJson(
        Map<String, dynamic> json) =>
    AddTrackingDeliveryBill(
      id: json['id'] as int?,
      code: json['code'] as String?,
      customerName: json['customerName'] as String?,
      deliveryBillStatus: json['deliveryBillStatus'] as String?,
      customerAddress: json['customerAddress'] as String?,
      customerPhone: json['customerPhone'] as String?,
      description: json['description'] as String?,
      note: json['note'] as String?,
      isConfirmedByCustomer: json['isConfirmedByCustomer'] as bool?,
      isPackaged: json['isPackaged'] as bool?,
      isCharged: json['isCharged'] as bool?,
      createdById: json['createdById'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      updatedById: json['updatedById'] as String?,
      deliveredImageUrl: json['deliveredImageUrl'] as String?,
      shipperNote: json['shipperNote'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddTrackingDeliveryBillToJson(
        AddTrackingDeliveryBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'customerName': instance.customerName,
      'deliveryBillStatus': instance.deliveryBillStatus,
      'customerAddress': instance.customerAddress,
      'customerPhone': instance.customerPhone,
      'description': instance.description,
      'note': instance.note,
      'isConfirmedByCustomer': instance.isConfirmedByCustomer,
      'isPackaged': instance.isPackaged,
      'isCharged': instance.isCharged,
      'createdById': instance.createdById,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'name': instance.name,
      'email': instance.email,
      'updatedById': instance.updatedById,
      'deliveredImageUrl': instance.deliveredImageUrl,
      'shipperNote': instance.shipperNote,
      'message': instance.message,
    };
