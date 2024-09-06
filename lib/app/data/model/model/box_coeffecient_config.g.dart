// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_coeffecient_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoxCoeffecientConfig _$BoxCoeffecientConfigFromJson(
        Map<String, dynamic> json) =>
    BoxCoeffecientConfig(
      id: json['id'] as int?,
      isDelete: json['isDelete'] as bool?,
      configKey: json['configKey'] as String?,
      configValue: json['configValue'] == null
          ? null
          : ConfigValue.fromJson(json['configValue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoxCoeffecientConfigToJson(
        BoxCoeffecientConfig instance) =>
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
