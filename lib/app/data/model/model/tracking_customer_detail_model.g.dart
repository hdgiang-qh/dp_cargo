// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_customer_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingCustomerDetailModel _$TrackingCustomerDetailModelFromJson(
        Map<String, dynamic> json) =>
    TrackingCustomerDetailModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      businessPartner: json['businessPartner'] == null
          ? null
          : BusinessPartner.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      status: TrackingCustomerDetailModel._statusFromJson(
          json['status'] as String?),
      importDate: json['importDate'] as String?,
      packedDate: json['packedDate'] as String?,
      exploitedDate: json['exploitedDate'] as String?,
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
          : TrackingCustomerDetailCustomer.fromJson(
              json['customer'] as Map<String, dynamic>),
      isSplit: json['isSplit'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      imageUrl: json['imageUrl'] as String?,
      note: json['note'] as String?,
      exploitStatus: TrackingCustomerDetailModel._statusFromJson(
          json['exploitStatus'] as String?),
      shippingFee: json['shippingFee'] as int?,
      trackingMiningWeight: json['trackingMiningWeight'] as String?,
      trackingCalculationWeight: json['trackingCalculationWeight'] as String?,
      trackingBarrelCoefficient: json['trackingBarrelCoefficient'] as String?,
      trackingShippingCost: json['trackingShippingCost'] as String?,
      trackingShippingFee: json['trackingShippingFee'] as String?,
      trackingDeliveryFee: json['trackingDeliveryFee'] as String?,
      trackingOtherFee: json['trackingOtherFee'] as String?,
      trackingDiscountAmount: json['trackingDiscountAmount'] as int?,
      trackingTotalMoney: json['trackingTotalMoney'] as String?,
      weight: json['weight'] as String?,
      deliveryBill: json['deliveryBill'] == null
          ? null
          : TrackingCustomerDeliveryBill.fromJson(
              json['deliveryBill'] as Map<String, dynamic>),
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      warehouseVn: json['warehouseVn'] == null
          ? null
          : BusinessPartner.fromJson(
              json['warehouseVn'] as Map<String, dynamic>),
      exploitedBy: json['exploitedBy'] == null
          ? null
          : TrackingCustomerExploitedBy.fromJson(
              json['exploitedBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isRenamed: json['isRenamed'] as bool?,
      whTrackingId: json['whTrackingId'] as int?,
      vnPackedDate: json['vnPackedDate'] as String?,
      vnImportDate: json['vnImportDate'] as String?,
      vnExportDate: json['vnExportDate'] as String?,
      vnPackedById: json['vnPackedById'] as int?,
      productName: json['productName'] as String?,
    );

Map<String, dynamic> _$TrackingCustomerDetailModelToJson(
        TrackingCustomerDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'businessPartner': instance.businessPartner,
      'status': TrackingCustomerDetailModel._statusToJson(instance.status),
      'importDate': instance.importDate,
      'packedDate': instance.packedDate,
      'exploitedDate': instance.exploitedDate,
      'box': instance.box,
      'awb': instance.awb,
      'warehouse': instance.warehouse,
      'customer': instance.customer,
      'isSplit': instance.isSplit,
      'isDeleted': instance.isDeleted,
      'imageUrl': instance.imageUrl,
      'note': instance.note,
      'exploitStatus':
          TrackingCustomerDetailModel._statusToJson(instance.exploitStatus),
      'shippingFee': instance.shippingFee,
      'trackingMiningWeight': instance.trackingMiningWeight,
      'trackingCalculationWeight': instance.trackingCalculationWeight,
      'trackingBarrelCoefficient': instance.trackingBarrelCoefficient,
      'trackingShippingCost': instance.trackingShippingCost,
      'trackingShippingFee': instance.trackingShippingFee,
      'trackingDeliveryFee': instance.trackingDeliveryFee,
      'trackingOtherFee': instance.trackingOtherFee,
      'trackingDiscountAmount': instance.trackingDiscountAmount,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'weight': instance.weight,
      'deliveryBill': instance.deliveryBill,
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
      'warehouseVn': instance.warehouseVn,
      'exploitedBy': instance.exploitedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isRenamed': instance.isRenamed,
      'whTrackingId': instance.whTrackingId,
      'vnPackedDate': instance.vnPackedDate,
      'vnImportDate': instance.vnImportDate,
      'vnExportDate': instance.vnExportDate,
      'vnPackedById': instance.vnPackedById,
      'productName': instance.productName,
    };

TrackingCustomerDetailCustomer _$TrackingCustomerDetailCustomerFromJson(
        Map<String, dynamic> json) =>
    TrackingCustomerDetailCustomer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      nickName: json['nickName'] as String?,
      shippingCost: json['shippingCost'] as int?,
      idCustomer: json['idCustomer'] as String?,
      isSubcribeToEmailNotification:
          json['isSubcribeToEmailNotification'] as bool?,
      isSubcribeToFcmNotification: json['isSubcribeToFcmNotification'] as bool?,
    );

Map<String, dynamic> _$TrackingCustomerDetailCustomerToJson(
        TrackingCustomerDetailCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'nickName': instance.nickName,
      'shippingCost': instance.shippingCost,
      'idCustomer': instance.idCustomer,
      'isSubcribeToEmailNotification': instance.isSubcribeToEmailNotification,
      'isSubcribeToFcmNotification': instance.isSubcribeToFcmNotification,
    };

TrackingCustomerDeliveryBill _$TrackingCustomerDeliveryBillFromJson(
        Map<String, dynamic> json) =>
    TrackingCustomerDeliveryBill(
      id: json['id'] as int?,
      code: json['code'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$TrackingCustomerDeliveryBillToJson(
        TrackingCustomerDeliveryBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'createdAt': instance.createdAt,
    };

TrackingCustomerExploitedBy _$TrackingCustomerExploitedByFromJson(
        Map<String, dynamic> json) =>
    TrackingCustomerExploitedBy(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
    );

Map<String, dynamic> _$TrackingCustomerExploitedByToJson(
        TrackingCustomerExploitedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'fullname': instance.fullname,
    };
