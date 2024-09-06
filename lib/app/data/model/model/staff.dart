import 'package:json_annotation/json_annotation.dart';


part 'staff.g.dart';

@JsonSerializable()
class StaffRole {
  int? id;
  String? name;
  String? type;
  bool? isDelete;

  StaffRole({
    this.id,
    this.name,
    this.type,
    this.isDelete,
  });
  factory StaffRole.fromJson(Map<String, dynamic> json) => _$StaffRoleFromJson(json);
  Map<String, dynamic> toJson()=> _$StaffRoleToJson(this);
}

@JsonSerializable()
class Staff {
  int? id;
  String? username;
  StaffRole? role;
  String? email;
  String? type;
  bool? confirmed;
  bool? blocked;
  StaffWarehouseVN? warehouseVN;
  String? phone;
  String? fullname;
  String? createdById;
  String? avatarUrl;
  String? provider;
  String? createdAt;
  String? updatedAt;
  String? updatedById;
  String? code;

  Staff({
    this.id,
    this.username,
    this.role,
    this.email,
    this.type,
    this.confirmed,
    this.blocked,
    this.warehouseVN,
    this.phone,
    this.fullname,
    this.createdById,
    this.avatarUrl,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.updatedById,
    this.code,
  });
  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);
  Map<String, dynamic> toJson()=> _$StaffToJson(this);
}

class StaffWarehouseVN {
  int? id;
  String? name;

  StaffWarehouseVN({
    this.id,
    this.name,
  });
  StaffWarehouseVN.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

@JsonSerializable()
class StaffRoleName {
  int? id;
  String? name;
  String? description;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? createdById;
  String? updatedById;
  bool? isDelete;
  List<StaffAction?>? actions;

  StaffRoleName({
    this.id,
    this.name,
    this.description,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.createdById,
    this.updatedById,
    this.isDelete,
    this.actions
  });
 factory StaffRoleName.fromJson(Map<String, dynamic> json) => _$StaffRoleNameFromJson(json);
  Map<String, dynamic> toJson() => _$StaffRoleNameToJson(this);
}

class StaffActionBusinessLogic {

  int? id;
  String? label;

  StaffActionBusinessLogic({
    this.id,
    this.label,
  });
  StaffActionBusinessLogic.fromJson(Map<String, dynamic> json) {
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

class StaffAction {
  int? id;
  String? action;
  String? description;
  List<StaffActionBusinessLogic?>? businessLogic;
  int? permissionBusinessLogicId;

  StaffAction({
    this.id,
    this.action,
    this.description,
    this.businessLogic,
    this.permissionBusinessLogicId,
  });
  StaffAction.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    action = json['action']?.toString();
    description = json['description']?.toString();
    if (json['businessLogic'] != null) {
      final v = json['businessLogic'];
      final arr0 = <StaffActionBusinessLogic>[];
      v.forEach((v) {
        arr0.add(StaffActionBusinessLogic.fromJson(v));
      });
      businessLogic = arr0;
    }
    permissionBusinessLogicId = json['permissionBusinessLogicId']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['action'] = action;
    data['description'] = description;
    if (businessLogic != null) {
      final v = businessLogic;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['businessLogic'] = arr0;
    }
    data['permissionBusinessLogicId'] = permissionBusinessLogicId;
    return data;
  }
}
