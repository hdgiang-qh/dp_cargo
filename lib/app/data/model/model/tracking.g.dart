// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trackings _$TrackingsFromJson(Map<String, dynamic> json) => Trackings(
      id: json['id'] as int?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      trackingType: json['trackingType'] == null
          ? null
          : TrackingType.fromJson(json['trackingType'] as Map<String, dynamic>),
      businessPartner: json['businessPartner'] == null
          ? null
          : BusinessPartner.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      status: Trackings._statusFromJson(json['status'] as String?),
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
      box: json['box'] == null
          ? null
          : Box.fromJson(json['box'] as Map<String, dynamic>),
      awb: json['awb'] == null
          ? null
          : Box.fromJson(json['awb'] as Map<String, dynamic>),
      warehouse: json['warehouse'] == null
          ? null
          : BusinessPartner.fromJson(json['warehouse'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      isSplit: json['isSplit'] as bool?,
      parentTracking: json['parentTracking'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      imageUrl: json['imageUrl'] as String?,
      note: json['note'] as String?,
      exploitStatus:
          Trackings._statusvnFromJson(json['exploitStatus'] as String?),
      vnPackedBy: json['vnPackedBy'] == null
          ? null
          : ExploitedBy.fromJson(json['vnPackedBy'] as Map<String, dynamic>),
      exploitedBy: json['exploitedBy'] == null
          ? null
          : ExploitedByN.fromJson(json['exploitedBy'] as Map<String, dynamic>),
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
      deliveryBill: json['deliveryBill'] == null
          ? null
          : TrackingDeliveryBill.fromJson(
              json['deliveryBill'] as Map<String, dynamic>),
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      optionalImage: json['optionalImage'] as String?,
      price: json['price'] as String?,
      uid: json['uid'] as String?,
      sale: json['sale'] == null
          ? null
          : Employee.fromJson(json['sale'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      whTrackingId: json['whTrackingId'] as int?,
      ticketResponse: json['ticketResponse'] as String?,
      isRenamed: json['isRenamed'] as bool?,
      priority: json['priority'] as String?,
      productName: json['productName'] as String?,
      hasError: json['hasError'] as bool?,
      warehouseVn: json['warehouseVn'] == null
          ? null
          : BusinessPartner.fromJson(
              json['warehouseVn'] as Map<String, dynamic>),
      vnExportDate: json['vnExportDate'] as String?,
      vnImportDate: json['vnImportDate'] as String?,
      vnPackedDate: json['vnPackedDate'] as String?,
      statusLogs: (json['statusLogs'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OrdersDetailStatusLogs.fromJson(e as Map<String, dynamic>))
          .toList(),
      backlogs: (json['backlogs'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OrdersDetailBackLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackingsToJson(Trackings instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'trackingType': instance.trackingType,
      'businessPartner': instance.businessPartner,
      'status': Trackings._statusToJson(instance.status),
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
      'box': instance.box,
      'awb': instance.awb,
      'warehouse': instance.warehouse,
      'customer': instance.customer,
      'isSplit': instance.isSplit,
      'parentTracking': instance.parentTracking,
      'isDeleted': instance.isDeleted,
      'imageUrl': instance.imageUrl,
      'note': instance.note,
      'exploitStatus': Trackings._statusvnToJson(instance.exploitStatus),
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
      'vnPackedDate': instance.vnPackedDate,
      'vnImportDate': instance.vnImportDate,
      'vnExportDate': instance.vnExportDate,
      'deliveryBill': instance.deliveryBill,
      'exploitedBy': instance.exploitedBy,
      'vnPackedBy': instance.vnPackedBy,
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
      'optionalImage': instance.optionalImage,
      'price': instance.price,
      'uid': instance.uid,
      'sale': instance.sale,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'whTrackingId': instance.whTrackingId,
      'ticketResponse': instance.ticketResponse,
      'isRenamed': instance.isRenamed,
      'priority': instance.priority,
      'productName': instance.productName,
      'warehouseVn': instance.warehouseVn,
      'hasError': instance.hasError,
      'statusLogs': instance.statusLogs,
      'backlogs': instance.backlogs,
    };
