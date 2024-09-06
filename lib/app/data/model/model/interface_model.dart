
class InterfaceModelModelsFields {

  String? title;
  String? key;
  String? dataType;
  String? theClass;
  Map<String, String>? options;

  InterfaceModelModelsFields({
    this.title,
    this.key,
    this.dataType,
    this.theClass,
    this.options,
  });
  factory InterfaceModelModelsFields.fromJson(Map<String, dynamic> json) {
    Map<String, String>? options = json['options'] != null ? Map<String, String>.from(json['options']) : null;
    return InterfaceModelModelsFields(
      title: json['title'],
      key: json['key'],
      dataType: json['data_type'],
      theClass: json['class'],
      options: options,
    );
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['key'] = key;
    data['data_type'] = dataType;
    data['class'] = theClass;
    data['options'] = options!;
    return data;
  }
}

class InterfaceModelModels {
  String? view;
  List<InterfaceModelModelsFields?>? fields;

  InterfaceModelModels({
    this.view,
    this.fields,
  });
  InterfaceModelModels.fromJson(Map<String, dynamic> json) {
    view = json['view']?.toString();
    if (json['fields'] != null) {
      final v = json['fields'];
      final arr0 = <InterfaceModelModelsFields>[];
      v.forEach((v) {
        arr0.add(InterfaceModelModelsFields.fromJson(v));
      });
      fields = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['view'] = view;
    if (fields != null) {
      final v = fields;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['fields'] = arr0;
    }
    return data;
  }
}

class InterfaceModelConfigInformation {


  String? icon;
  String? variant;
  String? url;
  String? name;
  String? key;
  String? description;
  String? configType;

  InterfaceModelConfigInformation({
    this.icon,
    this.variant,
    this.url,
    this.name,
    this.key,
    this.description,
    this.configType,
  });
  InterfaceModelConfigInformation.fromJson(Map<String, dynamic> json) {
    icon = json['icon']?.toString();
    variant = json['variant']?.toString();
    url = json['url']?.toString();
    name = json['name']?.toString();
    key = json['key']?.toString();
    description = json['description']?.toString();
    configType = json['config_type']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icon'] = icon;
    data['variant'] = variant;
    data['url'] = url;
    data['name'] = name;
    data['key'] = key;
    data['description'] = description;
    data['config_type'] = configType;
    return data;
  }
}

class InterfaceModel {

  InterfaceModelConfigInformation? configInformation;
  InterfaceModelModels? models;

  InterfaceModel({
    this.configInformation,
    this.models,
  });
  InterfaceModel.fromJson(Map<String, dynamic> json) {
    configInformation = (json['configInformation'] != null) ? InterfaceModelConfigInformation.fromJson(json['configInformation']) : null;
    models = (json['models'] != null) ? InterfaceModelModels.fromJson(json['models']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (configInformation != null) {
      data['configInformation'] = configInformation!.toJson();
    }
    if (models != null) {
      data['models'] = models!.toJson();
    }
    return data;
  }
}
