


import 'package:json_annotation/json_annotation.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import 'business_parter.dart';
part 'search_tracking.g.dart';

class SearchTrackingExploitedBy {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? fullname;

  SearchTrackingExploitedBy({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.fullname,
  });
  SearchTrackingExploitedBy.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    username = json['username']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    fullname = json['fullname']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['fullname'] = fullname;
    return data;
  }
}

class SearchTrackingWarehouseVn {

  int? id;
  String? name;

  SearchTrackingWarehouseVn({
    this.id,
    this.name,
  });
  SearchTrackingWarehouseVn.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class SearchTrackingDeliveryBill {

  int? id;
  String? code;
  String? createdAt;

  SearchTrackingDeliveryBill({
    this.id,
    this.code,
    this.createdAt,
  });
  SearchTrackingDeliveryBill.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    code = json['code']?.toString();
    createdAt = json['createdAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['createdAt'] = createdAt;
    return data;
  }
}

class SearchTrackingCustomer {

  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? nickName;
  int? shippingCost;
  String? idCustomer;
  bool? isSubcribeToEmailNotification;
  bool? isSubcribeToFcmNotification;

  SearchTrackingCustomer({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.nickName,
    this.shippingCost,
    this.idCustomer,
    this.isSubcribeToEmailNotification,
    this.isSubcribeToFcmNotification,
  });
  SearchTrackingCustomer.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    phone = json['phone']?.toString();
    address = json['address']?.toString();
    email = json['email']?.toString();
    nickName = json['nickName']?.toString();
    shippingCost = json['shippingCost']?.toInt();
    idCustomer = json['idCustomer']?.toString();
    isSubcribeToEmailNotification = json['isSubcribeToEmailNotification'];
    isSubcribeToFcmNotification = json['isSubcribeToFcmNotification'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['email'] = email;
    data['nickName'] = nickName;
    data['shippingCost'] = shippingCost;
    data['idCustomer'] = idCustomer;
    data['isSubcribeToEmailNotification'] = isSubcribeToEmailNotification;
    data['isSubcribeToFcmNotification'] = isSubcribeToFcmNotification;
    return data;
  }
}



class SearchTrackingBox {

  int? id;
  String? code;

  SearchTrackingBox({
    this.id,
    this.code,
  });
  SearchTrackingBox.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    code = json['code']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    return data;
  }
}

class SearchTrackingBusinessPartner {

  int? id;
  String? name;

  SearchTrackingBusinessPartner({
    this.id,
    this.name,
  });
  SearchTrackingBusinessPartner.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class SearchTrackingTrackingType {

  int? id;
  String? name;
  String? color;

  SearchTrackingTrackingType({
    this.id,
    this.name,
    this.color,
  });
  SearchTrackingTrackingType.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    color = json['color']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}

@JsonSerializable()
class SearchTracking {
  int? id;
  String? code;
  SearchTrackingTrackingType? trackingType;
  String? description;
  SearchTrackingBusinessPartner? businessPartner;
  String? status;
  String? importDate;
  String? repackDate;
  String? packedDate;
  String? exportDate;
  String? arrivalDate;
  String? completedAt;
  String? exploitedDate;
  String? invoicedDate;
  String? checkingDate;
  SearchTrackingBox? box;
  SearchTrackingBox? awb;
  BusinessPartner? warehouse;
  SearchTrackingCustomer? customer;
  bool? isSplit;
  String? parentTracking;
  bool? isDeleted;
  String? imageUrl;
  String? note;
  String? exploitStatus;
  String? shippingFee;
  String? trackingMiningWeight;
  String? trackingCalculationWeight;
  String? trackingBarrelCoefficient;
  String? trackingShippingCost;
  String? trackingShippingFee;
  String? trackingSurcharge;
  String? trackingDeliveryFee;
  String? trackingOtherFee;
  int? trackingDiscountAmount;
  String? trackingTotalMoney;
  SearchTrackingDeliveryBill? deliveryBill;
  int? trackingAmount;
  String? orderId;
  SearchTrackingWarehouseVn? warehouseVn;
  SearchTrackingExploitedBy? exploitedBy;
  String? price;
  String? createdAt;
  String? updatedAt;
  bool? isRenamed;
  String? vnPackedDate;
  String? vnImportDate;
  String? vnExportDate;
  int? vnPackedById;
  String? productName;


  SearchTracking({
    this.id,
    this.code,
    this.trackingType,
    this.description,
    this.businessPartner,
    this.status,
    this.importDate,
    this.repackDate,
    this.packedDate,
    this.exportDate,
    this.arrivalDate,
    this.completedAt,
    this.exploitedDate,
    this.invoicedDate,
    this.checkingDate,
    this.box,
    this.awb,
    this.warehouse,
    this.customer,
    this.isSplit,
    this.parentTracking,
    this.isDeleted,
    this.imageUrl,
    this.note,
    this.exploitStatus,
    this.shippingFee,
    this.trackingMiningWeight,
    this.trackingCalculationWeight,
    this.trackingBarrelCoefficient,
    this.trackingShippingCost,
    this.trackingShippingFee,
    this.trackingSurcharge,
    this.trackingDeliveryFee,
    this.trackingOtherFee,
    this.trackingDiscountAmount,
    this.trackingTotalMoney,
    this.deliveryBill,
    this.trackingAmount,
    this.orderId,
    this.warehouseVn,
    this.exploitedBy,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.isRenamed,
    this.vnPackedDate,
    this.vnImportDate,
    this.vnExportDate,
    this.vnPackedById,
    this.productName,
  });
 factory SearchTracking.fromJson(Map<String, dynamic> json) => _$SearchTrackingFromJson(json);
  Map<String, dynamic> toJson() => _$SearchTrackingToJson(this);

  String get formattedTrackingTotalMoney{
    return Const.convertPrice(trackingTotalMoney);
  }
}
