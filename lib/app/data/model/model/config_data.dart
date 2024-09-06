import 'package:json_annotation/json_annotation.dart';

part 'config_data.g.dart';

@JsonSerializable()
class ConfigData {
  int? id;
  bool? isDelete;
  String? configKey;
  ConfigValue? configValue;

  ConfigData({this.id, this.isDelete, this.configKey, this.configValue});

  factory ConfigData.fromJson(Map<String, dynamic> json) => _$ConfigDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigDataToJson(this);
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


@JsonSerializable()
class Config {
  @JsonKey(name: 'logo_url')
  String? logoUrl;
  @JsonKey(name: 'page_title')
  String? pageTitle;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? email;
  @JsonKey(name: 'address_1')
  String? address1;
  @JsonKey(name: 'address_2')
  String? address2;
  @JsonKey(name: 'address_3')
  String? address3;
  @JsonKey(name: 'facebook_page_url')
  String? facebookPageUrl;
  @JsonKey(name: 'zalo_url')
  String? zaloUrl;
  @JsonKey(name: 'script_head')
  String? scriptHead;
  @JsonKey(name: 'script_footer')
  String? scriptFooter;

  Config(
      {this.logoUrl,
      this.pageTitle,
      this.phoneNumber,
      this.email,
      this.address1,
      this.address2,
      this.address3,
      this.facebookPageUrl,
      this.zaloUrl,
      this.scriptHead,
      this.scriptFooter});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
