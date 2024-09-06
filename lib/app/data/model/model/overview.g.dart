// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverviewModel _$OverviewModelFromJson(Map<String, dynamic> json) =>
    OverviewModel(
      totalBalance: json['totalBalance'] as String?,
      totalPayment: json['totalPayment'] as String?,
      totalDeposit: json['totalDeposit'] as String?,
      customerCount: json['customerCount'] as String?,
    );

Map<String, dynamic> _$OverviewModelToJson(OverviewModel instance) =>
    <String, dynamic>{
      'totalBalance': instance.totalBalance,
      'totalPayment': instance.totalPayment,
      'totalDeposit': instance.totalDeposit,
      'customerCount': instance.customerCount,
    };
