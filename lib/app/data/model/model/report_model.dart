import '../../../modules/common_widget/const.dart';

class WareHouseModel {
  int? id;
  String? name;
  int? deliveryBillCount;
  double? trackingMiningWeight;
  double? trackingCalculationWeight;
  int? trackingTotalMoney;
  int? trackingCount;
  double? avgSalePrice;

  WareHouseModel({
    this.id,
    this.name,
    this.deliveryBillCount,
    this.trackingMiningWeight,
    this.trackingCalculationWeight,
    this.trackingTotalMoney,
    this.trackingCount,
    this.avgSalePrice,
  });

  WareHouseModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    deliveryBillCount = json['delivery_bill_count']?.toInt();
    trackingMiningWeight = json['tracking_mining_weight']?.toDouble();
    trackingCalculationWeight = json['tracking_calculation_weight']?.toDouble();
    trackingTotalMoney = json['tracking_total_money']?.toInt();
    trackingCount = json['tracking_count']?.toInt();
    avgSalePrice = json['avg_sale_price']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['delivery_bill_count'] = deliveryBillCount;
    data['tracking_mining_weight'] = trackingMiningWeight;
    data['tracking_calculation_weight'] = trackingCalculationWeight;
    data['tracking_total_money'] = trackingTotalMoney;
    data['tracking_count'] = trackingCount;
    data['avg_sale_price'] = avgSalePrice;
    return data;
  }

  String get formattedTrackingMiningWeight {
    return Const.convertWeight(trackingMiningWeight) ;
  }

  String get formattedTrackingCalculationWeight {
    return Const.convertWeight(trackingCalculationWeight);
  }

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }

  String get formattedAvg {
    return Const.convertPrice(avgSalePrice);
  }
}

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class BillSaleModel {
/*
{
  "id": 590,
  "username": null,
  "fullname": "Oleta Orn",
  "warehouse_name": null,
  "delivery_bill_count": 2,
  "customer_count": 165,
  "tracking_count": 5,
  "tracking_mining_weight": 15,
  "tracking_calculation_weight": 15.649999999999999,
  "tracking_total_money": 4396750
}
*/

  int? id;
  String? username;
  String? fullname;
  String? warehouseName;
  int? deliveryBillCount;
  int? customerCount;
  int? trackingCount;
  int? trackingMiningWeight;
  double? trackingCalculationWeight;
  int? trackingTotalMoney;

  BillSaleModel({
    this.id,
    this.username,
    this.fullname,
    this.warehouseName,
    this.deliveryBillCount,
    this.customerCount,
    this.trackingCount,
    this.trackingMiningWeight,
    this.trackingCalculationWeight,
    this.trackingTotalMoney,
  });
  BillSaleModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    username = json['username']?.toString();
    fullname = json['fullname']?.toString();
    warehouseName = json['warehouse_name']?.toString();
    deliveryBillCount = json['delivery_bill_count']?.toInt();
    customerCount = json['customer_count']?.toInt();
    trackingCount = json['tracking_count']?.toInt();
    trackingMiningWeight = json['tracking_mining_weight']?.toInt();
    trackingCalculationWeight = json['tracking_calculation_weight']?.toDouble();
    trackingTotalMoney = json['tracking_total_money']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['fullname'] = fullname;
    data['warehouse_name'] = warehouseName;
    data['delivery_bill_count'] = deliveryBillCount;
    data['customer_count'] = customerCount;
    data['tracking_count'] = trackingCount;
    data['tracking_mining_weight'] = trackingMiningWeight;
    data['tracking_calculation_weight'] = trackingCalculationWeight;
    data['tracking_total_money'] = trackingTotalMoney;
    return data;
  }
  String get formattedWarehouseName {
    if (warehouseName == null) {
      return "Tất cả";
    } else {
      return warehouseName.toString();
    }
  }

  String get formattedTrackingMiningWeight {
    return Const.convertWeight(trackingMiningWeight) ;
  }

  String get formattedTrackingCalculationWeight {
    return Const.convertWeight(trackingCalculationWeight);
  }

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney) ;
  }
}



class BillCustomModel {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? balance;
  String? customerCode;
  String? accountCode;
  String? birthday;
  String? displayName;
  String? note;
  String? chargeMoney;
  String? depositMoney;
  String? addressList;
  String? phoneList;
  String? nickName;
  String? isAllowDebt;
  int? shippingCost;
  String? taxId;
  String? createdById;
  String? idCustomer;
  int? creditAmount;
  bool? isSubcribeToEmailNotification;
  bool? isSubcribeToFcmNotification;
  String? gender;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? updatedById;
  String? shippingCostOld;
  int? deliveryBillCount;
  int? trackingCount;
  int? trackingMiningWeight;
  int? trackingCalculationWeight;
  int? trackingTotalMoney;
  String? saleName;
  String? fullname;

  BillCustomModel({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.balance,
    this.customerCode,
    this.accountCode,
    this.birthday,
    this.displayName,
    this.note,
    this.chargeMoney,
    this.depositMoney,
    this.addressList,
    this.phoneList,
    this.nickName,
    this.isAllowDebt,
    this.shippingCost,
    this.taxId,
    this.createdById,
    this.idCustomer,
    this.creditAmount,
    this.isSubcribeToEmailNotification,
    this.isSubcribeToFcmNotification,
    this.gender,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.updatedById,
    this.shippingCostOld,
    this.deliveryBillCount,
    this.trackingCount,
    this.trackingMiningWeight,
    this.trackingCalculationWeight,
    this.trackingTotalMoney,
    this.saleName,
    this.fullname,
  });

  BillCustomModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    phone = json['phone']?.toString();
    address = json['address']?.toString();
    email = json['email']?.toString();
    balance = json['balance']?.toString();
    customerCode = json['customerCode']?.toString();
    accountCode = json['accountCode']?.toString();
    birthday = json['birthday']?.toString();
    displayName = json['displayName']?.toString();
    note = json['note']?.toString();
    chargeMoney = json['chargeMoney']?.toString();
    depositMoney = json['depositMoney']?.toString();
    addressList = json['addressList']?.toString();
    phoneList = json['phoneList']?.toString();
    nickName = json['nickName']?.toString();
    isAllowDebt = json['isAllowDebt']?.toString();
    shippingCost = json['shippingCost']?.toInt();
    taxId = json['taxId']?.toString();
    createdById = json['createdById']?.toString();
    idCustomer = json['idCustomer']?.toString();
    creditAmount = json['creditAmount']?.toInt();
    isSubcribeToEmailNotification = json['isSubcribeToEmailNotification'];
    isSubcribeToFcmNotification = json['isSubcribeToFcmNotification'];
    gender = json['gender']?.toString();
    uid = json['uid']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    updatedById = json['updatedById']?.toString();
    shippingCostOld = json['shippingCostOld']?.toString();
    deliveryBillCount = json['delivery_bill_count']?.toInt();
    trackingCount = json['tracking_count']?.toInt();
    trackingMiningWeight = json['tracking_mining_weight']?.toInt();
    trackingCalculationWeight = json['tracking_calculation_weight']?.toInt();
    trackingTotalMoney = json['tracking_total_money']?.toInt();
    saleName = json['sale_name']?.toString();
    fullname = json['fullname']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['email'] = email;
    data['balance'] = balance;
    data['customerCode'] = customerCode;
    data['accountCode'] = accountCode;
    data['birthday'] = birthday;
    data['displayName'] = displayName;
    data['note'] = note;
    data['chargeMoney'] = chargeMoney;
    data['depositMoney'] = depositMoney;
    data['addressList'] = addressList;
    data['phoneList'] = phoneList;
    data['nickName'] = nickName;
    data['isAllowDebt'] = isAllowDebt;
    data['shippingCost'] = shippingCost;
    data['taxId'] = taxId;
    data['createdById'] = createdById;
    data['idCustomer'] = idCustomer;
    data['creditAmount'] = creditAmount;
    data['isSubcribeToEmailNotification'] = isSubcribeToEmailNotification;
    data['isSubcribeToFcmNotification'] = isSubcribeToFcmNotification;
    data['gender'] = gender;
    data['uid'] = uid;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['updatedById'] = updatedById;
    data['shippingCostOld'] = shippingCostOld;
    data['delivery_bill_count'] = deliveryBillCount;
    data['tracking_count'] = trackingCount;
    data['tracking_mining_weight'] = trackingMiningWeight;
    data['tracking_calculation_weight'] = trackingCalculationWeight;
    data['tracking_total_money'] = trackingTotalMoney;
    data['sale_name'] = saleName;
    data['fullname'] = fullname;
    return data;
  }

  String get formattedTrackingMiningWeight {
    return Const.convertWeight(trackingMiningWeight);
  }

  String get formattedTrackingCalculationWeight {
    return Const.convertWeight(trackingCalculationWeight) ;
  }

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }
}

class ReportChartModel {
  String? totalMoney;
  String? trackingCount;
  int? avgProcessingTime;
  List<int?>? trackingDate;

  ReportChartModel({
    this.totalMoney,
    this.trackingCount,
    this.avgProcessingTime,
    this.trackingDate,
  });

  ReportChartModel.fromJson(Map<String, dynamic> json) {
    totalMoney = json['total_money']?.toString();
    trackingCount = json['tracking_count']?.toString();
    avgProcessingTime = json['avg_processing_time']?.toInt();
    if (json['tracking_date'] != null) {
      final v = json['tracking_date'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      trackingDate = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_money'] = totalMoney;
    data['tracking_count'] = trackingCount;
    data['avg_processing_time'] = avgProcessingTime;
    if (trackingDate != null) {
      final v = trackingDate;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['tracking_date'] = arr0;
    }
    return data;
  }

  String get formattedTotalMoney {
    int intValue = int.parse(totalMoney ?? "0");
    return Const.convertPrice(intValue.toString());
  }

  String get formattedAvgProcessingTime {
    if (avgProcessingTime == null) {
      return "Chưa xác định";
    } else {
      return avgProcessingTime.toString();
    }
  }
}

class Exploitation {
  int? id;
  String? fullname;
  int? deliveryBillCount;
  double? trackingMiningWeight;

  Exploitation({
    this.id,
    this.fullname,
    this.deliveryBillCount,
    this.trackingMiningWeight,
  });

  Exploitation.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    fullname = json['fullname']?.toString();
    deliveryBillCount = json['delivery_bill_count']?.toInt();
    trackingMiningWeight = json['tracking_mining_weight']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['delivery_bill_count'] = deliveryBillCount;
    data['tracking_mining_weight'] = trackingMiningWeight;
    return data;
  }

  String get formattedTrackingMiningWeight {
    return Const.convertWeight(trackingMiningWeight);
  }
}

class ExploitationEmployeeRole {

  int? id;
  String? name;
  String? type;
  bool? isDelete;

  ExploitationEmployeeRole({
    this.id,
    this.name,
    this.type,
    this.isDelete,
  });
  ExploitationEmployeeRole.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    type = json['type']?.toString();
    isDelete = json['isDelete'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['isDelete'] = isDelete;
    return data;
  }
}

class ExploitationEmployee {

  int? id;
  ExploitationEmployeeRole? role;
  String? email;
  String? type;
  bool? confirmed;
  bool? blocked;
  String? phone;
  String? fullname;
  String? avatarUrl;
  String? createdAt;
  String? updatedAt;

  ExploitationEmployee({
    this.id,
    this.role,
    this.email,
    this.type,
    this.confirmed,
    this.blocked,
    this.phone,
    this.fullname,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt,
  });
  ExploitationEmployee.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    role = (json['role'] != null) ? ExploitationEmployeeRole.fromJson(json['role']) : null;
    email = json['email']?.toString();
    type = json['type']?.toString();
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    phone = json['phone']?.toString();
    fullname = json['fullname']?.toString();
    avatarUrl = json['avatarUrl']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['email'] = email;
    data['type'] = type;
    data['confirmed'] = confirmed;
    data['blocked'] = blocked;
    data['phone'] = phone;
    data['fullname'] = fullname;
    data['avatarUrl'] = avatarUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Awb {
  int? id;
  String? code;
  String? status;
  String? exploitStatus;
  int? boxesCount;
  int? trackingCount;
  double? trackingMiningWeight;
  double? trackingCalculationWeight;
  int? trackingTotalMoney;

  Awb({
    this.id,
    this.code,
    this.status,
    this.exploitStatus,
    this.boxesCount,
    this.trackingCount,
    this.trackingMiningWeight,
    this.trackingCalculationWeight,
    this.trackingTotalMoney,
  });

  Awb.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    code = json['code']?.toString();
    status = json['status']?.toString();
    exploitStatus = json['exploitStatus']?.toString();
    boxesCount = json['boxes_count']?.toInt();
    trackingCount = json['tracking_count']?.toInt();
    trackingMiningWeight = json['tracking_mining_weight']?.toDouble();
    trackingCalculationWeight = json['tracking_calculation_weight']?.toDouble();
    trackingTotalMoney = json['tracking_total_money']?.toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['status'] = status;
    data['exploitStatus'] = exploitStatus;
    data['boxes_count'] = boxesCount;
    data['tracking_count'] = trackingCount;
    data['tracking_mining_weight'] = trackingMiningWeight;
    data['tracking_calculation_weight'] = trackingCalculationWeight;
    data['tracking_total_money'] = trackingTotalMoney;
    return data;
  }

  String get formattedTrackingMiningWeight {
    return Const.convertWeight2(trackingMiningWeight);
  }

  String get formattedTrackingCalculationWeight {
    return Const.convertWeight(trackingCalculationWeight);
  }

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }

  String get formattedTwo {
    return "$formattedTrackingMiningWeight/$formattedTrackingCalculationWeight";
  }
}
