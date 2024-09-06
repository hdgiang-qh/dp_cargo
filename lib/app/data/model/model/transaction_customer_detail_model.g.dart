// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_customer_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionCustomerDetailModel _$TransactionCustomerDetailModelFromJson(
        Map<String, dynamic> json) =>
    TransactionCustomerDetailModel(
      id: json['id'] as int?,
      customerTransactionType: json['customerTransactionType'] as String?,
      customerTransactionNote: json['customerTransactionNote'] as String?,
      customerTransactionMoney: json['customerTransactionMoney'] as String?,
      customerTransactionDate: json['customerTransactionDate'] as String?,
      customerTransactionBalance: json['customerTransactionBalance'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      status: $enumDecodeNullable(_$TransactionStatusEnumMap, json['status']),
      image: json['image'] as String?,
      bankAccount: json['bankAccount'] as String?,
      customer: (json['customer'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TransactionCustomerDetailCustomer.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionCustomerDetailModelToJson(
        TransactionCustomerDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerTransactionType': instance.customerTransactionType,
      'customerTransactionNote': instance.customerTransactionNote,
      'customerTransactionMoney': instance.customerTransactionMoney,
      'customerTransactionDate': instance.customerTransactionDate,
      'customerTransactionBalance': instance.customerTransactionBalance,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'status': _$TransactionStatusEnumMap[instance.status],
      'image': instance.image,
      'bankAccount': instance.bankAccount,
      'customer': instance.customer,
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'chờ duyệt',
  TransactionStatus.complete: 'hoàn thành',
  TransactionStatus.canceled: 'hủy',
};

TransactionCustomerDetailCustomer _$TransactionCustomerDetailCustomerFromJson(
        Map<String, dynamic> json) =>
    TransactionCustomerDetailCustomer(
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
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$TransactionCustomerDetailCustomerToJson(
        TransactionCustomerDetailCustomer instance) =>
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
