// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDetail _$TransactionDetailFromJson(Map<String, dynamic> json) =>
    TransactionDetail(
      id: json['id'] as int?,
      customerTransactionType: $enumDecodeNullable(
          _$TransactionTypeEnumMap, json['customerTransactionType']),
      customerTransactionNote: json['customerTransactionNote'] as String?,
      customerTransactionMoney: json['customerTransactionMoney'] as String?,
      customerTransactionDate: json['customerTransactionDate'] as String?,
      customerTransactionBalance: json['customerTransactionBalance'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdById: json['createdById'] == null
          ? null
          : DateTime.parse(json['createdById'] as String),
      updatedById: json['updatedById'] == null
          ? null
          : DateTime.parse(json['updatedById'] as String),
      status: $enumDecodeNullable(_$TransactionStatusEnumMap, json['status']),
      image: json['image'] as String?,
      customer: (json['customer'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankAccount: json['bankAccount'] as String?,
    );

Map<String, dynamic> _$TransactionDetailToJson(TransactionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerTransactionType':
          _$TransactionTypeEnumMap[instance.customerTransactionType],
      'customerTransactionNote': instance.customerTransactionNote,
      'customerTransactionMoney': instance.customerTransactionMoney,
      'customerTransactionDate': instance.customerTransactionDate,
      'customerTransactionBalance': instance.customerTransactionBalance,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdById': instance.createdById?.toIso8601String(),
      'updatedById': instance.updatedById?.toIso8601String(),
      'status': _$TransactionStatusEnumMap[instance.status],
      'image': instance.image,
      'bankAccount': instance.bankAccount,
      'customer': instance.customer,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.total: 'TẤT CẢ',
  TransactionType.payment: 'THANH TOÁN',
  TransactionType.reChange: 'NẠP TIỀN',
  TransactionType.refund: 'HOÀN TIỀN',
  TransactionType.withDraw: 'RÚT TIỀN',
};

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'chờ duyệt',
  TransactionStatus.complete: 'hoàn thành',
  TransactionStatus.canceled: 'hủy',
};
