// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionListResponse _$TransactionListResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionListResponse(
      paginations: json['paginations'] == null
          ? null
          : Meta.fromJson(json['paginations'] as Map<String, dynamic>),
      transactions: (json['data'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TransactionListResponseToJson(
        TransactionListResponse instance) =>
    <String, dynamic>{
      'paginations': instance.paginations,
      'data': instance.transactions,
      'message': instance.message,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as int?,
      customerTransactionType: $enumDecodeNullable(
          _$TransactionTypeEnumMap, json['customerTransactionType']),
      customerTransactionNote: json['customerTransactionNote'] as String?,
      customerTransactionMoney: json['customerTransactionMoney'] as String?,
      customerTransactionDate: json['customerTransactionDate'] == null
          ? null
          : DateTime.parse(json['customerTransactionDate'] as String),
      customerTransactionBalance: json['customerTransactionBalance'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdById: json['createdById'] as int?,
      updatedById: json['updatedById'] as int?,
      status: $enumDecodeNullable(_$TransactionStatusEnumMap, json['status']),
      image: json['image'] as String?,
      bankAccount: json['bankAccount'] as String?,
      customer: (json['customer'] as List<dynamic>?)
          ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
      billCode: json['billCode'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerTransactionType':
          _$TransactionTypeEnumMap[instance.customerTransactionType],
      'customerTransactionNote': instance.customerTransactionNote,
      'customerTransactionMoney': instance.customerTransactionMoney,
      'customerTransactionDate':
          instance.customerTransactionDate?.toIso8601String(),
      'customerTransactionBalance': instance.customerTransactionBalance,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'status': _$TransactionStatusEnumMap[instance.status],
      'image': instance.image,
      'bankAccount': instance.bankAccount,
      'customer': instance.customer,
      'billCode': instance.billCode,
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
