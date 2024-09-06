import 'package:json_annotation/json_annotation.dart';

part 'box_coeffecient_config.g.dart';

@JsonSerializable()
class BoxCoeffecientConfig {
  int? id;
  bool? isDelete;
  String? configKey;
  ConfigValue? configValue;

  BoxCoeffecientConfig({this.id, this.isDelete, this.configKey, this.configValue});

  factory BoxCoeffecientConfig.fromJson(Map<String, dynamic> json) => _$BoxCoeffecientConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BoxCoeffecientConfigToJson(this);
}

@JsonSerializable()
class ConfigValue {
  Info? info;
  List<Config>? config;

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

class Config {
  String? boxCoefficiente;

  Config({this.boxCoefficiente});

  Config.fromJson(Map<String, dynamic> json) {
    boxCoefficiente = json['box_coefficiente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['box_coefficiente'] = boxCoefficiente;
    return data;
  }
}
