class PermissionsModelBusinessLogic {
  int? id;
  String? label;

  PermissionsModelBusinessLogic({
    this.id,
    this.label,
  });

  PermissionsModelBusinessLogic.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    label = json['label']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['label'] = label;
    return data;
  }
}

class PermissionsModel {
  int? id;
  String? action;
  String? createdAt;
  String? updatedAt;
  String? createdById;
  String? updatedById;
  String? description;
  List<PermissionsModelBusinessLogic?>? businessLogic;

  PermissionsModel({
    this.id,
    this.action,
    this.createdAt,
    this.updatedAt,
    this.createdById,
    this.updatedById,
    this.description,
    this.businessLogic,
  });

  PermissionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    action = json['action']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    createdById = json['createdById']?.toString();
    updatedById = json['updatedById']?.toString();
    description = json['description']?.toString();
    if (json['businessLogic'] != null) {
      final v = json['businessLogic'];
      final arr0 = <PermissionsModelBusinessLogic>[];
      v.forEach((v) {
        arr0.add(PermissionsModelBusinessLogic.fromJson(v));
      });
      businessLogic = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['action'] = action;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['createdById'] = createdById;
    data['updatedById'] = updatedById;
    data['description'] = description;
    if (businessLogic != null) {
      final v = businessLogic;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['businessLogic'] = arr0;
    }
    return data;
  }
}

class PermissionsNew {
  final PermissionsModel items;
  bool isSelected;

  PermissionsNew(this.items, this.isSelected);
}

class PermissionsFinal {
  PermissionsNew items;
  List<bool> listIsSelected;
  int? per;

  PermissionsFinal(this.items, this.listIsSelected, this.per);
}

class ValueUp {
  int? id;
  int? permission_business_logic_id;

  ValueUp({this.id, this.permission_business_logic_id});

  ValueUp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    permission_business_logic_id = json['permission_business_logic_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['permission_business_logic_id'] = permission_business_logic_id;
    return data;
  }
}
