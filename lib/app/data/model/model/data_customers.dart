import 'package:json_annotation/json_annotation.dart';

import 'customers.dart';
part 'data_customers.g.dart';


@JsonSerializable()
class DataCustomers {
  int? id;
  String? username;
  String? email;
  Customers? customer;
  String? type;
  bool? confirmed;
  bool? blocked;
  String? phone;
  String? fullname;
  String? avatarUrl;
  String? createdAt;
  String? updatedAt;

  DataCustomers(
      {this.id,
        this.username,
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

  factory DataCustomers.fromJson(Map<String, dynamic> json) =>
      _$DataCustomersFromJson(json);

  Map<String, dynamic> toJson() => _$DataCustomersToJson(this);
}