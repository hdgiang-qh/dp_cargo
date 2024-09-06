import 'package:json_annotation/json_annotation.dart';

import '../../../core/enum/config_price.dart';

part 'config_price.g.dart';

@JsonSerializable()
class ConfigPriceData {
  int? id;
  bool? isDelete;
  String? configKey;
  ConfigValue? configValue;

  ConfigPriceData({this.id, this.isDelete, this.configKey, this.configValue});

  factory ConfigPriceData.fromJson(Map<String, dynamic> json) => _$ConfigPriceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigPriceDataToJson(this);
}

@JsonSerializable()
class ConfigValue {
  Info? info;
  List<ConfigPrice>? config;

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

class ConfigPrice {
  @JsonKey(fromJson: _trackingTypeFromJson, toJson: _trackingTypeToJson)
  TrackingType? trackingType;
  @JsonKey(fromJson: _warehouseFromJson, toJson: _warehouseToJson)
  Warehouse? warehouseConfigId;
  int? cost;

  ConfigPrice({this.trackingType, this.warehouseConfigId, this.cost});

  static TrackingType? _trackingTypeFromJson(int? value) =>
      TrackingType.fromValue(value);

  static int? _trackingTypeToJson(TrackingType? trackingType) => trackingType?.id;

  static Warehouse? _warehouseFromJson(int? value) =>
      Warehouse.fromValue(value);

  static int? _warehouseToJson(Warehouse? warehouse) => warehouse?.id;

  ConfigPrice.fromJson(Map<String, dynamic> json) {
    trackingType = _trackingTypeFromJson(json['tracking_type']);
    warehouseConfigId = _warehouseFromJson(json['warehouse_config_id']);
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tracking_type'] = trackingType?.id;
    data['warehouse_config_id'] = warehouseConfigId?.id;
    data['cost'] = cost;
    return data;
  }
}