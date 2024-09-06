// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'awb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AWBModel _$AWBModelFromJson(Map<String, dynamic> json) => AWBModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      boxQuantity: json['boxQuantity'] as int?,
      completedAt: json['completedAt'] as String?,
      flightDate: json['flightDate'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      exploitStatus: AWBModel._statusFromJson(json['exploitStatus'] as String?),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      syncStatus: json['syncStatus'] as String?,
      trackingTotalMoney: (json['trackingTotalMoney'] as num?)?.toDouble(),
      trackingCalculationWeight:
          (json['trackingCalculationWeight'] as num?)?.toDouble(),
      trackingMiningWeight: (json['trackingMiningWeight'] as num?)?.toDouble(),
      trackingCode: (json['trackingCode'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      boxCode:
          (json['boxCode'] as List<dynamic>?)?.map((e) => e as String).toList(),
      trackingQuantity: json['trackingQuantity'] as int?,
    );

Map<String, dynamic> _$AWBModelToJson(AWBModel instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'weight': instance.weight,
      'boxQuantity': instance.boxQuantity,
      'completedAt': instance.completedAt,
      'flightDate': instance.flightDate,
      'arrivalDate': instance.arrivalDate,
      'exploitStatus': AWBModel._statusToJson(instance.exploitStatus),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'syncStatus': instance.syncStatus,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'trackingCalculationWeight': instance.trackingCalculationWeight,
      'trackingMiningWeight': instance.trackingMiningWeight,
      'trackingCode': instance.trackingCode,
      'boxCode': instance.boxCode,
      'trackingQuantity': instance.trackingQuantity,
    };

AwbDetailModel _$AwbDetailModelFromJson(Map<String, dynamic> json) =>
    AwbDetailModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      boxQuantity: json['boxQuantity'] as int?,
      completedAt: json['completedAt'] as String?,
      exploitStatus:
          AwbDetailModel._statusFromJson(json['exploitStatus'] as String?),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      syncStatus: json['syncStatus'] as String?,
      box: (json['box'] as List<dynamic>?)
          ?.map((e) => BoxAwbDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackingTotalMoney: json['trackingTotalMoney'] as int?,
      trackingCalculationWeight:
          (json['trackingCalculationWeight'] as num?)?.toDouble(),
      trackingMiningWeight: (json['trackingMiningWeight'] as num?)?.toDouble(),
      trackingQuantity: json['trackingQuantity'] as int?,
      trackingExploitedQuantity: json['trackingExploitedQuantity'] as int?,
    );

Map<String, dynamic> _$AwbDetailModelToJson(AwbDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'weight': instance.weight,
      'boxQuantity': instance.boxQuantity,
      'completedAt': instance.completedAt,
      'exploitStatus': AwbDetailModel._statusToJson(instance.exploitStatus),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'syncStatus': instance.syncStatus,
      'box': instance.box,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'trackingCalculationWeight': instance.trackingCalculationWeight,
      'trackingMiningWeight': instance.trackingMiningWeight,
      'trackingQuantity': instance.trackingQuantity,
      'trackingExploitedQuantity': instance.trackingExploitedQuantity,
    };

BoxAwbDetail _$BoxAwbDetailFromJson(Map<String, dynamic> json) => BoxAwbDetail(
      id: json['id'] as int?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      trackingQuantity: json['trackingQuantity'] as int?,
      status: json['status'] as String?,
      weight: json['weight'] as int?,
      exploitStatus:
          BoxAwbDetail._statusFromJson(json['exploitStatus'] as String?),
      exploitStartDate: json['exploitStartDate'] as String?,
      exploitEndDate: json['exploitEndDate'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      warehouseVN: (json['warehouseVN'] as List<dynamic>?)
          ?.map((e) => WarehouseVN.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BoxAwbDetailToJson(BoxAwbDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'trackingQuantity': instance.trackingQuantity,
      'status': instance.status,
      'weight': instance.weight,
      'exploitStatus': BoxAwbDetail._statusToJson(instance.exploitStatus),
      'exploitStartDate': instance.exploitStartDate,
      'exploitEndDate': instance.exploitEndDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'warehouseVN': instance.warehouseVN,
    };

WarehouseVN _$WarehouseVNFromJson(Map<String, dynamic> json) => WarehouseVN(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WarehouseVNToJson(WarehouseVN instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AwbBoxData _$AwbBoxDataFromJson(Map<String, dynamic> json) => AwbBoxData(
      boxInfo: json['boxInfo'] == null
          ? null
          : AwbBoxInfo.fromJson(json['boxInfo'] as Map<String, dynamic>),
      exploitedTrackingCount: (json['exploitedTrackingCount'] as List<dynamic>?)
          ?.map(
              (e) => ExploitedTrackingCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackings: (json['trackings'] as List<dynamic>?)
          ?.map((e) => AwbTrackings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AwbBoxDataToJson(AwbBoxData instance) =>
    <String, dynamic>{
      'boxInfo': instance.boxInfo,
      'exploitedTrackingCount': instance.exploitedTrackingCount,
      'trackings': instance.trackings,
    };

AwbBoxInfo _$AwbBoxInfoFromJson(Map<String, dynamic> json) => AwbBoxInfo(
      id: json['id'] as int?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      trackingQuantity: json['trackingQuantity'] as int?,
      status: json['status'] as String?,
      weight: json['weight'] as int?,
      exploitStatus: json['exploitStatus'] as String?,
      exploitStartDate: json['exploitStartDate'] as String?,
      exploitEndDate: json['exploitEndDate'] as String?,
      boxRate: json['boxRate'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      warehouseVN: json['warehouseVN'] == null
          ? null
          : WarehouseVN.fromJson(json['warehouseVN'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AwbBoxInfoToJson(AwbBoxInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'trackingQuantity': instance.trackingQuantity,
      'status': instance.status,
      'weight': instance.weight,
      'exploitStatus': instance.exploitStatus,
      'exploitStartDate': instance.exploitStartDate,
      'exploitEndDate': instance.exploitEndDate,
      'boxRate': instance.boxRate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'warehouseVN': instance.warehouseVN,
    };

ExploitedTrackingCount _$ExploitedTrackingCountFromJson(
        Map<String, dynamic> json) =>
    ExploitedTrackingCount(
      count: json['count'] as String?,
    );

Map<String, dynamic> _$ExploitedTrackingCountToJson(
        ExploitedTrackingCount instance) =>
    <String, dynamic>{
      'count': instance.count,
    };

AwbTrackings _$AwbTrackingsFromJson(Map<String, dynamic> json) => AwbTrackings(
      id: json['id'] as int?,
      code: json['code'] as String?,
      trackingType: json['trackingType'] == null
          ? null
          : AwbTrackingType.fromJson(
              json['trackingType'] as Map<String, dynamic>),
      description: json['description'] as String?,
      businessPartner: json['businessPartner'] == null
          ? null
          : WarehouseVN.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      importDate: json['importDate'] as String?,
      packedDate: json['packedDate'] as String?,
      exportDate: json['exportDate'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      exploitedDate: json['exploitedDate'] as String?,
      invoicedDate: json['invoicedDate'] as String?,
      checkingDate: json['checkingDate'] as String?,
      isRepack: json['isRepack'] as bool?,
      warehouse: json['warehouse'] == null
          ? null
          : WarehouseVN.fromJson(json['warehouse'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : AwbBoxCustomer.fromJson(json['customer'] as Map<String, dynamic>),
      isSplit: json['isSplit'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      imageUrl: json['imageUrl'] as String?,
      note: json['note'] as String?,
      exploitStatus:
          AwbTrackings._statusFromJson(json['exploitStatus'] as String?),
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
      weight: (json['weight'] as num?)?.toDouble(),
      deliveryBill: json['deliveryBill'] == null
          ? null
          : AwbBoxDeliveryBill.fromJson(
              json['deliveryBill'] as Map<String, dynamic>),
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      warehouseVn: json['warehouseVn'] == null
          ? null
          : WarehouseVN.fromJson(json['warehouseVn'] as Map<String, dynamic>),
      exploitedBy: json['exploitedBy'] == null
          ? null
          : AwbBoxExploitedBy.fromJson(
              json['exploitedBy'] as Map<String, dynamic>),
      price: json['price'] as String?,
      sale: json['sale'] == null
          ? null
          : Sale.fromJson(json['sale'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isRenamed: json['isRenamed'] as bool?,
      whTrackingId: json['whTrackingId'] as int?,
      vnPackedDate: json['vnPackedDate'] as String?,
      vnImportDate: json['vnImportDate'] as String?,
      vnExportDate: json['vnExportDate'] as String?,
      vnPackedById: json['vnPackedById'] as int?,
      productName: json['productName'] as String?,
    )..status = AwbTrackings._statusTrackingFromJson(json['status'] as String?);

Map<String, dynamic> _$AwbTrackingsToJson(AwbTrackings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'trackingType': instance.trackingType,
      'description': instance.description,
      'businessPartner': instance.businessPartner,
      'importDate': instance.importDate,
      'packedDate': instance.packedDate,
      'exportDate': instance.exportDate,
      'arrivalDate': instance.arrivalDate,
      'exploitedDate': instance.exploitedDate,
      'invoicedDate': instance.invoicedDate,
      'checkingDate': instance.checkingDate,
      'isRepack': instance.isRepack,
      'warehouse': instance.warehouse,
      'customer': instance.customer,
      'isSplit': instance.isSplit,
      'isDeleted': instance.isDeleted,
      'imageUrl': instance.imageUrl,
      'note': instance.note,
      'exploitStatus': AwbTrackings._statusToJson(instance.exploitStatus),
      'status': AwbTrackings._statusTrackingToJson(instance.status),
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
      'deliveryBill': instance.deliveryBill,
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
      'warehouseVn': instance.warehouseVn,
      'exploitedBy': instance.exploitedBy,
      'price': instance.price,
      'sale': instance.sale,
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

AwbTrackingType _$AwbTrackingTypeFromJson(Map<String, dynamic> json) =>
    AwbTrackingType(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AwbTrackingTypeToJson(AwbTrackingType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AwbBoxCustomer _$AwbBoxCustomerFromJson(Map<String, dynamic> json) =>
    AwbBoxCustomer(
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

Map<String, dynamic> _$AwbBoxCustomerToJson(AwbBoxCustomer instance) =>
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

AwbBoxDeliveryBill _$AwbBoxDeliveryBillFromJson(Map<String, dynamic> json) =>
    AwbBoxDeliveryBill(
      id: json['id'] as int?,
      code: json['code'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$AwbBoxDeliveryBillToJson(AwbBoxDeliveryBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'createdAt': instance.createdAt,
    };

AwbBoxExploitedBy _$AwbBoxExploitedByFromJson(Map<String, dynamic> json) =>
    AwbBoxExploitedBy(
      id: json['id'] as int?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
    );

Map<String, dynamic> _$AwbBoxExploitedByToJson(AwbBoxExploitedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'fullname': instance.fullname,
    };
