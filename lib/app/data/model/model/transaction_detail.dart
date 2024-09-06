import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../response/list_transaction_response.dart';
import 'customer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_detail.g.dart';

@JsonSerializable()
class TransactionDetail {
  int? id;
  TransactionType? customerTransactionType;
  String? customerTransactionNote;
  String? customerTransactionMoney;
  String? customerTransactionDate;
  String? customerTransactionBalance;
  String? createdAt;
  String? updatedAt;
  DateTime? createdById;
  DateTime? updatedById;
  TransactionStatus? status;
  String? image;
  String? bankAccount;
  List<Customer?>? customer;

  Color get customerTransactionBalanceColor {
    int money = 0;
    money = int.tryParse(customerTransactionBalance ?? '') ?? 0;
    if (money >= 0) {
      return AppColors.green1;
    }
    return AppColors.primary;
  }

  TransactionDetail(
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
      this.customer,this.bankAccount});

  factory TransactionDetail.fromJson(Map<String, dynamic> json) => _$TransactionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDetailToJson(this);
}
