// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigData _$ConfigDataFromJson(Map<String, dynamic> json) => ConfigData(
      id: json['id'] as int?,
      isDelete: json['isDelete'] as bool?,
      configKey: json['configKey'] as String?,
      configValue: json['configValue'] == null
          ? null
          : ConfigValue.fromJson(json['configValue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigDataToJson(ConfigData instance) =>
    <String, dynamic>{
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
          ?.map((e) => Config.fromJson(e as Map<String, dynamic>))
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

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      logoUrl: json['logo_url'] as String?,
      pageTitle: json['page_title'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      address1: json['address_1'] as String?,
      address2: json['address_2'] as String?,
      address3: json['address_3'] as String?,
      facebookPageUrl: json['facebook_page_url'] as String?,
      zaloUrl: json['zalo_url'] as String?,
      scriptHead: json['script_head'] as String?,
      scriptFooter: json['script_footer'] as String?,
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'logo_url': instance.logoUrl,
      'page_title': instance.pageTitle,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'address_3': instance.address3,
      'facebook_page_url': instance.facebookPageUrl,
      'zalo_url': instance.zaloUrl,
      'script_head': instance.scriptHead,
      'script_footer': instance.scriptFooter,
    };
