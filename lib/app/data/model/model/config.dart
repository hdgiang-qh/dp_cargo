class ConfigValue {
  Info? info;
  List<Config>? config;

  ConfigValue({this.info, this.config});

  ConfigValue.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['config'] != null) {
      config = <Config>[];
      json['config'].forEach((v) {
        config!.add(Config.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (config != null) {
      data['config'] = config!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String? title;
  String? description;

  Info({this.title, this.description});

  Info.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class Config {
  int? trackingType;
  int? warehouseConfigId;
  int? cost;

  Config({this.trackingType, this.warehouseConfigId, this.cost});

  Config.fromJson(Map<String, dynamic> json) {
    trackingType = json['tracking_type'];
    warehouseConfigId = json['warehouse_config_id'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tracking_type'] = trackingType;
    data['warehouse_config_id'] = warehouseConfigId;
    data['cost'] = cost;
    return data;
  }
}
