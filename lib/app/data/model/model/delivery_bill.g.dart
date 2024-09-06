// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryBill _$DeliveryBillFromJson(Map<String, dynamic> json) => DeliveryBill(
      id: json['id'] as int?,
      code: json['code'] as String?,
      customerName: json['customerName'] as String?,
      deliveryBillStatus:
          DeliveryBill._statusFromJson(json['deliveryBillStatus'] as String?),
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
      customer: (json['customer'] as List<dynamic>?)
          ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
      vnDeliveryOrder: (json['vnDeliveryOrder'] as List<dynamic>?)
          ?.map((e) => VnDeliveryOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    )..vnDeliveryBoxes = (json['vnDeliveryBoxes'] as List<dynamic>?)
        ?.map((e) => VnDeliveryBox.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$DeliveryBillToJson(DeliveryBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'customerName': instance.customerName,
      'deliveryBillStatus':
          DeliveryBill._statusToJson(instance.deliveryBillStatus),
      'customerAddress': instance.customerAddress,
      'customerPhone': instance.customerPhone,
      'description': instance.description,
      'note': instance.note,
      'isConfirmedByCustomer': instance.isConfirmedByCustomer,
      'isPackaged': instance.isPackaged,
      'isCharged': instance.isCharged,
      'createdById': instance.createdById,
      'trackings': instance.trackings,
      'customer': instance.customer,
      'vnDeliveryOrder': instance.vnDeliveryOrder,
      'vnDeliveryBoxes': instance.vnDeliveryBoxes,
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

CreateBillModel _$CreateBillModelFromJson(Map<String, dynamic> json) =>
    CreateBillModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      nickName: json['nickName'] as String?,
      balance: json['balance'] as String?,
      moneyTemporary: json['moneyTemporary'] as int?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CreateBillModelTags.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantityTracking: json['quantityTracking'] as int?,
      totalExploitWeight: (json['totalExploitWeight'] as num?)?.toDouble(),
      totalFlyingWeight: (json['totalFlyingWeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CreateBillModelToJson(CreateBillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'nickName': instance.nickName,
      'balance': instance.balance,
      'moneyTemporary': instance.moneyTemporary,
      'tags': instance.tags,
      'quantityTracking': instance.quantityTracking,
      'totalExploitWeight': instance.totalExploitWeight,
      'totalFlyingWeight': instance.totalFlyingWeight,
    };

TrackingCustom _$TrackingCustomFromJson(Map<String, dynamic> json) =>
    TrackingCustom(
      id: json['id'] as int?,
      code: json['code'] as String?,
      trackingType: (json['trackingType'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CreateBillModelTags.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      status: TrackingCustom._statusFromJson(json['status'] as String?),
      exploitedDate: json['exploitedDate'] as String?,
      box: (json['box'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Box.fromJson(e as Map<String, dynamic>))
          .toList(),
      awb: (json['awb'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Box.fromJson(e as Map<String, dynamic>))
          .toList(),
      exploitStatus: TrackingCustom._exploitStatusFromJson(
          json['exploitStatus'] as String?),
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
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      price: json['price'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      vnPackedDate: json['vnPackedDate'] as String?,
      vnImportDate: json['vnImportDate'] as String?,
      vnExportDate: json['vnExportDate'] as String?,
      vnPackedById: json['vnPackedById'] as int?,
      productName: json['productName'] as String?,
    )
      ..importDate = json['importDate'] as String?
      ..packedDate = json['packedDate'] as String?;

Map<String, dynamic> _$TrackingCustomToJson(TrackingCustom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'trackingType': instance.trackingType,
      'description': instance.description,
      'status': TrackingCustom._statusToJson(instance.status),
      'importDate': instance.importDate,
      'packedDate': instance.packedDate,
      'exploitedDate': instance.exploitedDate,
      'box': instance.box,
      'awb': instance.awb,
      'exploitStatus':
          TrackingCustom._exploitStatusToJson(instance.exploitStatus),
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
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'vnPackedDate': instance.vnPackedDate,
      'vnImportDate': instance.vnImportDate,
      'vnExportDate': instance.vnExportDate,
      'vnPackedById': instance.vnPackedById,
      'productName': instance.productName,
    };
