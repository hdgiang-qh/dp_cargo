import 'package:json_annotation/json_annotation.dart';

part 'overview.g.dart';

@JsonSerializable()
class OverviewModel {
  String? totalBalance;
  String? totalPayment;
  String? totalDeposit;
  String? customerCount;

  OverviewModel(
      {this.totalBalance,
        this.totalPayment,
        this.totalDeposit,
        this.customerCount});

  factory OverviewModel.fromJson(Map<String, dynamic> json) =>
      _$OverviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewModelToJson(this);
}