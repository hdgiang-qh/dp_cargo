// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersDetailSale _$OrdersDetailSaleFromJson(Map<String, dynamic> json) =>
    OrdersDetailSale(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$OrdersDetailSaleToJson(OrdersDetailSale instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'avatarUrl': instance.avatarUrl,
    };

OrdersDetailExploitedBy _$OrdersDetailExploitedByFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailExploitedBy(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
    );

Map<String, dynamic> _$OrdersDetailExploitedByToJson(
        OrdersDetailExploitedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'fullname': instance.fullname,
    };

OrdersDetailWarehouseVn _$OrdersDetailWarehouseVnFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailWarehouseVn(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OrdersDetailWarehouseVnToJson(
        OrdersDetailWarehouseVn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

OrdersDetailDeliveryBill _$OrdersDetailDeliveryBillFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailDeliveryBill(
      id: json['id'] as int?,
      code: json['code'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$OrdersDetailDeliveryBillToJson(
        OrdersDetailDeliveryBill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'createdAt': instance.createdAt,
    };

OrdersDetailCustomerUser _$OrdersDetailCustomerUserFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailCustomerUser(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      type: json['type'] as String?,
      confirmed: json['confirmed'] as bool?,
      blocked: json['blocked'] as bool?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      createdById: json['createdById'] as String?,
      resetPasswordToken: json['resetPasswordToken'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      provider: json['provider'] as String?,
      confirmationToken: json['confirmationToken'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      tmpPassword: json['tmpPassword'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      updatedById: json['updatedById'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$OrdersDetailCustomerUserToJson(
        OrdersDetailCustomerUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'type': instance.type,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'createdById': instance.createdById,
      'resetPasswordToken': instance.resetPasswordToken,
      'avatarUrl': instance.avatarUrl,
      'provider': instance.provider,
      'confirmationToken': instance.confirmationToken,
      'confirmPassword': instance.confirmPassword,
      'tmpPassword': instance.tmpPassword,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'updatedById': instance.updatedById,
      'code': instance.code,
    };

OrdersDetailCustomerTags _$OrdersDetailCustomerTagsFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailCustomerTags(
      id: json['id'] as int?,
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$OrdersDetailCustomerTagsToJson(
        OrdersDetailCustomerTags instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };

OrdersDetailCustomer _$OrdersDetailCustomerFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailCustomer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      nickName: json['nickName'] as String?,
      user: (json['user'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OrdersDetailCustomerUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingCost: json['shippingCost'] as int?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OrdersDetailCustomerTags.fromJson(e as Map<String, dynamic>))
          .toList(),
      idCustomer: json['idCustomer'] as String?,
      isSubcribeToEmailNotification:
          json['isSubcribeToEmailNotification'] as bool?,
      isSubcribeToFcmNotification: json['isSubcribeToFcmNotification'] as bool?,
    );

Map<String, dynamic> _$OrdersDetailCustomerToJson(
        OrdersDetailCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'nickName': instance.nickName,
      'user': instance.user,
      'shippingCost': instance.shippingCost,
      'tags': instance.tags,
      'idCustomer': instance.idCustomer,
      'isSubcribeToEmailNotification': instance.isSubcribeToEmailNotification,
      'isSubcribeToFcmNotification': instance.isSubcribeToFcmNotification,
    };

OrdersDetailBusinessPartner _$OrdersDetailBusinessPartnerFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailBusinessPartner(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OrdersDetailBusinessPartnerToJson(
        OrdersDetailBusinessPartner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

OrdersDetailTrackingType _$OrdersDetailTrackingTypeFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailTrackingType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$OrdersDetailTrackingTypeToJson(
        OrdersDetailTrackingType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };

OrdersDetailStatusLogs _$OrdersDetailStatusLogsFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailStatusLogs(
      id: json['id'] as int?,
      name: json['name'] as String?,
      updatedTime: json['updatedTime'] as String?,
      trackingId: json['trackingId'] as int?,
    );

Map<String, dynamic> _$OrdersDetailStatusLogsToJson(
        OrdersDetailStatusLogs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'updatedTime': instance.updatedTime,
      'trackingId': instance.trackingId,
    };

OrdersDetailVnPackedBy _$OrdersDetailVnPackedByFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailVnPackedBy(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$OrdersDetailVnPackedByToJson(
        OrdersDetailVnPackedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'avatarUrl': instance.avatarUrl,
    };

OrdersDetailBackLogExtraDataCustomerUser
    _$OrdersDetailBackLogExtraDataCustomerUserFromJson(
            Map<String, dynamic> json) =>
        OrdersDetailBackLogExtraDataCustomerUser(
          id: json['id'] as int?,
          type: json['type'] as String?,
          email: json['email'] as String?,
          phone: json['phone'] as String?,
          blocked: json['blocked'] as bool?,
          fullname: json['fullname'] as String?,
          password: json['password'] as String?,
          username: json['username'] as String?,
          confirmed: json['confirmed'] as bool?,
          createdAt: json['createdAt'] as String?,
          updatedAt: json['updatedAt'] as String?,
        );

Map<String, dynamic> _$OrdersDetailBackLogExtraDataCustomerUserToJson(
        OrdersDetailBackLogExtraDataCustomerUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'email': instance.email,
      'phone': instance.phone,
      'blocked': instance.blocked,
      'fullname': instance.fullname,
      'password': instance.password,
      'username': instance.username,
      'confirmed': instance.confirmed,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

OrdersDetailBackLogExtraDataCustomer
    _$OrdersDetailBackLogExtraDataCustomerFromJson(Map<String, dynamic> json) =>
        OrdersDetailBackLogExtraDataCustomer(
          id: json['id'] as int?,
          name: json['name'] as String?,
          user: (json['user'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : OrdersDetailBackLogExtraDataCustomerUser.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
          email: json['email'] as String?,
          phone: json['phone'] as String?,
          address: json['address'] as String?,
          nickName: json['nickName'] as String?,
          idCustomer: json['idCustomer'] as String?,
          shippingCost: json['shippingCost'] as int?,
          isSubcribeToFcmNotification:
              json['isSubcribeToFcmNotification'] as bool?,
          isSubcribeToEmailNotification:
              json['isSubcribeToEmailNotification'] as bool?,
        );

Map<String, dynamic> _$OrdersDetailBackLogExtraDataCustomerToJson(
        OrdersDetailBackLogExtraDataCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user': instance.user,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'nickName': instance.nickName,
      'idCustomer': instance.idCustomer,
      'shippingCost': instance.shippingCost,
      'isSubcribeToFcmNotification': instance.isSubcribeToFcmNotification,
      'isSubcribeToEmailNotification': instance.isSubcribeToEmailNotification,
    };

OrdersDetailBackLogExtraDataSale _$OrdersDetailBackLogExtraDataSaleFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailBackLogExtraDataSale(
      id: json['id'] as int?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$OrdersDetailBackLogExtraDataSaleToJson(
        OrdersDetailBackLogExtraDataSale instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
    };

OrdersDetailBackLogExtraData _$OrdersDetailBackLogExtraDataFromJson(
        Map<String, dynamic> json) =>
    OrdersDetailBackLogExtraData(
      id: json['id'] as int?,
      awb: json['awb'] == null
          ? null
          : Box.fromJson(json['awb'] as Map<String, dynamic>),
      box: json['box'] == null
          ? null
          : Box.fromJson(json['box'] as Map<String, dynamic>),
      code: json['code'] as String?,
      note: json['note'] as String?,
      sale: json['sale'] == null
          ? null
          : OrdersDetailSale.fromJson(json['sale'] as Map<String, dynamic>),
      price: json['price'] as String?,
      status: OrdersDetailBackLogExtraData._statusFromJson(
          json['status'] as String?),
      orderId: json['orderId'] as String?,
      customer: json['customer'] == null
          ? null
          : OrdersDetailBackLogExtraDataCustomer.fromJson(
              json['customer'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isRenamed: json['isRenamed'] as bool?,
      updatedAt: json['updatedAt'] as String?,
      description: json['description'] as String?,
      exploitedBy: json['exploitedBy'] == null
          ? null
          : OrdersDetailExploitedBy.fromJson(
              json['exploitedBy'] as Map<String, dynamic>),
      productName: json['productName'] as String?,
      warehouseVn: json['warehouseVn'] == null
          ? null
          : OrdersDetailWarehouseVn.fromJson(
              json['warehouseVn'] as Map<String, dynamic>),
      trackingType: json['trackingType'] == null
          ? null
          : OrdersDetailTrackingType.fromJson(
              json['trackingType'] as Map<String, dynamic>),
      vnImportDate: json['vnImportDate'] as String?,
      exploitStatus: OrdersDetailBackLogExtraData._exploitStatusFromJson(
          json['exploitStatus'] as String?),
      exploitedDate: json['exploitedDate'] as String?,
      trackingAmount: json['trackingAmount'] as int?,
      businessPartner: json['businessPartner'] == null
          ? null
          : OrdersDetailBusinessPartner.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      trackingOtherFee: json['trackingOtherFee'] as String?,
      trackingSurcharge: json['trackingSurcharge'] as String?,
      trackingTotalMoney: json['trackingTotalMoney'] as String?,
      trackingDeliveryFee: json['trackingDeliveryFee'] as String?,
      trackingShippingFee: json['trackingShippingFee'] as String?,
      trackingMiningWeight: json['trackingMiningWeight'] as String?,
      trackingShippingCost: json['trackingShippingCost'] as String?,
      trackingDiscountAmount: json['trackingDiscountAmount'] as int?,
      trackingBarrelCoefficient: json['trackingBarrelCoefficient'] as String?,
      trackingCalculationWeight: json['trackingCalculationWeight'] as String?,
    );

Map<String, dynamic> _$OrdersDetailBackLogExtraDataToJson(
        OrdersDetailBackLogExtraData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'awb': instance.awb,
      'box': instance.box,
      'code': instance.code,
      'note': instance.note,
      'sale': instance.sale,
      'price': instance.price,
      'status': OrdersDetailBackLogExtraData._statusToJson(instance.status),
      'orderId': instance.orderId,
      'customer': instance.customer,
      'createdAt': instance.createdAt,
      'isDeleted': instance.isDeleted,
      'isRenamed': instance.isRenamed,
      'updatedAt': instance.updatedAt,
      'description': instance.description,
      'exploitedBy': instance.exploitedBy,
      'productName': instance.productName,
      'warehouseVn': instance.warehouseVn,
      'trackingType': instance.trackingType,
      'vnImportDate': instance.vnImportDate,
      'exploitStatus': OrdersDetailBackLogExtraData._exploitStatusToJson(
          instance.exploitStatus),
      'exploitedDate': instance.exploitedDate,
      'trackingAmount': instance.trackingAmount,
      'businessPartner': instance.businessPartner,
      'trackingOtherFee': instance.trackingOtherFee,
      'trackingSurcharge': instance.trackingSurcharge,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'trackingDeliveryFee': instance.trackingDeliveryFee,
      'trackingShippingFee': instance.trackingShippingFee,
      'trackingMiningWeight': instance.trackingMiningWeight,
      'trackingShippingCost': instance.trackingShippingCost,
      'trackingDiscountAmount': instance.trackingDiscountAmount,
      'trackingBarrelCoefficient': instance.trackingBarrelCoefficient,
      'trackingCalculationWeight': instance.trackingCalculationWeight,
    };

OrdersDetailBackLog _$OrdersDetailBackLogFromJson(Map<String, dynamic> json) =>
    OrdersDetailBackLog(
      id: json['id'] as int?,
      actionTime: json['actionTime'] as String?,
      actionType: json['actionType'] as String?,
      trackingCode: json['trackingCode'] as String?,
      updatedAt: json['updatedAt'] as String?,
      trackingId: json['trackingId'] as int?,
    );

Map<String, dynamic> _$OrdersDetailBackLogToJson(
        OrdersDetailBackLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actionTime': instance.actionTime,
      'actionType': instance.actionType,
      'trackingCode': instance.trackingCode,
      'updatedAt': instance.updatedAt,
      'trackingId': instance.trackingId,
    };

OrdersDetail _$OrdersDetailFromJson(Map<String, dynamic> json) => OrdersDetail(
      id: json['id'] as int?,
      code: json['code'] as String?,
      trackingType: json['trackingType'] == null
          ? null
          : OrdersDetailTrackingType.fromJson(
              json['trackingType'] as Map<String, dynamic>),
      description: json['description'] as String?,
      businessPartner: json['businessPartner'] == null
          ? null
          : OrdersDetailBusinessPartner.fromJson(
              json['businessPartner'] as Map<String, dynamic>),
      status: OrdersDetail._statusFromJson(json['status'] as String?),
      exploitedDate: json['exploitedDate'] as String?,
      packedDate: json['packedDate'] as String?,
      box: json['box'] == null
          ? null
          : Box.fromJson(json['box'] as Map<String, dynamic>),
      awb: json['awb'] == null
          ? null
          : Box.fromJson(json['awb'] as Map<String, dynamic>),
      warehouse: json['warehouse'] == null
          ? null
          : OrdersDetailWarehouseVn.fromJson(
              json['warehouse'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : OrdersDetailCustomer.fromJson(
              json['customer'] as Map<String, dynamic>),
      isDeleted: json['isDeleted'] as bool?,
      note: json['note'] as String?,
      exploitStatus:
          OrdersDetail._exploitStatusFromJson(json['exploitStatus'] as String?),
      trackingMiningWeight: json['trackingMiningWeight'] as String?,
      trackingCalculationWeight: json['trackingCalculationWeight'] as String?,
      trackingBarrelCoefficient: json['trackingBarrelCoefficient'] as String?,
      trackingShippingCost: json['trackingShippingCost'] as String?,
      trackingShippingFee: json['trackingShippingFee'] as String?,
      sale: json['sale'] == null
          ? null
          : OrdersDetailSale.fromJson(json['sale'] as Map<String, dynamic>),
      trackingSurcharge: json['trackingSurcharge'] as String?,
      trackingDeliveryFee: json['trackingDeliveryFee'] as String?,
      trackingOtherFee: json['trackingOtherFee'] as String?,
      trackingDiscountAmount: json['trackingDiscountAmount'] as int?,
      trackingTotalMoney: json['trackingTotalMoney'] as String?,
      deliveryBill: json['deliveryBill'] == null
          ? null
          : OrdersDetailDeliveryBill.fromJson(
              json['deliveryBill'] as Map<String, dynamic>),
      trackingAmount: json['trackingAmount'] as int?,
      orderId: json['orderId'] as String?,
      warehouseVn: json['warehouseVn'] == null
          ? null
          : OrdersDetailWarehouseVn.fromJson(
              json['warehouseVn'] as Map<String, dynamic>),
      exploitedBy: json['exploitedBy'] == null
          ? null
          : OrdersDetailExploitedBy.fromJson(
              json['exploitedBy'] as Map<String, dynamic>),
      price: json['price'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isRenamed: json['isRenamed'] as bool?,
      vnPackedDate: json['vnPackedDate'] as String?,
      vnImportDate: json['vnImportDate'] as String?,
      vnExportDate: json['vnExportDate'] as String?,
      vnPackedById: json['vnPackedById'] as int?,
      productName: json['productName'] as String?,
      vnPackedBy: json['vnPackedBy'] == null
          ? null
          : OrdersDetailVnPackedBy.fromJson(
              json['vnPackedBy'] as Map<String, dynamic>),
      statusLogs: (json['statusLogs'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OrdersDetailStatusLogs.fromJson(e as Map<String, dynamic>))
          .toList(),
      backlogs: (json['backlogs'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OrdersDetailBackLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersDetailToJson(OrdersDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'trackingType': instance.trackingType,
      'description': instance.description,
      'businessPartner': instance.businessPartner,
      'status': OrdersDetail._statusToJson(instance.status),
      'exploitedDate': instance.exploitedDate,
      'packedDate': instance.packedDate,
      'box': instance.box,
      'awb': instance.awb,
      'customer': instance.customer,
      'warehouse': instance.warehouse,
      'isDeleted': instance.isDeleted,
      'note': instance.note,
      'exploitStatus':
          OrdersDetail._exploitStatusToJson(instance.exploitStatus),
      'trackingMiningWeight': instance.trackingMiningWeight,
      'trackingCalculationWeight': instance.trackingCalculationWeight,
      'trackingBarrelCoefficient': instance.trackingBarrelCoefficient,
      'trackingShippingCost': instance.trackingShippingCost,
      'trackingShippingFee': instance.trackingShippingFee,
      'trackingSurcharge': instance.trackingSurcharge,
      'trackingDeliveryFee': instance.trackingDeliveryFee,
      'trackingOtherFee': instance.trackingOtherFee,
      'trackingDiscountAmount': instance.trackingDiscountAmount,
      'trackingTotalMoney': instance.trackingTotalMoney,
      'deliveryBill': instance.deliveryBill,
      'trackingAmount': instance.trackingAmount,
      'orderId': instance.orderId,
      'warehouseVn': instance.warehouseVn,
      'exploitedBy': instance.exploitedBy,
      'price': instance.price,
      'sale': instance.sale,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isRenamed': instance.isRenamed,
      'vnPackedDate': instance.vnPackedDate,
      'vnImportDate': instance.vnImportDate,
      'vnExportDate': instance.vnExportDate,
      'vnPackedById': instance.vnPackedById,
      'productName': instance.productName,
      'vnPackedBy': instance.vnPackedBy,
      'statusLogs': instance.statusLogs,
      'backlogs': instance.backlogs,
    };
