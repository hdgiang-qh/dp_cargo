// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchTracking _$SearchTrackingFromJson(Map<String, dynamic> json) =>
    SearchTracking(
      id: json['id'] as int?,
      code: json['code'] as String?,
      trackingType: json['trackingType'] == null
          ? null
          : SearchTrackingTrackingType.fromJson(
              json['trackingType'] as Map<String, dynamic>),
      description: json['description'] as String?,
      businessPartner: json['businessPartner'] == null
          ? null
          : SearchTrackingBusinessPartner.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      status: json['status'] as String?,
      importDate: json['importDate'] as String?,
      repackDate: json['repackDate'] as String?,
      packedDate: json['packedDate'] as String?,
      exportDate: json['exportDate'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      completedAt: json['completedAt'] as String?,
      exploitedDate: json['exploitedDate'] as String?,
      invoicedDate: json['invoicedDate'] as String?,
      checkingDate: json['checkingDate'] as String?,
      box: json['box'] == null
          ? null
          : SearchTrackingBox.fromJson(json['box'] as Map<String, dynamic>),
      awb: json['awb'] == null
          ? null
          : SearchTrackingBox.fromJson(json['awb'] as Map<String, dynamic>),
      warehouse: json['warehouse'] == null
          ? null
          : BusinessPartner.fromJson(json['warehouse'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : SearchTrackingCustomer.fromJson(
              json['customer'] as Map<String, dynamic>),
      isSplit: json['isSplit'] as bool?,
      parentTracking: json['parentTracking'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      imageUrl: json['imageUrl'] as String?,
      note: json['note'] as String?,
      exploitStatus: json['exploitStatus'] as String?,
      shippingFee: json['shippingFee'] as String?,
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
      deliveryBill: json['deliveryBill'] == null
          ? null
          : SearchTrackingDeliveryBill.fromJson(
              json['deliveryBill'] as Map<String, dynamic>),
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      warehouseVn: json['warehouseVn'] == null
          ? null
          : SearchTrackingWarehouseVn.fromJson(
              json['warehouseVn'] as Map<String, dynamic>),
      exploitedBy: json['exploitedBy'] == null
          ? null
          : SearchTrackingExploitedBy.fromJson(
              json['exploitedBy'] as Map<String, dynamic>),
      price: json['price'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isRenamed: json['isRenamed'] as bool?,
      vnPackedDate: json['vnPackedDate'] as String?,
      vnImportDate: json['vnImportDate'] as String?,
      vnExportDate: json['vnExportDate'] as String?,
      vnPackedById: json['vnPackedById'] as int?,
      productName: json['productName'] as String?,
    );

Map<String, dynamic> _$SearchTrackingToJson(SearchTracking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'trackingType': instance.trackingType,
      'description': instance.description,
      'businessPartner': instance.businessPartner,
      'status': instance.status,
      'importDate': instance.importDate,
      'repackDate': instance.repackDate,
      'packedDate': instance.packedDate,
      'exportDate': instance.exportDate,
      'arrivalDate': instance.arrivalDate,
      'completedAt': instance.completedAt,
      'exploitedDate': instance.exploitedDate,
      'invoicedDate': instance.invoicedDate,
      'checkingDate': instance.checkingDate,
      'box': instance.box,
      'awb': instance.awb,
      'warehouse': instance.warehouse,
      'customer': instance.customer,
      'isSplit': instance.isSplit,
      'parentTracking': instance.parentTracking,
      'isDeleted': instance.isDeleted,
      'imageUrl': instance.imageUrl,
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
      'trackingDiscountAmount': instance.trackingDiscountAmount,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'deliveryBill': instance.deliveryBill,
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
      'warehouseVn': instance.warehouseVn,
      'exploitedBy': instance.exploitedBy,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isRenamed': instance.isRenamed,
      'vnPackedDate': instance.vnPackedDate,
      'vnImportDate': instance.vnImportDate,
      'vnExportDate': instance.vnExportDate,
      'vnPackedById': instance.vnPackedById,
      'productName': instance.productName,
    };
