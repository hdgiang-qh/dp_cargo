// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankData _$BankDataFromJson(Map<String, dynamic> json) => BankData(
      id: json['id'] as int?,
      isDelete: json['isDelete'] as bool?,
      configKey: json['configKey'] as String?,
      configValue: json['configValue'] == null
          ? null
          : ConfigValue.fromJson(json['configValue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BankDataToJson(BankData instance) => <String, dynamic>{
      'id': instance.id,
      'isDelete': instance.isDelete,
      'configKey': instance.configKey,
      'configValue': instance.configValue,
    };

ConfigValue _$ConfigValueFromJson(Map<String, dynamic> json) => ConfigValue(
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      config: (json['config'] as List<dynamic>?)
          ?.map((e) => Bank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfigValueToJson(ConfigValue instance) =>
    <String, dynamic>{
      'info': instance.info,
      'config': instance.config,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      bankName: json['bank_name'] as String?,
      accountNumber: json['account_number'] as String?,
      accountName: json['account_name'] as String?,
      bankBranch: json['bank_branch'] as String?,
      logo: json['logo'] as String?,
      qr_code: json['qr_code'] as String?,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'bank_name': instance.bankName,
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'bank_branch': instance.bankBranch,
      'logo': instance.logo,
      'qr_code': instance.qr_code,
    };
