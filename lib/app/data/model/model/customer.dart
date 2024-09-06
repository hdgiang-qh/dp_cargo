import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/enum/sex.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? balance;
  String? note;
  String? chargeMoney;
  String? depositMoney;
  String? nickName;
  bool? isAllowDebt;
  int? shippingCost;
  String? idCustomer;
  int? creditAmount;
  String? uid;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? birthday;
  int? shippingCostOld;
  Sex? gender;
  String? code;

  Customer(
      {this.id,
        this.name,
        this.phone,
        this.address,
        this.email,
        this.balance,
        this.note,
        this.chargeMoney,
        this.depositMoney,
        this.nickName,
        this.isAllowDebt,
        this.shippingCost,
        this.idCustomer,
        this.creditAmount,
        this.gender,
        this.uid,
        this.createdAt,
        this.updatedAt,
        this.shippingCostOld,
        this.birthday,
        this.code});

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  String get formattedCreditAmount {
    if (creditAmount == null) {
      return '0';
    }
    final formatter = NumberFormat("#,##0.##", "vi");
    return "${formatter.format(double.parse(creditAmount.toString()))} đ";
  }
  String get formattedBalance {
    if (balance == null) {
      return '--';
    }
    final formatter = NumberFormat("#,##0.##", "vi");
    return "${formatter.format(double.parse(balance.toString()))} đ";
  }
}

class Tags {
  int? id;
  String? name;
  String? color;

  Tags({this.id, this.name, this.color});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}