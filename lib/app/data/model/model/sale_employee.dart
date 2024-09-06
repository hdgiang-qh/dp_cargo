import 'package:json_annotation/json_annotation.dart';

import 'customers.dart';


part 'sale_employee.g.dart';

@JsonSerializable()
class SaleEmployee {
  int? id;
  String? username;
  Role? role;
  String? email;
  List<Customers?>? customer;
  String? type;
  bool? confirmed;
  bool? blocked;
  String? phone;
  String? fullname;
  String? avatarUrl;
  String? createdAt;
  String? updatedAt;

  SaleEmployee({this.id,
    this.username,
    this.role,
    this.email,
    this.customer,
    this.type,
    this.confirmed,
    this.blocked,
    this.phone,
    this.fullname,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt});

  factory SaleEmployee.fromJson(Map<String, dynamic> json) => _$SaleEmployeeFromJson(json);
  Map<String, dynamic> toJson()=> _$SaleEmployeeToJson(this);
}

@JsonSerializable()
class Role {
  int? id;
  String? name;
  String? type;
  bool? isDelete;

  Role({this.id, this.name, this.type, this.isDelete});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson()=> _$RoleToJson(this);
}