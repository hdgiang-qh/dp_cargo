// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customers _$CustomersFromJson(Map<String, dynamic> json) => Customers(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      balance: json['balance'] as String?,
      birthday: json['birthday'] as String?,
      displayName: json['displayName'] as String?,
      note: json['note'] as String?,
      nickName: json['nickName'] as String?,
      isAllowDebt: json['isAllowDebt'] as bool?,
      shippingCost: json['shippingCost'] == null
          ? null
          : ShippingCost.fromJson(json['shippingCost'] as Map<String, dynamic>),
      sale: json['sale'] == null
          ? null
          : Sale.fromJson(json['sale'] as Map<String, dynamic>),
      idCustomer: json['idCustomer'] as String?,
      creditAmount: json['creditAmount'] as int?,
      isSubcribeToEmailNotification:
          json['isSubcribeToEmailNotification'] as bool?,
      isSubcribeToFcmNotification: json['isSubcribeToFcmNotification'] as bool?,
      gender: $enumDecodeNullable(_$SexEnumMap, json['gender']),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      customerServiceStaff: json['customerServiceStaff'] == null
          ? null
          : Sale.fromJson(json['customerServiceStaff'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomersToJson(Customers instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'balance': instance.balance,
      'birthday': instance.birthday,
      'displayName': instance.displayName,
      'note': instance.note,
      'nickName': instance.nickName,
      'isAllowDebt': instance.isAllowDebt,
      'shippingCost': instance.shippingCost,
      'sale': instance.sale,
      'idCustomer': instance.idCustomer,
      'creditAmount': instance.creditAmount,
      'isSubcribeToEmailNotification': instance.isSubcribeToEmailNotification,
      'isSubcribeToFcmNotification': instance.isSubcribeToFcmNotification,
      'gender': _$SexEnumMap[instance.gender],
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'customerServiceStaff': instance.customerServiceStaff,
    };

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
  Sex.other: 'other',
};

ShippingCost _$ShippingCostFromJson(Map<String, dynamic> json) => ShippingCost(
      id: json['id'] as int?,
      configKey: json['configKey'] as String?,
      configValue: json['configValue'] == null
          ? null
          : ConfigValue.fromJson(json['configValue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingCostToJson(ShippingCost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'configKey': instance.configKey,
      'configValue': instance.configValue,
    };

ConfigValue _$ConfigValueFromJson(Map<String, dynamic> json) => ConfigValue(
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      config: (json['config'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ConfigPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfigValueToJson(ConfigValue instance) =>
    <String, dynamic>{
      'info': instance.info,
      'config': instance.config,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

Sale _$SaleFromJson(Map<String, dynamic> json) => Sale(
      id: json['id'] as int?,
      fullname: json['fullname'] as String?,
    );

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
    };
