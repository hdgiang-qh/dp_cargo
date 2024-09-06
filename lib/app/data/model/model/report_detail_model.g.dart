// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDetailModelStatisticByDeliveryBillTracking
    _$ReportDetailModelStatisticByDeliveryBillTrackingFromJson(
            Map<String, dynamic> json) =>
        ReportDetailModelStatisticByDeliveryBillTracking(
          id: json['id'] as int?,
          code: json['code'] as String?,
          description: json['description'] as String?,
          status: json['status'] as String?,
          importDate: json['importDate'] as String?,
          packedDate: json['packedDate'] as String?,
          exploitedDate: json['exploitedDate'] as String?,
          isRepack: json['isRepack'] as bool?,
          isSplit: json['isSplit'] as bool?,
          isDeleted: json['isDeleted'] as bool?,
          exploitStatus: json['exploitStatus'] as String?,
          trackingMiningWeight: json['trackingMiningWeight'] as String?,
          trackingCalculationWeight:
              json['trackingCalculationWeight'] as String?,
          trackingBarrelCoefficient:
              json['trackingBarrelCoefficient'] as String?,
          trackingShippingCost: json['trackingShippingCost'] as String?,
          trackingShippingFee: json['trackingShippingFee'] as String?,
          trackingDeliveryFee: json['trackingDeliveryFee'] as String?,
          trackingDiscountAmount: json['trackingDiscountAmount'] as int?,
          trackingTotalMoney: json['trackingTotalMoney'] as String?,
          trackingAmount: json['trackingAmount'] as int?,
          orderId: json['orderId'] as String?,
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

Map<String, dynamic> _$ReportDetailModelStatisticByDeliveryBillTrackingToJson(
        ReportDetailModelStatisticByDeliveryBillTracking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
      'status': instance.status,
      'importDate': instance.importDate,
      'packedDate': instance.packedDate,
      'exploitedDate': instance.exploitedDate,
      'isRepack': instance.isRepack,
      'isSplit': instance.isSplit,
      'isDeleted': instance.isDeleted,
      'exploitStatus': instance.exploitStatus,
      'trackingMiningWeight': instance.trackingMiningWeight,
      'trackingCalculationWeight': instance.trackingCalculationWeight,
      'trackingBarrelCoefficient': instance.trackingBarrelCoefficient,
      'trackingShippingCost': instance.trackingShippingCost,
      'trackingShippingFee': instance.trackingShippingFee,
      'trackingDeliveryFee': instance.trackingDeliveryFee,
      'trackingDiscountAmount': instance.trackingDiscountAmount,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
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

ReportDetailModelStatisticByDeliveryBillCustomer
    _$ReportDetailModelStatisticByDeliveryBillCustomerFromJson(
            Map<String, dynamic> json) =>
        ReportDetailModelStatisticByDeliveryBillCustomer(
          id: json['id'] as int?,
          name: json['name'] as String?,
          phone: json['phone'] as String?,
          address: json['address'] as String?,
          email: json['email'] as String?,
          balance: json['balance'] as String?,
          note: json['note'] as String?,
          nickName: json['nickName'] as String?,
          shippingCost: json['shippingCost'] as int?,
          idCustomer: json['idCustomer'] as String?,
          creditAmount: json['creditAmount'] as int?,
          isSubcribeToEmailNotification:
              json['isSubcribeToEmailNotification'] as bool?,
          isSubcribeToFcmNotification:
              json['isSubcribeToFcmNotification'] as bool?,
          createdAt: json['createdAt'] as String?,
          updatedAt: json['updatedAt'] as String?,
        );

Map<String, dynamic> _$ReportDetailModelStatisticByDeliveryBillCustomerToJson(
        ReportDetailModelStatisticByDeliveryBillCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'balance': instance.balance,
      'note': instance.note,
      'nickName': instance.nickName,
      'shippingCost': instance.shippingCost,
      'idCustomer': instance.idCustomer,
      'creditAmount': instance.creditAmount,
      'isSubcribeToEmailNotification': instance.isSubcribeToEmailNotification,
      'isSubcribeToFcmNotification': instance.isSubcribeToFcmNotification,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

ReportDetailModelStatisticByDeliveryBill
    _$ReportDetailModelStatisticByDeliveryBillFromJson(
            Map<String, dynamic> json) =>
        ReportDetailModelStatisticByDeliveryBill(
          id: json['id'] as int?,
          code: json['code'] as String?,
          deliveryBillStatus: json['deliveryBillStatus'] as String?,
          customerAddress: json['customerAddress'] as String?,
          customerPhone: json['customerPhone'] as String?,
          isConfirmedByCustomer: json['isConfirmedByCustomer'] as bool?,
          isPackaged: json['isPackaged'] as bool?,
          isCharged: json['isCharged'] as bool?,
          createdById: json['createdById'] as int?,
          customer: (json['customer'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ReportDetailModelStatisticByDeliveryBillCustomer.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
          createdAt: json['createdAt'] as String?,
          updatedAt: json['updatedAt'] as String?,
          name: json['name'] as String?,
          email: json['email'] as String?,
          tracking: (json['tracking'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ReportDetailModelStatisticByDeliveryBillTracking.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
          totalTrackingMiningWeight:
              (json['totalTrackingMiningWeight'] as num?)?.toDouble(),
          totalTrackingCalculationWeight:
              (json['totalTrackingCalculationWeight'] as num?)?.toDouble(),
          trackingTotalMoney: json['trackingTotalMoney'] as int?,
          trackingTotalShippingFee: json['trackingTotalShippingFee'] as int?,
        );

Map<String, dynamic> _$ReportDetailModelStatisticByDeliveryBillToJson(
        ReportDetailModelStatisticByDeliveryBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'deliveryBillStatus': instance.deliveryBillStatus,
      'customerAddress': instance.customerAddress,
      'customerPhone': instance.customerPhone,
      'isConfirmedByCustomer': instance.isConfirmedByCustomer,
      'isPackaged': instance.isPackaged,
      'isCharged': instance.isCharged,
      'createdById': instance.createdById,
      'customer': instance.customer,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'name': instance.name,
      'email': instance.email,
      'tracking': instance.tracking,
      'totalTrackingMiningWeight': instance.totalTrackingMiningWeight,
      'totalTrackingCalculationWeight': instance.totalTrackingCalculationWeight,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'trackingTotalShippingFee': instance.trackingTotalShippingFee,
    };

ReportDetailModel _$ReportDetailModelFromJson(Map<String, dynamic> json) =>
    ReportDetailModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      fullname: json['fullname'] as String?,
      warehouseName: json['warehouseName'] as String?,
      deliveryBillCount: json['deliveryBillCount'] as int?,
      statisticByDeliveryBill:
          (json['statisticByDeliveryBill'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ReportDetailModelStatisticByDeliveryBill.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ReportDetailModelToJson(ReportDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullname': instance.fullname,
      'warehouseName': instance.warehouseName,
      'deliveryBillCount': instance.deliveryBillCount,
      'statisticByDeliveryBill': instance.statisticByDeliveryBill,
    };
