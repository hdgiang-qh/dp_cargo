import 'config.dart';

class ShippingCost {
  int? id;
  String? configKey;
  ConfigValue? configValue;

  ShippingCost({this.id, this.configKey, this.configValue});

  ShippingCost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    configKey = json['configKey'];
    configValue = json['configValue'] != null
        ? ConfigValue.fromJson(json['configValue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['configKey'] = configKey;
    if (configValue != null) {
      data['configValue'] = configValue!.toJson();
    }
    return data;
  }
}