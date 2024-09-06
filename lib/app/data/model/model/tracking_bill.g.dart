// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingsBill _$TrackingsBillFromJson(Map<String, dynamic> json) =>
    TrackingsBill(
      id: json['id'] as int?,
      code: json['code'] as String?,
      trackingType: (json['trackingType'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TrackingType.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      status: TrackingsBill._statusFromJson(json['status'] as String?),
      importDate: json['importDate'] == null
          ? null
          : DateTime.parse(json['importDate'] as String),
      repackDate: json['repackDate'] == null
          ? null
          : DateTime.parse(json['repackDate'] as String),
      packedDate: json['packedDate'] == null
          ? null
          : DateTime.parse(json['packedDate'] as String),
      exportDate: json['exportDate'] == null
          ? null
          : DateTime.parse(json['exportDate'] as String),
      arrivalDate: json['arrivalDate'] == null
          ? null
          : DateTime.parse(json['arrivalDate'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      exploitedDate: json['exploitedDate'] as String?,
      invoicedDate: json['invoicedDate'] == null
          ? null
          : DateTime.parse(json['invoicedDate'] as String),
      checkingDate: json['checkingDate'] == null
          ? null
          : DateTime.parse(json['checkingDate'] as String),
      isRepack: json['isRepack'] as bool?,
      isSplit: json['isSplit'] as bool?,
      parentTracking: json['parentTracking'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      imageUrl: json['imageUrl'] as String?,
      note: json['note'] as String?,
      exploitStatus:
          TrackingsBill._statusFromJson(json['exploitStatus'] as String?),
      shippingFee: json['shippingFee'] as int?,
      trackingMiningWeight: json['trackingMiningWeight'] as String?,
      trackingCalculationWeight: json['trackingCalculationWeight'] as String?,
      trackingBarrelCoefficient: json['trackingBarrelCoefficient'] as String?,
      trackingShippingCost: json['trackingShippingCost'] as String?,
      trackingShippingFee: json['trackingShippingFee'] as String?,
      trackingSurcharge: json['trackingSurcharge'] as String?,
      trackingDeliveryFee: json['trackingDeliveryFee'] as String?,
      trackingOtherFee: json['trackingOtherFee'] as String?,
      trackingDiscountAmount: json['trackingDiscountAmount'] as int?,
      trackingTotalMoney: json['trackingTotalMoney'] as String?,
      weight: json['weight'] as String?,
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      optionalImage: json['optionalImage'] as String?,
      price: json['price'] as String?,
      uid: json['uid'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      vnExportDate: json['vnExportDate'] as String?,
      vnPackedById: json['vnPackedById'] as int?,
      isRenamed: json['isRenamed'] as bool?,
      priority: json['priority'] as String?,
      productName: json['productName'] as String?,
      whTrackingId: json['whTrackingId'] as int?,
      vnImportDate: json['vnImportDate'] as String?,
      hasError: json['hasError'] as bool?,
    );

Map<String, dynamic> _$TrackingsBillToJson(TrackingsBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'trackingType': instance.trackingType,
      'status': TrackingsBill._statusToJson(instance.status),
      'importDate': instance.importDate?.toIso8601String(),
      'repackDate': instance.repackDate?.toIso8601String(),
      'packedDate': instance.packedDate?.toIso8601String(),
      'exportDate': instance.exportDate?.toIso8601String(),
      'arrivalDate': instance.arrivalDate?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'exploitedDate': instance.exploitedDate,
      'invoicedDate': instance.invoicedDate?.toIso8601String(),
      'checkingDate': instance.checkingDate?.toIso8601String(),
      'isRepack': instance.isRepack,
      'isSplit': instance.isSplit,
      'parentTracking': instance.parentTracking,
      'isDeleted': instance.isDeleted,
      'imageUrl': instance.imageUrl,
      'note': instance.note,
      'exploitStatus': TrackingsBill._statusToJson(instance.exploitStatus),
      'shippingFee': instance.shippingFee,
      'trackingMiningWeight': instance.trackingMiningWeight,
      'trackingCalculationWeight': instance.trackingCalculationWeight,
      'trackingBarrelCoefficient': instance.trackingBarrelCoefficient,
      'trackingShippingCost': instance.trackingShippingCost,
      'trackingShippingFee': instance.trackingShippingFee,
      'trackingSurcharge': instance.trackingSurcharge,
      'trackingDeliveryFee': instance.trackingDeliveryFee,
      'trackingOtherFee': instance.trackingOtherFee,
      'trackingDiscountAmount': instance.trackingDiscountAmount,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'weight': instance.weight,
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
      'optionalImage': instance.optionalImage,
      'price': instance.price,
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'vnExportDate': instance.vnExportDate,
      'vnPackedById': instance.vnPackedById,
      'isRenamed': instance.isRenamed,
      'priority': instance.priority,
      'whTrackingId': instance.whTrackingId,
      'vnImportDate': instance.vnImportDate,
      'productName': instance.productName,
      'hasError': instance.hasError,
    };

TrackingType _$TrackingTypeFromJson(Map<String, dynamic> json) => TrackingType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      uid: json['uid'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$TrackingTypeToJson(TrackingType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
