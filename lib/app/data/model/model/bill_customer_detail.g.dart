// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_customer_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillCustomerDetailCustomer _$BillCustomerDetailCustomerFromJson(
        Map<String, dynamic> json) =>
    BillCustomerDetailCustomer(
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
      isSubcribeToFcmNotification: json['isSubcribeToFcmNotification'] as bool?,
      gender: json['gender'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$BillCustomerDetailCustomerToJson(
        BillCustomerDetailCustomer instance) =>
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
      'gender': instance.gender,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

BillCustomerDetail _$BillCustomerDetailFromJson(Map<String, dynamic> json) =>
    BillCustomerDetail(
      id: json['id'] as int?,
      code: json['code'] as String?,
      deliveryBillStatus: BillCustomerDetail._statusFromJson(
          json['deliveryBillStatus'] as String?),
      customerAddress: json['customerAddress'] as String?,
      customerPhone: json['customerPhone'] as String?,
      isConfirmedByCustomer: json['isConfirmedByCustomer'] as bool?,
      isPackaged: json['isPackaged'] as bool?,
      isCharged: json['isCharged'] as bool?,
      createdById: json['createdById'] as int?,
      customer: (json['customer'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BillCustomerDetailCustomer.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      vnDeliveryOrder: (json['vnDeliveryOrder'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VnDeliveryOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      vnDeliveryBoxes: (json['vnDeliveryBoxes'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VnDeliveryBox.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalTrackingMiningWeight:
          (json['totalTrackingMiningWeight'] as num?)?.toDouble(),
      totalTrackingCalculationWeight:
          (json['totalTrackingCalculationWeight'] as num?)?.toDouble(),
      quantityTracking: json['quantityTracking'] as int?,
      trackingTotalMoney: json['trackingTotalMoney'] as int?,
    );

Map<String, dynamic> _$BillCustomerDetailToJson(BillCustomerDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'deliveryBillStatus':
          BillCustomerDetail._statusToJson(instance.deliveryBillStatus),
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
      'vnDeliveryOrder': instance.vnDeliveryOrder,
      'vnDeliveryBoxes': instance.vnDeliveryBoxes,
      'totalTrackingMiningWeight': instance.totalTrackingMiningWeight,
      'totalTrackingCalculationWeight': instance.totalTrackingCalculationWeight,
      'quantityTracking': instance.quantityTracking,
      'trackingTotalMoney': instance.trackingTotalMoney,
    };
