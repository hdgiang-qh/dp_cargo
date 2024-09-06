
import '../model/box_coeffecient_config.dart';

class ListeBoxCoeffecientConfigResponse {
  List<BoxCoeffecientConfig>? configBoxCoefficient;
  String? message;

  ListeBoxCoeffecientConfigResponse({this.configBoxCoefficient, this.message});

  ListeBoxCoeffecientConfigResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      configBoxCoefficient = <BoxCoeffecientConfig>[];
      json['data'].forEach((v) {
        configBoxCoefficient!.add(BoxCoeffecientConfig.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (configBoxCoefficient != null) {
      data['data'] = configBoxCoefficient!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}
