import 'package:json_annotation/json_annotation.dart';

part 'configuration_model.g.dart';

// hệ số thùng
@JsonSerializable()
class ConfigurationBoxConfigValueConfig {
  @JsonKey(name: "box_coefficiente")
  String? boxConfiguratione;

  ConfigurationBoxConfigValueConfig({
    this.boxConfiguratione,
  });

  factory ConfigurationBoxConfigValueConfig.fromJson(
          Map<String, dynamic> json) =>
      _$ConfigurationBoxConfigValueConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfigurationBoxConfigValueConfigToJson(this);
}

class ConfigurationBoxConfigValueInfo {
  String? title;
  String? description;

  ConfigurationBoxConfigValueInfo({
    this.title,
    this.description,
  });

  ConfigurationBoxConfigValueInfo.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    description = json['description']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class ConfigurationBoxConfigValue {
  ConfigurationBoxConfigValueInfo? info;
  List<ConfigurationBoxConfigValueConfig?>? config;

  ConfigurationBoxConfigValue({
    this.info,
    this.config,
  });

  ConfigurationBoxConfigValue.fromJson(Map<String, dynamic> json) {
    info = (json['info'] != null)
        ? ConfigurationBoxConfigValueInfo.fromJson(json['info'])
        : null;
    if (json['config'] != null) {
      final v = json['config'];
      final arr0 = <ConfigurationBoxConfigValueConfig>[];
      v.forEach((v) {
        arr0.add(ConfigurationBoxConfigValueConfig.fromJson(v));
      });
      config = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (config != null) {
      final v = config;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['config'] = arr0;
    }
    return data;
  }
}

@JsonSerializable()
class ConfigurationBox {
  int? id;
  bool? isDelete;
  String? configKey;
  ConfigurationBoxConfigValue? configValue;

  ConfigurationBox({
    this.id,
    this.isDelete,
    this.configKey,
    this.configValue,
  });

  factory ConfigurationBox.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationBoxFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationBoxToJson(this);
}

// chung
@JsonSerializable()
class ConfigurationInformation {
  int? id;
  bool? isDelete;
  String? configKey;
  ConfigurationInformationConfigValue? configValue;

  ConfigurationInformation({
    this.id,
    this.isDelete,
    this.configKey,
    this.configValue,
  });

  factory ConfigurationInformation.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationInformationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationInformationToJson(this);
}

@JsonSerializable()
class ConfigurationInformationConfigValueConfig {
  @JsonKey(name: "logo_url")
  String? logoUrl;
  @JsonKey(name: "page_title")
  String? pageTitle;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  String? email;
  @JsonKey(name: "address_1")
  String? address_1;
  @JsonKey(name: "address_2")
  String? address_2;
  @JsonKey(name: "address_3")
  String? address_3;
  @JsonKey(name: "facebook_page_url")
  String? facebookPageUrl;
  @JsonKey(name: "zalo_url")
  String? zaloUrl;
  @JsonKey(name: "app_store")
  String? app_store;
  @JsonKey(name: "ch_play")
  String? ch_play;
  @JsonKey(name: "script_head")
  String? scriptHead;
  @JsonKey(name: "script_footer")
  String? scriptFooter;

  ConfigurationInformationConfigValueConfig({
    this.logoUrl,
    this.pageTitle,
    this.phoneNumber,
    this.email,
    this.address_1,
    this.address_2,
    this.address_3,
    this.facebookPageUrl,
    this.zaloUrl,
    this.app_store,
    this.ch_play,
    this.scriptHead,
    this.scriptFooter,
  });

  factory ConfigurationInformationConfigValueConfig.fromJson(
          Map<String, dynamic> json) =>
      _$ConfigurationInformationConfigValueConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfigurationInformationConfigValueConfigToJson(this);
}

class ConfigurationInformationConfigValueInfo {
  String? title;
  String? description;

  ConfigurationInformationConfigValueInfo({
    this.title,
    this.description,
  });

  ConfigurationInformationConfigValueInfo.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    description = json['description']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class ConfigurationInformationConfigValue {
  ConfigurationInformationConfigValueInfo? info;
  List<ConfigurationInformationConfigValueConfig?>? config;

  ConfigurationInformationConfigValue({
    this.info,
    this.config,
  });

  ConfigurationInformationConfigValue.fromJson(Map<String, dynamic> json) {
    info = (json['info'] != null)
        ? ConfigurationInformationConfigValueInfo.fromJson(json['info'])
        : null;
    if (json['config'] != null) {
      final v = json['config'];
      final arr0 = <ConfigurationInformationConfigValueConfig>[];
      v.forEach((v) {
        arr0.add(ConfigurationInformationConfigValueConfig.fromJson(v));
      });
      config = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (config != null) {
      final v = config;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['config'] = arr0;
    }
    return data;
  }
}

// cau hinh tien to
@JsonSerializable()
class ConfigurationPrefixConfigValueConfig {
  @JsonKey(name: 'order_code_prefix')
  String? orderCodePrefix;
  @JsonKey(name: 'delivery_bill_code_prefix')
  String? deliveryBillCodePrefix;

  ConfigurationPrefixConfigValueConfig({
    this.orderCodePrefix,
    this.deliveryBillCodePrefix,
  });

  factory ConfigurationPrefixConfigValueConfig.fromJson(
          Map<String, dynamic> json) =>
      _$ConfigurationPrefixConfigValueConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfigurationPrefixConfigValueConfigToJson(this);
}

class ConfigurationPrefixConfigValueInfo {
  String? title;
  String? description;

  ConfigurationPrefixConfigValueInfo({
    this.title,
    this.description,
  });

  ConfigurationPrefixConfigValueInfo.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    description = json['description']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class ConfigurationPrefixConfigValue {
  ConfigurationPrefixConfigValueInfo? info;
  List<ConfigurationPrefixConfigValueConfig?>? config;

  ConfigurationPrefixConfigValue({
    this.info,
    this.config,
  });

  ConfigurationPrefixConfigValue.fromJson(Map<String, dynamic> json) {
    info = (json['info'] != null)
        ? ConfigurationPrefixConfigValueInfo.fromJson(json['info'])
        : null;
    if (json['config'] != null) {
      final v = json['config'];
      final arr0 = <ConfigurationPrefixConfigValueConfig>[];
      v.forEach((v) {
        arr0.add(ConfigurationPrefixConfigValueConfig.fromJson(v));
      });
      config = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (config != null) {
      final v = config;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['config'] = arr0;
    }
    return data;
  }
}

class ConfigurationPrefix {
  int? id;
  bool? isDelete;
  String? configKey;
  ConfigurationPrefixConfigValue? configValue;

  ConfigurationPrefix({
    this.id,
    this.isDelete,
    this.configKey,
    this.configValue,
  });

  ConfigurationPrefix.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    isDelete = json['isDelete'];
    configKey = json['configKey']?.toString();
    configValue = (json['configValue'] != null)
        ? ConfigurationPrefixConfigValue.fromJson(json['configValue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['isDelete'] = isDelete;
    data['configKey'] = configKey;
    if (configValue != null) {
      data['configValue'] = configValue!.toJson();
    }
    return data;
  }
}

// cau hinh mail

@JsonSerializable()
class ConfigurationMailConfigValueConfig {
  int? port;
  String? host;
  @JsonKey(name: "mail_server_user")
  String? mailServerUser;
  @JsonKey(name: "mail_server_password")
  String? mailServerPassword;
  @JsonKey(name: "sender_email_address")
  String? senderEmailAddress;
  @JsonKey(name: "sender_email_name")
  String? senderEmailName;
  @JsonKey(name: "admin_contact_receiver_email_address")
  String? adminContactReceiverEmailAddress;

  ConfigurationMailConfigValueConfig({
    this.port,
    this.host,
    this.mailServerUser,
    this.mailServerPassword,
    this.senderEmailAddress,
    this.senderEmailName,
    this.adminContactReceiverEmailAddress,
  });

  factory ConfigurationMailConfigValueConfig.fromJson(
          Map<String, dynamic> json) =>
      _$ConfigurationMailConfigValueConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfigurationMailConfigValueConfigToJson(this);
}

class ConfigurationMailConfigValueInfo {
  String? title;
  String? description;

  ConfigurationMailConfigValueInfo({
    this.title,
    this.description,
  });

  ConfigurationMailConfigValueInfo.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    description = json['description']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class ConfigurationMailConfigValue {
  ConfigurationMailConfigValueInfo? info;
  List<ConfigurationMailConfigValueConfig?>? config;

  ConfigurationMailConfigValue({
    this.info,
    this.config,
  });

  ConfigurationMailConfigValue.fromJson(Map<String, dynamic> json) {
    info = (json['info'] != null)
        ? ConfigurationMailConfigValueInfo.fromJson(json['info'])
        : null;
    if (json['config'] != null) {
      final v = json['config'];
      final arr0 = <ConfigurationMailConfigValueConfig>[];
      v.forEach((v) {
        arr0.add(ConfigurationMailConfigValueConfig.fromJson(v));
      });
      config = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (config != null) {
      final v = config;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['config'] = arr0;
    }
    return data;
  }
}

class ConfigurationMail {
  int? id;
  bool? isDelete;
  String? configKey;
  ConfigurationMailConfigValue? configValue;

  ConfigurationMail({
    this.id,
    this.isDelete,
    this.configKey,
    this.configValue,
  });

  ConfigurationMail.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    isDelete = json['isDelete'];
    configKey = json['configKey']?.toString();
    configValue = (json['configValue'] != null)
        ? ConfigurationMailConfigValue.fromJson(json['configValue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['isDelete'] = isDelete;
    data['configKey'] = configKey;
    if (configValue != null) {
      data['configValue'] = configValue!.toJson();
    }
    return data;
  }
}

// cau hình bang gia
@JsonSerializable()
class ConfigurationPriceConfigValueConfig {
  @JsonKey(name: "tracking_type")
  int? trackingType;
  @JsonKey(name: "warehouse_config_id")
  int? warehouseConfigId;
  int? cost;

  ConfigurationPriceConfigValueConfig({
    this.trackingType,
    this.warehouseConfigId,
    this.cost,
  });

  factory ConfigurationPriceConfigValueConfig.fromJson(
          Map<String, dynamic> json) =>
      _$ConfigurationPriceConfigValueConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfigurationPriceConfigValueConfigToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'tracking_type': trackingType,
      'warehouse_config_id': warehouseConfigId,
      'cost': cost,
    };
  }
}

class ConfigurationPriceConfigValueInfo {
  String? title;
  String? description;

  ConfigurationPriceConfigValueInfo({
    this.title,
    this.description,
  });

  ConfigurationPriceConfigValueInfo.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    description = json['description']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class ConfigurationPriceConfigValue {
  ConfigurationPriceConfigValueInfo? info;
  List<ConfigurationPriceConfigValueConfig?>? config;

  ConfigurationPriceConfigValue({
    this.info,
    this.config,
  });

  ConfigurationPriceConfigValue.fromJson(Map<String, dynamic> json) {
    info = (json['info'] != null)
        ? ConfigurationPriceConfigValueInfo.fromJson(json['info'])
        : null;
    if (json['config'] != null) {
      final v = json['config'];
      final arr0 = <ConfigurationPriceConfigValueConfig>[];
      v.forEach((v) {
        arr0.add(ConfigurationPriceConfigValueConfig.fromJson(v));
      });
      config = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (config != null) {
      final v = config;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['config'] = arr0;
    }
    return data;
  }
}

class ConfigurationPrice {
  int? id;
  bool? isDelete;
  String? configKey;
  ConfigurationPriceConfigValue? configValue;

  ConfigurationPrice({
    this.id,
    this.isDelete,
    this.configKey,
    this.configValue,
  });

  ConfigurationPrice.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    isDelete = json['isDelete'];
    configKey = json['configKey']?.toString();
    configValue = (json['configValue'] != null)
        ? ConfigurationPriceConfigValue.fromJson(json['configValue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['isDelete'] = isDelete;
    data['configKey'] = configKey;
    if (configValue != null) {
      data['configValue'] = configValue!.toJson();
    }
    return data;
  }
}

// match bảng giả
class Field {
  String title;
  String key;
  String dataType;
  String classType;
  Map<String, String>? options;

  Field({
    required this.title,
    required this.key,
    required this.dataType,
    required this.classType,
    this.options,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      title: json['title'],
      key: json['key'],
      dataType: json['data_type'],
      classType: json['class'] ?? '',
      options: json['options'] != null
          ? Map<String, String>.from(json['options'])
          : null,
    );
  }
}

class TrackingData {
  int trackingType;
  int warehouseConfigId;
  int cost;

  TrackingData({
    required this.trackingType,
    required this.warehouseConfigId,
    required this.cost,
  });

  factory TrackingData.fromJson(Map<String, dynamic> json) {
    return TrackingData(
      trackingType: json['tracking_type'],
      warehouseConfigId: json['warehouse_config_id'],
      cost: json['cost'],
    );
  }
}

class ApiResponse {
  List<Field> fields;
  List<TrackingData> data;

  ApiResponse({
    required this.fields,
    required this.data,
  });
}
