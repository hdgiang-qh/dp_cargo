// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_of_lading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillOfLadingVnDeliveryBillTracking _$BillOfLadingVnDeliveryBillTrackingFromJson(
        Map<String, dynamic> json) =>
    BillOfLadingVnDeliveryBillTracking(
      id: json['id'] as int?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      status: BillOfLadingVnDeliveryBillTracking._statusFromJson(
          json['status'] as String?),
      importDate: json['importDate'] == null
          ? null
          : DateTime.parse(json['importDate'] as String),
      packedDate: json['packedDate'] == null
          ? null
          : DateTime.parse(json['packedDate'] as String),
      exploitedDate: json['exploitedDate'] as String?,
      isRepack: json['isRepack'] as bool?,
      isSplit: json['isSplit'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      exploitStatus: BillOfLadingVnDeliveryBillTracking._statusFromJson(
          json['exploitStatus'] as String?),
      trackingMiningWeight: json['trackingMiningWeight'] as String?,
      trackingCalculationWeight: json['trackingCalculationWeight'] as String?,
      trackingBarrelCoefficient: json['trackingBarrelCoefficient'] as String?,
      trackingShippingCost: json['trackingShippingCost'] as String?,
      trackingShippingFee: json['trackingShippingFee'] as String?,
      trackingDeliveryFee: json['trackingDeliveryFee'] as String?,
      trackingOtherFee: json['trackingOtherFee'] as String?,
      trackingDiscountAmount: json['trackingDiscountAmount'] as int?,
      trackingTotalMoney: json['trackingTotalMoney'] as String?,
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      price: json['price'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isRenamed: json['isRenamed'] as bool?,
      whTrackingId: json['whTrackingId'] as int?,
      vnPackedDate: json['vnPackedDate'] as String?,
      vnImportDate: json['vnImportDate'] as String?,
      vnExportDate: json['vnExportDate'] as String?,
      vnPackedById: json['vnPackedById'] as int?,
      productName: json['productName'] as String?,
    );

Map<String, dynamic> _$BillOfLadingVnDeliveryBillTrackingToJson(
        BillOfLadingVnDeliveryBillTracking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'status':
          BillOfLadingVnDeliveryBillTracking._statusToJson(instance.status),
      'importDate': instance.importDate?.toIso8601String(),
      'packedDate': instance.packedDate?.toIso8601String(),
      'exploitedDate': instance.exploitedDate,
      'isRepack': instance.isRepack,
      'isSplit': instance.isSplit,
      'isDeleted': instance.isDeleted,
      'exploitStatus': BillOfLadingVnDeliveryBillTracking._statusToJson(
          instance.exploitStatus),
      'trackingMiningWeight': instance.trackingMiningWeight,
      'trackingCalculationWeight': instance.trackingCalculationWeight,
      'trackingBarrelCoefficient': instance.trackingBarrelCoefficient,
      'trackingShippingCost': instance.trackingShippingCost,
      'trackingShippingFee': instance.trackingShippingFee,
      'trackingDeliveryFee': instance.trackingDeliveryFee,
      'trackingOtherFee': instance.trackingOtherFee,
      'trackingDiscountAmount': instance.trackingDiscountAmount,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
      'price': instance.price,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isRenamed': instance.isRenamed,
      'whTrackingId': instance.whTrackingId,
      'vnPackedDate': instance.vnPackedDate,
      'vnImportDate': instance.vnImportDate,
      'vnExportDate': instance.vnExportDate,
      'vnPackedById': instance.vnPackedById,
      'productName': instance.productName,
    };

BillOfLadingVnDeliveryBill _$BillOfLadingVnDeliveryBillFromJson(
        Map<String, dynamic> json) =>
    BillOfLadingVnDeliveryBill(
      id: json['id'] as int?,
      code: json['code'] as String?,
      deliveryBillStatus:
          BillOfLadingVnDeliveryBill._deliveryBillStatusFromJson(
              json['deliveryBillStatus'] as String?),
      customerAddress: json['customerAddress'] as String?,
      customerPhone: json['customerPhone'] as String?,
      isConfirmedByCustomer: json['isConfirmedByCustomer'] as bool?,
      isPackaged: json['isPackaged'] as bool?,
      isCharged: json['isCharged'] as bool?,
      createdById: json['createdById'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      tracking: (json['tracking'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BillOfLadingVnDeliveryBillTracking.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BillOfLadingVnDeliveryBillToJson(
        BillOfLadingVnDeliveryBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'deliveryBillStatus':
          BillOfLadingVnDeliveryBill._deliveryBillStatusToJson(
              instance.deliveryBillStatus),
      'customerAddress': instance.customerAddress,
      'customerPhone': instance.customerPhone,
      'isConfirmedByCustomer': instance.isConfirmedByCustomer,
      'isPackaged': instance.isPackaged,
      'isCharged': instance.isCharged,
      'createdById': instance.createdById,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'name': instance.name,
      'email': instance.email,
      'tracking': instance.tracking,
    };

BillOfLadingVnDeliveryBoxesDeliveredBy
    _$BillOfLadingVnDeliveryBoxesDeliveredByFromJson(
            Map<String, dynamic> json) =>
        BillOfLadingVnDeliveryBoxesDeliveredBy(
          id: json['id'] as int?,
          username: json['username'] as String?,
          email: json['email'] as String?,
          provider: json['provider'] as String?,
          password: json['password'] as String?,
          resetPasswordToken: json['resetPasswordToken'] as String?,
          confirmationToken: json['confirmationToken'] as String?,
          confirmed: json['confirmed'] as bool?,
          blocked: json['blocked'] as bool?,
          phone: json['phone'] as String?,
          type: json['type'] as String?,
          fullname: json['fullname'] as String?,
          confirmPassword: json['confirmPassword'] as String?,
          tmpPassword: json['tmpPassword'] as String?,
          createdAt: json['createdAt'] as String?,
          updatedAt: json['updatedAt'] as String?,
          createdById: json['createdById'] as String?,
          updatedById: json['updatedById'] as String?,
          code: json['code'] as String?,
          avatarUrl: json['avatarUrl'] as String?,
        );

Map<String, dynamic> _$BillOfLadingVnDeliveryBoxesDeliveredByToJson(
        BillOfLadingVnDeliveryBoxesDeliveredBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'provider': instance.provider,
      'password': instance.password,
      'resetPasswordToken': instance.resetPasswordToken,
      'confirmationToken': instance.confirmationToken,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'phone': instance.phone,
      'type': instance.type,
      'fullname': instance.fullname,
      'confirmPassword': instance.confirmPassword,
      'tmpPassword': instance.tmpPassword,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'code': instance.code,
      'avatarUrl': instance.avatarUrl,
    };

BillOfLadingVnDeliveryBoxes _$BillOfLadingVnDeliveryBoxesFromJson(
        Map<String, dynamic> json) =>
    BillOfLadingVnDeliveryBoxes(
      id: json['id'] as int?,
      code: json['code'] as String?,
      vnDeliveryOrderId: json['vnDeliveryOrderId'] as int?,
      deliveredById: json['deliveredById'] as int?,
      receivedDate: json['receivedDate'] as String?,
      deliveredDate: json['deliveredDate'] as String?,
      note: json['note'] as String?,
      status: json['status'] as int?,
      deliveredBy: json['deliveredBy'] == null
          ? null
          : BillOfLadingVnDeliveryBoxesDeliveredBy.fromJson(
              json['deliveredBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillOfLadingVnDeliveryBoxesToJson(
        BillOfLadingVnDeliveryBoxes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'vnDeliveryOrderId': instance.vnDeliveryOrderId,
      'deliveredById': instance.deliveredById,
      'receivedDate': instance.receivedDate,
      'deliveredDate': instance.deliveredDate,
      'note': instance.note,
      'status': instance.status,
      'deliveredBy': instance.deliveredBy,
    };

BillOfLadingVnDeliveryUnit _$BillOfLadingVnDeliveryUnitFromJson(
        Map<String, dynamic> json) =>
    BillOfLadingVnDeliveryUnit(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      logoUrl: json['logoUrl'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$BillOfLadingVnDeliveryUnitToJson(
        BillOfLadingVnDeliveryUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'logoUrl': instance.logoUrl,
      'status': instance.status,
    };

BillOfLading _$BillOfLadingFromJson(Map<String, dynamic> json) => BillOfLading(
      id: json['id'] as int?,
      code: json['code'] as String?,
      quantity: json['quantity'] as int?,
      deliveryBillId: json['deliveryBillId'] as int?,
      status: json['status'] as int?,
      vnDeliveryUnitId: json['vnDeliveryUnitId'] as int?,
      vnDeliveryUnit: json['vnDeliveryUnit'] == null
          ? null
          : BillOfLadingVnDeliveryUnit.fromJson(
              json['vnDeliveryUnit'] as Map<String, dynamic>),
      vnDeliveryBoxes: (json['vnDeliveryBoxes'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BillOfLadingVnDeliveryBoxes.fromJson(e as Map<String, dynamic>))
          .toList(),
      vnDeliveryBill: json['vnDeliveryBill'] == null
          ? null
          : BillOfLadingVnDeliveryBill.fromJson(
              json['vnDeliveryBill'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillOfLadingToJson(BillOfLading instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'quantity': instance.quantity,
      'deliveryBillId': instance.deliveryBillId,
      'status': instance.status,
      'vnDeliveryUnitId': instance.vnDeliveryUnitId,
      'vnDeliveryUnit': instance.vnDeliveryUnit,
      'vnDeliveryBoxes': instance.vnDeliveryBoxes,
      'vnDeliveryBill': instance.vnDeliveryBill,
    };
