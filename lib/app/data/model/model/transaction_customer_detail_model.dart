import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import '../../../core/values/app_colors.dart';
import '../response/list_transaction_response.dart';

part 'transaction_customer_detail_model.g.dart';


@JsonSerializable()
class TransactionCustomerDetailModel {
  int? id;
  String? customerTransactionType;
  String? customerTransactionNote;
  String? customerTransactionMoney;
  String? customerTransactionDate;
  String? customerTransactionBalance;
  String? createdAt;
  String? updatedAt;
  TransactionStatus? status;
  String? image;
  String? bankAccount;
  List<TransactionCustomerDetailCustomer?>? customer;

  TransactionCustomerDetailModel(
      {this.id,
        this.customerTransactionType,
        this.customerTransactionNote,
        this.customerTransactionMoney,
        this.customerTransactionDate,
        this.customerTransactionBalance,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.image,
        this.bankAccount,
        this.customer});


  factory TransactionCustomerDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionCustomerDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionCustomerDetailModelToJson(this);

  Color get customerTransactionBalanceColor {
    int money = 0;
    money = int.tryParse(customerTransactionBalance ?? '') ?? 0;
    if (money >= 0) {
      return AppColors.green1;
    }
    return AppColors.primary;
  }

}

@JsonSerializable()
class TransactionCustomerDetailCustomer {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? balance;
  String? note;
  String? nickName;
  int? shippingCost;
  String? idCustomer;
  int? creditAmount;
  bool? isSubcribeToEmailNotification;
  bool? isSubcribeToFcmNotification;
  String? createdAt;
  String? updatedAt;

  TransactionCustomerDetailCustomer(
      {this.id,
        this.name,
        this.phone,
        this.address,
        this.email,
        this.balance,
        this.note,
        this.nickName,
        this.shippingCost,
        this.idCustomer,
        this.creditAmount,
        this.isSubcribeToEmailNotification,
        this.isSubcribeToFcmNotification,
        this.createdAt,
        this.updatedAt});
  factory TransactionCustomerDetailCustomer.fromJson(Map<String, dynamic> json) =>
      _$TransactionCustomerDetailCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionCustomerDetailCustomerToJson(this);

}