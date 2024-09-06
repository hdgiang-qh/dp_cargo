import 'dart:ui';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../model/customer.dart';
import 'pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_transaction_response.g.dart';

@JsonSerializable()
class TransactionListResponse {
  Meta? paginations;
  @JsonKey(name: 'data')
  List<Transaction>? transactions;
  String? message;

  TransactionListResponse({this.paginations, this.transactions, this.message});

  factory TransactionListResponse.fromJson(Map<String, dynamic> json) => _$TransactionListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionListResponseToJson(this);
}

@JsonSerializable()
class Transaction {
  int? id;
  TransactionType? customerTransactionType;
  String? customerTransactionNote;
  String? customerTransactionMoney;
  DateTime? customerTransactionDate;
  String? customerTransactionBalance;
  String? createdAt;
  String? updatedAt;
  int? createdById;
  int? updatedById;
  TransactionStatus? status;
  String? image;
  String? bankAccount;
  List<Customer>? customer;
  String? billCode;

  Color get customerTransactionBalanceColor {
    int money = 0;
    money = int.tryParse(customerTransactionBalance ?? '') ?? 0;
    if (money >= 0) {
      return AppColors.green1;
    }
    return AppColors.primary;
  }

  Transaction(
      {this.id,
      this.customerTransactionType,
      this.customerTransactionNote,
      this.customerTransactionMoney,
      this.customerTransactionDate,
      this.customerTransactionBalance,
      this.createdAt,
      this.updatedAt,
      this.createdById,
      this.updatedById,
      this.status,
      this.image,
      this.bankAccount,
      this.customer,
      this.billCode});

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

enum TransactionStatus {
  @JsonValue('chờ duyệt')
  pending('Chờ duyệt', Color(0xff4DACC8), Color(0x334DACC8)),
  @JsonValue('hoàn thành')
  complete('Hoàn thành', Color(0xff27AE60), Color(0x3327AE60)),
  @JsonValue('hủy')
  canceled('Hủy', Color(0xffCC3333), Color(0x33CC3333));

  final String title;
  final Color color;
  final Color colorBg;

  const TransactionStatus(this.title, this.color, this.colorBg);
}

extension TransactionStatusExt on TransactionStatus {
  String get titleText {
    return title.capitalizeFirst ?? '';
  }

  Color get color {
    switch (this) {
      case TransactionStatus.pending:
        return AppColors.status5;
      case TransactionStatus.complete:
        return AppColors.status6;
      case TransactionStatus.canceled:
        return AppColors.canceled;
    }
  }
}

enum TransactionType {
  @JsonValue('TẤT CẢ')
  total('TẤT CẢ'),
  @JsonValue('THANH TOÁN')
  payment('THANH TOÁN'),
  @JsonValue('NẠP TIỀN')
  reChange('NẠP TIỀN'),
  @JsonValue('HOÀN TIỀN')
  refund('HOÀN TIỀN'),
  @JsonValue('RÚT TIỀN')
  withDraw('RÚT TIỀN');

  final String title;

  const TransactionType(this.title);
}

extension TransactionTypeExt on TransactionType {
  String get value {
    if (title == 'TẤT CẢ') return '';
    return title;
  }

  Color get color {
    switch (this) {
      case TransactionType.total:
        return AppColors.canceled;
      case TransactionType.payment:
        return AppColors.transportingToVN;
      case TransactionType.reChange:
        return AppColors.exploited;
      case TransactionType.refund:
        return AppColors.waitingForWarehouseUS;
      case TransactionType.withDraw:
        return AppColors.status5;
    }
  }

  Color get moneyTextColor {
    switch (this) {
      case TransactionType.total:
        return AppColors.canceled;
      case TransactionType.payment:
        return AppColors.primary;
      case TransactionType.reChange:
        return AppColors.green1;
      case TransactionType.refund:
        return AppColors.green1;
      case TransactionType.withDraw:
        return AppColors.primary;
    }
  }
}
