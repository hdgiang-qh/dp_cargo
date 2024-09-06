// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_bill_custom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBCTModel _$CreateBCTModelFromJson(Map<String, dynamic> json) =>
    CreateBCTModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      balance: json['balance'] as String?,
      customerCode: json['customerCode'] as String?,
      accountCode: json['accountCode'] as String?,
      birthday: json['birthday'] as String?,
      displayName: json['displayName'] as String?,
      note: json['note'] as String?,
      chargeMoney: json['chargeMoney'] as String?,
      depositMoney: json['depositMoney'] as String?,
      addressList: json['addressList'] as String?,
      phoneList: json['phoneList'] as String?,
      nickName: json['nickName'] as String?,
      isAllowDebt: json['isAllowDebt'] as String?,
      shippingCost: json['shippingCost'] == null
          ? null
          : CreateBCTModelShippingCost.fromJson(
              json['shippingCost'] as Map<String, dynamic>),
      taxId: json['taxId'] as String?,
      createdById: json['createdById'] as String?,
      idCustomer: json['idCustomer'] as String?,
      creditAmount: json['creditAmount'] as int?,
      isSubcribeToEmailNotification:
          json['isSubcribeToEmailNotification'] as bool?,
      isSubcribeToFcmNotification: json['isSubcribeToFcmNotification'] as bool?,
      gender: json['gender'] as String?,
      uid: json['uid'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      updatedById: json['updatedById'] as String?,
      shippingCostOld: json['shippingCostOld'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      moneyTemporary: json['moneyTemporary'] as int?,
      user: json['user'] == null
          ? null
          : CreateBCTModelUser.fromJson(json['user'] as Map<String, dynamic>),
      sale: json['sale'] == null
          ? null
          : CreateBCTModelSale.fromJson(json['sale'] as Map<String, dynamic>),
      customerServiceStaff: json['customerServiceStaff'] as String?,
    );

Map<String, dynamic> _$CreateBCTModelToJson(CreateBCTModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'balance': instance.balance,
      'customerCode': instance.customerCode,
      'accountCode': instance.accountCode,
      'birthday': instance.birthday,
      'displayName': instance.displayName,
      'note': instance.note,
      'chargeMoney': instance.chargeMoney,
      'depositMoney': instance.depositMoney,
      'addressList': instance.addressList,
      'phoneList': instance.phoneList,
      'nickName': instance.nickName,
      'isAllowDebt': instance.isAllowDebt,
      'shippingCost': instance.shippingCost,
      'taxId': instance.taxId,
      'createdById': instance.createdById,
      'idCustomer': instance.idCustomer,
      'creditAmount': instance.creditAmount,
      'isSubcribeToEmailNotification': instance.isSubcribeToEmailNotification,
      'isSubcribeToFcmNotification': instance.isSubcribeToFcmNotification,
      'gender': instance.gender,
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'updatedById': instance.updatedById,
      'shippingCostOld': instance.shippingCostOld,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'moneyTemporary': instance.moneyTemporary,
      'user': instance.user,
      'sale': instance.sale,
      'customerServiceStaff': instance.customerServiceStaff,
    };
