// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigurationBoxConfigValueConfig _$ConfigurationBoxConfigValueConfigFromJson(
        Map<String, dynamic> json) =>
    ConfigurationBoxConfigValueConfig(
      boxConfiguratione: json['box_coefficiente'] as String?,
    );

Map<String, dynamic> _$ConfigurationBoxConfigValueConfigToJson(
        ConfigurationBoxConfigValueConfig instance) =>
    <String, dynamic>{
      'box_coefficiente': instance.boxConfiguratione,
    };

ConfigurationBox _$ConfigurationBoxFromJson(Map<String, dynamic> json) =>
    ConfigurationBox(
      id: json['id'] as int?,
      isDelete: json['isDelete'] as bool?,
      configKey: json['configKey'] as String?,
      configValue: json['configValue'] == null
          ? null
          : ConfigurationBoxConfigValue.fromJson(
              json['configValue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigurationBoxToJson(ConfigurationBox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isDelete': instance.isDelete,
      'configKey': instance.configKey,
      'configValue': instance.configValue,
    };

ConfigurationInformation _$ConfigurationInformationFromJson(
        Map<String, dynamic> json) =>
    ConfigurationInformation(
      id: json['id'] as int?,
      isDelete: json['isDelete'] as bool?,
      configKey: json['configKey'] as String?,
      configValue: json['configValue'] == null
          ? null
          : ConfigurationInformationConfigValue.fromJson(
              json['configValue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigurationInformationToJson(
        ConfigurationInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isDelete': instance.isDelete,
      'configKey': instance.configKey,
      'configValue': instance.configValue,
    };

ConfigurationInformationConfigValueConfig
    _$ConfigurationInformationConfigValueConfigFromJson(
            Map<String, dynamic> json) =>
        ConfigurationInformationConfigValueConfig(
          logoUrl: json['logo_url'] as String?,
          pageTitle: json['page_title'] as String?,
          phoneNumber: json['phone_number'] as String?,
          email: json['email'] as String?,
          address_1: json['address_1'] as String?,
          address_2: json['address_2'] as String?,
          address_3: json['address_3'] as String?,
          facebookPageUrl: json['facebook_page_url'] as String?,
          zaloUrl: json['zalo_url'] as String?,
          app_store: json['app_store'] as String?,
          ch_play: json['ch_play'] as String?,
          scriptHead: json['script_head'] as String?,
          scriptFooter: json['script_footer'] as String?,
        );

Map<String, dynamic> _$ConfigurationInformationConfigValueConfigToJson(
        ConfigurationInformationConfigValueConfig instance) =>
    <String, dynamic>{
      'logo_url': instance.logoUrl,
      'page_title': instance.pageTitle,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'address_1': instance.address_1,
      'address_2': instance.address_2,
      'address_3': instance.address_3,
      'facebook_page_url': instance.facebookPageUrl,
      'zalo_url': instance.zaloUrl,
      'app_store': instance.app_store,
      'ch_play': instance.ch_play,
      'script_head': instance.scriptHead,
      'script_footer': instance.scriptFooter,
    };

ConfigurationPrefixConfigValueConfig
    _$ConfigurationPrefixConfigValueConfigFromJson(Map<String, dynamic> json) =>
        ConfigurationPrefixConfigValueConfig(
          orderCodePrefix: json['order_code_prefix'] as String?,
          deliveryBillCodePrefix: json['delivery_bill_code_prefix'] as String?,
        );

Map<String, dynamic> _$ConfigurationPrefixConfigValueConfigToJson(
        ConfigurationPrefixConfigValueConfig instance) =>
    <String, dynamic>{
      'order_code_prefix': instance.orderCodePrefix,
      'delivery_bill_code_prefix': instance.deliveryBillCodePrefix,
    };

ConfigurationMailConfigValueConfig _$ConfigurationMailConfigValueConfigFromJson(
        Map<String, dynamic> json) =>
    ConfigurationMailConfigValueConfig(
      port: json['port'] as int?,
      host: json['host'] as String?,
      mailServerUser: json['mail_server_user'] as String?,
      mailServerPassword: json['mail_server_password'] as String?,
      senderEmailAddress: json['sender_email_address'] as String?,
      senderEmailName: json['sender_email_name'] as String?,
      adminContactReceiverEmailAddress:
          json['admin_contact_receiver_email_address'] as String?,
    );

Map<String, dynamic> _$ConfigurationMailConfigValueConfigToJson(
        ConfigurationMailConfigValueConfig instance) =>
    <String, dynamic>{
      'port': instance.port,
      'host': instance.host,
      'mail_server_user': instance.mailServerUser,
      'mail_server_password': instance.mailServerPassword,
      'sender_email_address': instance.senderEmailAddress,
      'sender_email_name': instance.senderEmailName,
      'admin_contact_receiver_email_address':
          instance.adminContactReceiverEmailAddress,
    };

ConfigurationPriceConfigValueConfig
    _$ConfigurationPriceConfigValueConfigFromJson(Map<String, dynamic> json) =>
        ConfigurationPriceConfigValueConfig(
          trackingType: json['tracking_type'] as int?,
          warehouseConfigId: json['warehouse_config_id'] as int?,
          cost: json['cost'] as int?,
        );

Map<String, dynamic> _$ConfigurationPriceConfigValueConfigToJson(
        ConfigurationPriceConfigValueConfig instance) =>
    <String, dynamic>{
      'tracking_type': instance.trackingType,
      'warehouse_config_id': instance.warehouseConfigId,
      'cost': instance.cost,
    };
