// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersVnPackedBy _$OrdersVnPackedByFromJson(Map<String, dynamic> json) =>
    OrdersVnPackedBy(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$OrdersVnPackedByToJson(OrdersVnPackedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'avatarUrl': instance.avatarUrl,
    };

OrdersExploitedBy _$OrdersExploitedByFromJson(Map<String, dynamic> json) =>
    OrdersExploitedBy(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
    );

Map<String, dynamic> _$OrdersExploitedByToJson(OrdersExploitedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'fullname': instance.fullname,
    };

OrdersWarehouseVn _$OrdersWarehouseVnFromJson(Map<String, dynamic> json) =>
    OrdersWarehouseVn(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OrdersWarehouseVnToJson(OrdersWarehouseVn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

OrdersDeliveryBill _$OrdersDeliveryBillFromJson(Map<String, dynamic> json) =>
    OrdersDeliveryBill(
      id: json['id'] as int?,
      code: json['code'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$OrdersDeliveryBillToJson(OrdersDeliveryBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'createdAt': instance.createdAt,
    };

OrdersCustomerTags _$OrdersCustomerTagsFromJson(Map<String, dynamic> json) =>
    OrdersCustomerTags(
      id: json['id'] as int?,
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$OrdersCustomerTagsToJson(OrdersCustomerTags instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };

OrdersCustomerShippingCost _$OrdersCustomerShippingCostFromJson(
        Map<String, dynamic> json) =>
    OrdersCustomerShippingCost(
      id: json['id'] as int?,
      configKey: json['configKey'] as String?,
      configValue: json['configValue'] as String?,
    );

Map<String, dynamic> _$OrdersCustomerShippingCostToJson(
        OrdersCustomerShippingCost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'configKey': instance.configKey,
      'configValue': instance.configValue,
    };

OrdersCustomer _$OrdersCustomerFromJson(Map<String, dynamic> json) =>
    OrdersCustomer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      nickName: json['nickName'] as String?,
      shippingCost: json['shippingCost'] == null
          ? null
          : OrdersCustomerShippingCost.fromJson(
              json['shippingCost'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OrdersCustomerTags.fromJson(e as Map<String, dynamic>))
          .toList(),
      idCustomer: json['idCustomer'] as String?,
      isSubcribeToEmailNotification:
          json['isSubcribeToEmailNotification'] as bool?,
      isSubcribeToFcmNotification: json['isSubcribeToFcmNotification'] as bool?,
    );

Map<String, dynamic> _$OrdersCustomerToJson(OrdersCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'nickName': instance.nickName,
      'shippingCost': instance.shippingCost,
      'tags': instance.tags,
      'idCustomer': instance.idCustomer,
      'isSubcribeToEmailNotification': instance.isSubcribeToEmailNotification,
      'isSubcribeToFcmNotification': instance.isSubcribeToFcmNotification,
    };

OrdersBusinessPartner _$OrdersBusinessPartnerFromJson(
        Map<String, dynamic> json) =>
    OrdersBusinessPartner(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OrdersBusinessPartnerToJson(
        OrdersBusinessPartner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

OrdersTrackingType _$OrdersTrackingTypeFromJson(Map<String, dynamic> json) =>
    OrdersTrackingType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$OrdersTrackingTypeToJson(OrdersTrackingType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      id: json['id'] as int?,
      code: json['code'] as String?,
      trackingType: json['trackingType'] == null
          ? null
          : OrdersTrackingType.fromJson(
              json['trackingType'] as Map<String, dynamic>),
      description: json['description'] as String?,
      businessPartner: json['businessPartner'] == null
          ? null
          : OrdersBusinessPartner.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      status: Orders._statusFromJson(json['status'] as String?),
      exploitedDate: json['exploitedDate'] as String?,
      box: json['box'] == null
          ? null
          : Box.fromJson(json['box'] as Map<String, dynamic>),
      awb: json['awb'] == null
          ? null
          : Box.fromJson(json['awb'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : OrdersCustomer.fromJson(json['customer'] as Map<String, dynamic>),
      isDeleted: json['isDeleted'] as bool?,
      imageUrl: json['imageUrl'] as String?,
      note: json['note'] as String?,
      exploitStatus:
          Orders._exploitStatusFromJson(json['exploitStatus'] as String?),
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
          : OrdersDeliveryBill.fromJson(
              json['deliveryBill'] as Map<String, dynamic>),
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      warehouseVn: json['warehouseVn'] == null
          ? null
          : OrdersWarehouseVn.fromJson(
              json['warehouseVn'] as Map<String, dynamic>),
      exploitedBy: json['exploitedBy'] == null
          ? null
          : OrdersExploitedBy.fromJson(
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
      vnPackedBy: json['vnPackedBy'] == null
          ? null
          : OrdersVnPackedBy.fromJson(
              json['vnPackedBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'trackingType': instance.trackingType,
      'description': instance.description,
      'businessPartner': instance.businessPartner,
      'status': Orders._statusToJson(instance.status),
      'exploitedDate': instance.exploitedDate,
      'box': instance.box,
      'awb': instance.awb,
      'customer': instance.customer,
      'isDeleted': instance.isDeleted,
      'imageUrl': instance.imageUrl,
      'note': instance.note,
      'exploitStatus': Orders._exploitStatusToJson(instance.exploitStatus),
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
      'vnPackedBy': instance.vnPackedBy,
    };
