import 'package:json_annotation/json_annotation.dart';

import '../../../core/enum/transaction_status.dart';
import '../../../modules/common_widget/const.dart';

part 'transaction.g.dart';

@JsonSerializable()
class TransactionCustomer {
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
  String? gender;
  String? createdAt;
  String? updatedAt;

  TransactionCustomer({
    this.id,
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
    this.gender,
    this.createdAt,
    this.updatedAt,
  });

  factory TransactionCustomer.fromJson(Map<String, dynamic> json) =>
      _$TransactionCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionCustomerToJson(this);
}

@JsonSerializable()
class Transactions {
  int? id;
  @JsonKey(
      fromJson: _customerTransactionTypeFromJson,
      toJson: _customerTransactionTypeToJson)
  TransactionStatusesUpper? customerTransactionType;
  String? customerTransactionNote;
  String? customerTransactionMoney;
  String? customerTransactionDate;
  String? customerTransactionBalance;
  String? createdAt;
  String? updatedAt;
  String? createdById;
  String? updatedById;
  String? image;
  String? bankAccount;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  ActionStatuses? status;
  List<TransactionCustomer?>? customer;

  Transactions({
    this.id,
    this.customerTransactionType,
    this.customerTransactionNote,
    this.customerTransactionMoney,
    this.customerTransactionDate,
    this.customerTransactionBalance,
    this.createdAt,
    this.updatedAt,
    this.createdById,
    this.updatedById,
    this.image,
    this.bankAccount,
    this.status,
    this.customer,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);

  static TransactionStatusesUpper? _customerTransactionTypeFromJson(
          String? value) =>
      TransactionStatusesUpper.fromValue(value);

  static String? _customerTransactionTypeToJson(
          TransactionStatusesUpper? customerTransactionType) =>
      customerTransactionType?.value;

  static ActionStatuses? _statusFromJson(String? value) =>
      ActionStatuses.fromValue(value);

  static String? _statusToJson(ActionStatuses? status) => status?.value;



  String get formattedCustomerTransactionMoney {
    return Const.convertPrice(customerTransactionMoney);
  }

  String get formattedCustomerTransactionBalance {
    return Const.convertPrice(customerTransactionBalance);
  }

  double get formattedCustomerTransactionBalanceDouble {
    return double.parse(customerTransactionBalance ?? "0.0");
  }

  String get formattedCustomerTransactionDate {
    return Const.convertDate(customerTransactionDate);
  }

  String get formattedCreatedAt {
    return Const.convertDate(createdAt);
  }

  String get formattedUpdateAt {
    return Const.convertDate(updatedAt);
  }

  String get formattedBankAccount {
    if (bankAccount == null) {
      return '--';
    } else {
      return bankAccount.toString();
    }
  }

  String get formattedImage {
    if (image == null) {
      return '--';
    } else {
      return image.toString();
    }
  }
}

@JsonSerializable()
class TransactionNameUser {
  String? username;
  String? email;
  bool? blocked;
  String? phone;
  String? fullname;

  TransactionNameUser({
    this.username,
    this.email,
    this.blocked,
    this.phone,
    this.fullname,
  });

  factory TransactionNameUser.fromJson(Map<String, dynamic> json) =>
      _$TransactionNameUserFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionNameUserToJson(this);
}

@JsonSerializable()
class TransactionName {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? nickName;
  List<TransactionNameUser?>? user;
  String? idCustomer;

  TransactionName({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.nickName,
    this.user,
    this.idCustomer,
  });

 factory TransactionName.fromJson(Map<String, dynamic> json) => _$TransactionNameFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionNameToJson(this);
}


@JsonSerializable()
class BankModelConfigValueConfig {

  @JsonKey(name: 'bank_name')
  String? bankName;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'account_name')
  String? accountName;
  @JsonKey(name: 'bank_branch')
  String? bankBranch;
  String? logo;
  @JsonKey(name: 'qr_code')
  String? qrCode;

  BankModelConfigValueConfig({
    this.bankName,
    this.accountNumber,
    this.accountName,
    this.bankBranch,
    this.logo,
    this.qrCode,
  });
 factory BankModelConfigValueConfig.fromJson(Map<String, dynamic> json) => _$BankModelConfigValueConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelConfigValueConfigToJson(this);
}

@JsonSerializable()
class BankModelConfigValueInfo {

  String? title;
  String? description;

  BankModelConfigValueInfo({
    this.title,
    this.description,
  });
factory  BankModelConfigValueInfo.fromJson(Map<String, dynamic> json) => _$BankModelConfigValueInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelConfigValueInfoToJson(this);
}

@JsonSerializable()
class BankModelConfigValue {

  BankModelConfigValueInfo? info;
  List<BankModelConfigValueConfig?>? config;

  BankModelConfigValue({
    this.info,
    this.config,
  });

  factory BankModelConfigValue.fromJson(Map<String, dynamic> json) =>
      _$BankModelConfigValueFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelConfigValueToJson(this);
}

@JsonSerializable()
class BankModel {
  int? id;
  bool? isDelete;
  String? configKey;
  BankModelConfigValue? configValue;

  BankModel({
    this.id,
    this.isDelete,
    this.configKey,
    this.configValue,
  });
  factory BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelToJson(this);
}

class BankList{
  int? id;
  String? stringName;
   BankList({this.id,this.stringName});
}
