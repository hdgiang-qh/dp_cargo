// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      balance: json['balance'] as String?,
      note: json['note'] as String?,
      chargeMoney: json['chargeMoney'] as String?,
      depositMoney: json['depositMoney'] as String?,
      nickName: json['nickName'] as String?,
      isAllowDebt: json['isAllowDebt'] as bool?,
      shippingCost: json['shippingCost'] as int?,
      idCustomer: json['idCustomer'] as String?,
      creditAmount: json['creditAmount'] as int?,
      gender: $enumDecodeNullable(_$SexEnumMap, json['gender']),
      uid: json['uid'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      shippingCostOld: json['shippingCostOld'] as int?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'balance': instance.balance,
      'note': instance.note,
      'chargeMoney': instance.chargeMoney,
      'depositMoney': instance.depositMoney,
      'nickName': instance.nickName,
      'isAllowDebt': instance.isAllowDebt,
      'shippingCost': instance.shippingCost,
      'idCustomer': instance.idCustomer,
      'creditAmount': instance.creditAmount,
      'uid': instance.uid,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'birthday': instance.birthday?.toIso8601String(),
      'shippingCostOld': instance.shippingCostOld,
      'gender': _$SexEnumMap[instance.gender],
      'code': instance.code,
    };

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
  Sex.other: 'other',
};
