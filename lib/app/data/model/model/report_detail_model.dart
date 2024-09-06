import 'package:json_annotation/json_annotation.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

part "report_detail_model.g.dart";

@JsonSerializable()
class ReportDetailModelStatisticByDeliveryBillTracking {
  int? id;
  String? code;
  String? description;
  String? status;
  String? importDate;
  String? packedDate;
  String? exploitedDate;
  bool? isRepack;
  bool? isSplit;
  bool? isDeleted;
  String? exploitStatus;
  String? trackingMiningWeight;
  String? trackingCalculationWeight;
  String? trackingBarrelCoefficient;
  String? trackingShippingCost;
  String? trackingShippingFee;
  String? trackingDeliveryFee;
  int? trackingDiscountAmount;
  String? trackingTotalMoney;
  int? trackingAmount;
  String? orderId;
  String? createdAt;
  String? updatedAt;
  bool? isRenamed;
  int? whTrackingId;
  String? vnPackedDate;
  String? vnImportDate;
  String? vnExportDate;
  int? vnPackedById;
  String? productName;

  ReportDetailModelStatisticByDeliveryBillTracking({
    this.id,
    this.code,
    this.description,
    this.status,
    this.importDate,
    this.packedDate,
    this.exploitedDate,
    this.isRepack,
    this.isSplit,
    this.isDeleted,
    this.exploitStatus,
    this.trackingMiningWeight,
    this.trackingCalculationWeight,
    this.trackingBarrelCoefficient,
    this.trackingShippingCost,
    this.trackingShippingFee,
    this.trackingDeliveryFee,
    this.trackingDiscountAmount,
    this.trackingTotalMoney,
    this.trackingAmount,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.isRenamed,
    this.whTrackingId,
    this.vnPackedDate,
    this.vnImportDate,
    this.vnExportDate,
    this.vnPackedById,
    this.productName,
  });

  factory ReportDetailModelStatisticByDeliveryBillTracking.fromJson(
          Map<String, dynamic> json) =>
      _$ReportDetailModelStatisticByDeliveryBillTrackingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReportDetailModelStatisticByDeliveryBillTrackingToJson(this);
}

@JsonSerializable()
class ReportDetailModelStatisticByDeliveryBillCustomer {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? balance;
  String? note;
  String? nickName;
  int? shippingCost;
  String? idCustomer;
  int? creditAmount;
  bool? isSubcribeToEmailNotification;
  bool? isSubcribeToFcmNotification;
  String? createdAt;
  String? updatedAt;

  ReportDetailModelStatisticByDeliveryBillCustomer({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.balance,
    this.note,
    this.nickName,
    this.shippingCost,
    this.idCustomer,
    this.creditAmount,
    this.isSubcribeToEmailNotification,
    this.isSubcribeToFcmNotification,
    this.createdAt,
    this.updatedAt,
  });

  factory ReportDetailModelStatisticByDeliveryBillCustomer.fromJson(
          Map<String, dynamic> json) =>
      _$ReportDetailModelStatisticByDeliveryBillCustomerFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReportDetailModelStatisticByDeliveryBillCustomerToJson(this);
}

@JsonSerializable()
class ReportDetailModelStatisticByDeliveryBill {
  int? id;
  String? code;
  String? deliveryBillStatus;
  String? customerAddress;
  String? customerPhone;
  bool? isConfirmedByCustomer;
  bool? isPackaged;
  bool? isCharged;
  int? createdById;
  List<ReportDetailModelStatisticByDeliveryBillCustomer?>? customer;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? email;
  List<ReportDetailModelStatisticByDeliveryBillTracking?>? tracking;
  double? totalTrackingMiningWeight;
  double? totalTrackingCalculationWeight;
  int? trackingTotalMoney;
  int? trackingTotalShippingFee;

  ReportDetailModelStatisticByDeliveryBill({
    this.id,
    this.code,
    this.deliveryBillStatus,
    this.customerAddress,
    this.customerPhone,
    this.isConfirmedByCustomer,
    this.isPackaged,
    this.isCharged,
    this.createdById,
    this.customer,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
    this.tracking,
    this.totalTrackingMiningWeight,
    this.totalTrackingCalculationWeight,
    this.trackingTotalMoney,
    this.trackingTotalShippingFee,
  });

  factory ReportDetailModelStatisticByDeliveryBill.fromJson(
          Map<String, dynamic> json) =>
      _$ReportDetailModelStatisticByDeliveryBillFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReportDetailModelStatisticByDeliveryBillToJson(this);

  String get formattedTrackingWeight {
    return "${Const.convertWeight2(totalTrackingMiningWeight)}/${Const.convertWeight(totalTrackingCalculationWeight)}";
  }

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }
}

@JsonSerializable()
class ReportDetailModel {
  int? id;
  String? username;
  String? fullname;
  String? warehouseName;
  int? deliveryBillCount;
  List<ReportDetailModelStatisticByDeliveryBill?>? statisticByDeliveryBill;

  ReportDetailModel({
    this.id,
    this.username,
    this.fullname,
    this.warehouseName,
    this.deliveryBillCount,
    this.statisticByDeliveryBill,
  });

  factory ReportDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDetailModelToJson(this);
}

class ReportWareHouseDetailModel {
  int? id;
  String? name;
  String? status;
  String? color;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? createdById;
  String? updatedById;
  double? trackingMiningWeight;
  double? trackingCalculationWeight;
  int? trackingTotalMoney;
  int? trackingCount;
  int? trackingSurcharge;
  int? avgSalePrice;
  double? proportionOfMiningWeight;
  double? proportionOfCalculationWeight;
  double? proportionOfTotalMoney;

  ReportWareHouseDetailModel({
    this.id,
    this.name,
    this.status,
    this.color,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.createdById,
    this.updatedById,
    this.trackingMiningWeight,
    this.trackingCalculationWeight,
    this.trackingTotalMoney,
    this.trackingCount,
    this.trackingSurcharge,
    this.avgSalePrice,
    this.proportionOfMiningWeight,
    this.proportionOfCalculationWeight,
    this.proportionOfTotalMoney,
  });

  ReportWareHouseDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    status = json['status']?.toString();
    color = json['color']?.toString();
    uid = json['uid']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    createdById = json['createdById']?.toString();
    updatedById = json['updatedById']?.toString();
    trackingMiningWeight = json['tracking_mining_weight']?.toDouble();
    trackingCalculationWeight = json['tracking_calculation_weight']?.toDouble();
    trackingTotalMoney = json['tracking_total_money']?.toInt();
    trackingCount = json['tracking_count']?.toInt();
    trackingSurcharge = json['tracking_surcharge']?.toInt();
    avgSalePrice = json['avg_sale_price']?.toInt();
    proportionOfMiningWeight = json['proportionOfMiningWeight']?.toDouble();
    proportionOfCalculationWeight =
        json['proportionOfCalculationWeight']?.toDouble();
    proportionOfTotalMoney = json['proportionOfTotalMoney']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['color'] = color;
    data['uid'] = uid;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['createdById'] = createdById;
    data['updatedById'] = updatedById;
    data['tracking_mining_weight'] = trackingMiningWeight;
    data['tracking_calculation_weight'] = trackingCalculationWeight;
    data['tracking_total_money'] = trackingTotalMoney;
    data['tracking_count'] = trackingCount;
    data['tracking_surcharge'] = trackingSurcharge;
    data['avg_sale_price'] = avgSalePrice;
    data['proportionOfMiningWeight'] = proportionOfMiningWeight;
    data['proportionOfCalculationWeight'] = proportionOfCalculationWeight;
    data['proportionOfTotalMoney'] = proportionOfTotalMoney;
    return data;
  }

  String get formattedTrackingWeight {
    return "${Const.convertWeight2(trackingMiningWeight)}/${Const.convertWeight(trackingCalculationWeight)}";
  }

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }

  String get formattedTrackingSurcharge {
    return Const.convertPrice(trackingSurcharge);
  }
}
