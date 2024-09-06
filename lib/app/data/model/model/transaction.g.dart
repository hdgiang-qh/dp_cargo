// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionCustomer _$TransactionCustomerFromJson(Map<String, dynamic> json) =>
    TransactionCustomer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      balance: json['balance'] as String?,
      note: json['note'] as String?,
      nickName: json['nickName'] as String?,
      shippingCost: json['shippingCost'] as int?,
      idCustomer: json['idCustomer'] as String?,
      creditAmount: json['creditAmount'] as int?,
      isSubcribeToEmailNotification:
          json['isSubcribeToEmailNotification'] as bool?,
      isSubcribeToFcmNotification: json['isSubcribeToFcmNotification'] as bool?,
      gender: json['gender'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$TransactionCustomerToJson(
        TransactionCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'balance': instance.balance,
      'note': instance.note,
      'nickName': instance.nickName,
      'shippingCost': instance.shippingCost,
      'idCustomer': instance.idCustomer,
      'creditAmount': instance.creditAmount,
      'isSubcribeToEmailNotification': instance.isSubcribeToEmailNotification,
      'isSubcribeToFcmNotification': instance.isSubcribeToFcmNotification,
      'gender': instance.gender,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      id: json['id'] as int?,
      customerTransactionType: Transactions._customerTransactionTypeFromJson(
          json['customerTransactionType'] as String?),
      customerTransactionNote: json['customerTransactionNote'] as String?,
      customerTransactionMoney: json['customerTransactionMoney'] as String?,
      customerTransactionDate: json['customerTransactionDate'] as String?,
      customerTransactionBalance: json['customerTransactionBalance'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      image: json['image'] as String?,
      bankAccount: json['bankAccount'] as String?,
      status: Transactions._statusFromJson(json['status'] as String?),
      customer: (json['customer'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TransactionCustomer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerTransactionType': Transactions._customerTransactionTypeToJson(
          instance.customerTransactionType),
      'customerTransactionNote': instance.customerTransactionNote,
      'customerTransactionMoney': instance.customerTransactionMoney,
      'customerTransactionDate': instance.customerTransactionDate,
      'customerTransactionBalance': instance.customerTransactionBalance,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'image': instance.image,
      'bankAccount': instance.bankAccount,
      'status': Transactions._statusToJson(instance.status),
      'customer': instance.customer,
    };

TransactionNameUser _$TransactionNameUserFromJson(Map<String, dynamic> json) =>
    TransactionNameUser(
      username: json['username'] as String?,
      email: json['email'] as String?,
      blocked: json['blocked'] as bool?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
    );

Map<String, dynamic> _$TransactionNameUserToJson(
        TransactionNameUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'blocked': instance.blocked,
      'phone': instance.phone,
      'fullname': instance.fullname,
    };

TransactionName _$TransactionNameFromJson(Map<String, dynamic> json) =>
    TransactionName(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      nickName: json['nickName'] as String?,
      user: (json['user'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TransactionNameUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      idCustomer: json['idCustomer'] as String?,
    );

Map<String, dynamic> _$TransactionNameToJson(TransactionName instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'nickName': instance.nickName,
      'user': instance.user,
      'idCustomer': instance.idCustomer,
    };

BankModelConfigValueConfig _$BankModelConfigValueConfigFromJson(
        Map<String, dynamic> json) =>
    BankModelConfigValueConfig(
      bankName: json['bank_name'] as String?,
      accountNumber: json['account_number'] as String?,
      accountName: json['account_name'] as String?,
      bankBranch: json['bank_branch'] as String?,
      logo: json['logo'] as String?,
      qrCode: json['qr_code'] as String?,
    );

Map<String, dynamic> _$BankModelConfigValueConfigToJson(
        BankModelConfigValueConfig instance) =>
    <String, dynamic>{
      'bank_name': instance.bankName,
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'bank_branch': instance.bankBranch,
      'logo': instance.logo,
      'qr_code': instance.qrCode,
    };

BankModelConfigValueInfo _$BankModelConfigValueInfoFromJson(
        Map<String, dynamic> json) =>
    BankModelConfigValueInfo(
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$BankModelConfigValueInfoToJson(
        BankModelConfigValueInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

BankModelConfigValue _$BankModelConfigValueFromJson(
        Map<String, dynamic> json) =>
    BankModelConfigValue(
      info: json['info'] == null
          ? null
          : BankModelConfigValueInfo.fromJson(
              json['info'] as Map<String, dynamic>),
      config: (json['config'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BankModelConfigValueConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BankModelConfigValueToJson(
        BankModelConfigValue instance) =>
    <String, dynamic>{
      'info': instance.info,
      'config': instance.config,
    };

BankModel _$BankModelFromJson(Map<String, dynamic> json) => BankModel(
      id: json['id'] as int?,
      isDelete: json['isDelete'] as bool?,
      configKey: json['configKey'] as String?,
      configValue: json['configValue'] == null
          ? null
          : BankModelConfigValue.fromJson(
              json['configValue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      'id': instance.id,
      'isDelete': instance.isDelete,
      'configKey': instance.configKey,
      'configValue': instance.configValue,
    };
