import '../model/config_price.dart';

class ListConfigPriceResponse {
  List<ConfigPriceData>? configPrice;
  String? message;

  ListConfigPriceResponse({this.configPrice, this.message});

  ListConfigPriceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      configPrice = <ConfigPriceData>[];
      json['data'].forEach((v) {
        configPrice!.add(ConfigPriceData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (configPrice != null) {
      data['data'] = configPrice!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}
