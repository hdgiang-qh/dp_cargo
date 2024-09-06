import 'package:json_annotation/json_annotation.dart';

part 'bank_response.g.dart';

@JsonSerializable()
class BankData {
  int? id;
  bool? isDelete;
  String? configKey;
  ConfigValue? configValue;

  BankData({this.id, this.isDelete, this.configKey, this.configValue});

  factory BankData.fromJson(Map<String, dynamic> json) => _$BankDataFromJson(json);

  Map<String, dynamic> toJson() => _$BankDataToJson(this);
}

@JsonSerializable()
class ConfigValue {
  Info? info;
  List<Bank>? config;

  ConfigValue({this.info, this.config});

  factory ConfigValue.fromJson(Map<String, dynamic> json) => _$ConfigValueFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigValueToJson(this);
}

@JsonSerializable()
class Info {
  String? title;
  String? description;

  Info({this.title, this.description});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Bank {
  @JsonKey(name: 'bank_name')
  String? bankName;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  @JsonKey(name: 'account_name')
  String? accountName;
  @JsonKey(name: 'bank_branch')
  String? bankBranch;
  String? logo;
  String? qr_code;

  Bank({this.bankName, this.accountNumber, this.accountName, this.bankBranch, this.logo, this.qr_code});

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);

  String get bankStr {
    return '$accountNumber - $accountName - $bankBranch - $bankBranch';
  }
}
