// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as int?,
      code: json['code'] as String?,
      trackingType: json['trackingType'] == null
          ? null
          : TrackingsType.fromJson(
              json['trackingType'] as Map<String, dynamic>),
      description: json['description'] as String?,
      businessPartner: json['businessPartner'] == null
          ? null
          : BusinessPartner.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      importDate: json['importDate'] == null
          ? null
          : DateTime.parse(json['importDate'] as String),
      packedDate: json['packedDate'] == null
          ? null
          : DateTime.parse(json['packedDate'] as String),
      exportDate: json['exportDate'] == null
          ? null
          : DateTime.parse(json['exportDate'] as String),
      exploitedDate: json['exploitedDate'] == null
          ? null
          : DateTime.parse(json['exploitedDate'] as String),
      isRepack: json['isRepack'] as bool?,
      warehouse: json['warehouse'] == null
          ? null
          : BusinessPartner.fromJson(json['warehouse'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      isSplit: json['isSplit'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      note: json['note'] as String?,
      imageUrl: json['imageUrl'] as String?,
      exploitStatus: json['exploitStatus'] as String?,
      shippingFee: json['shippingFee'] as int?,
      trackingMiningWeight: json['trackingMiningWeight'] as String?,
      trackingCalculationWeight: json['trackingCalculationWeight'] as String?,
      trackingBarrelCoefficient: json['trackingBarrelCoefficient'] as String?,
      trackingShippingCost: json['trackingShippingCost'] as String?,
      trackingShippingFee: json['trackingShippingFee'] as String?,
      trackingSurcharge: json['trackingSurcharge'] as String?,
      trackingDeliveryFee: json['trackingDeliveryFee'] as String?,
      trackingOtherFee: json['trackingOtherFee'] as String?,
      trackingTotalMoney: json['trackingTotalMoney'] as String?,
      weight: json['weight'] as String?,
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      warehouseVn: json['warehouseVn'] == null
          ? null
          : BusinessPartner.fromJson(
              json['warehouseVn'] as Map<String, dynamic>),
      exploitedBy: json['exploitedBy'] == null
          ? null
          : ExploitedBy.fromJson(json['exploitedBy'] as Map<String, dynamic>),
      sale: json['sale'] == null
          ? null
          : ExploitedBy.fromJson(json['sale'] as Map<String, dynamic>),
      price: json['price'] as String?,
      uid: json['uid'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isRenamed: json['isRenamed'] as bool?,
      productName: json['productName'] as String?,
      hasError: json['hasError'] as bool?,
      status: Order._statusFromJson(json['status'] as String?),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'status': Order._statusToJson(instance.status),
      'trackingType': instance.trackingType,
      'description': instance.description,
      'businessPartner': instance.businessPartner,
      'importDate': instance.importDate?.toIso8601String(),
      'packedDate': instance.packedDate?.toIso8601String(),
      'exportDate': instance.exportDate?.toIso8601String(),
      'exploitedDate': instance.exploitedDate?.toIso8601String(),
      'isRepack': instance.isRepack,
      'warehouse': instance.warehouse,
      'customer': instance.customer,
      'isSplit': instance.isSplit,
      'isDeleted': instance.isDeleted,
      'note': instance.note,
      'exploitStatus': instance.exploitStatus,
      'shippingFee': instance.shippingFee,
      'trackingMiningWeight': instance.trackingMiningWeight,
      'trackingCalculationWeight': instance.trackingCalculationWeight,
      'trackingBarrelCoefficient': instance.trackingBarrelCoefficient,
      'trackingShippingCost': instance.trackingShippingCost,
      'trackingShippingFee': instance.trackingShippingFee,
      'trackingSurcharge': instance.trackingSurcharge,
      'trackingDeliveryFee': instance.trackingDeliveryFee,
      'trackingOtherFee': instance.trackingOtherFee,
      'imageUrl': instance.imageUrl,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'weight': instance.weight,
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
      'warehouseVn': instance.warehouseVn,
      'exploitedBy': instance.exploitedBy,
      'sale': instance.sale,
      'price': instance.price,
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isRenamed': instance.isRenamed,
      'productName': instance.productName,
      'hasError': instance.hasError,
    };
