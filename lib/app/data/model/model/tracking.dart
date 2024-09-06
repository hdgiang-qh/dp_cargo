import 'package:vncss/app/data/model/model/tracking_bill.dart';
import 'package:vncss/app/data/model/model/tracking_delivery_bill.dart';
import 'package:vncss/app/modules/common_widget/const.dart';

import 'exploitedBy.dart';
import 'exploited_by.dart';
import 'orders_detail.dart';

import '../../../core/enum/orders_status.dart';
import 'package:json_annotation/json_annotation.dart';

import 'box.dart';
import 'business_parter.dart';
import 'customer.dart';
import 'employee.dart';

part 'tracking.g.dart';

@JsonSerializable()
class Trackings {
  int? id;
  String? code;
  String? description;
  TrackingType? trackingType;
  BusinessPartner? businessPartner;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  OrderStatus? status;
  DateTime? importDate;
  DateTime? repackDate;
  DateTime? packedDate;
  DateTime? exportDate;
  DateTime? arrivalDate;
  DateTime? completedAt;
  String? exploitedDate;
  DateTime? invoicedDate;
  DateTime? checkingDate;
  bool? isRepack;
  Box? box;
  Box? awb;
  BusinessPartner? warehouse;
  Customer? customer;
  bool? isSplit;
  String? parentTracking;
  bool? isDeleted;
  String? imageUrl;
  String? note;
  @JsonKey(fromJson: _statusvnFromJson, toJson: _statusvnToJson)
  OrderStatusvn? exploitStatus;
  int? shippingFee;
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
  String? weight;
  String? vnPackedDate;
  String? vnImportDate;
  String? vnExportDate;

  TrackingDeliveryBill? deliveryBill;
  ExploitedByN? exploitedBy;
  ExploitedBy? vnPackedBy;

  int? trackingAmount;
  String? orderId;
  String? optionalImage;
  String? price;
  String? uid;
  Employee? sale;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? whTrackingId;
  String? ticketResponse;
  bool? isRenamed;
  String? priority;
  String? productName;
  BusinessPartner? warehouseVn;
  bool? hasError;
  List<OrdersDetailStatusLogs?>? statusLogs;
  List<OrdersDetailBackLog?>? backlogs;

  Trackings(
      {this.id,
      this.code,
      this.description,
      this.trackingType,
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
      this.isRepack,
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
      this.vnPackedBy,
      this.exploitedBy,
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
      this.weight,
      this.deliveryBill,
      this.trackingAmount,
      this.orderId,
      this.optionalImage,
      this.price,
      this.uid,
      this.sale,
      this.createdAt,
      this.updatedAt,
      this.whTrackingId,
        this.ticketResponse,
      this.isRenamed,
      this.priority,
      this.productName,
      this.hasError,
      this.warehouseVn,
      this.vnExportDate,
      this.vnImportDate,
      this.vnPackedDate,
      this.statusLogs,
      this.backlogs});

  factory Trackings.fromJson(Map<String, dynamic> json) =>
      _$TrackingsFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingsToJson(this);

  static OrderStatus? _statusFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _statusToJson(OrderStatus? status) => status?.value;

  static OrderStatusvn? _statusvnFromJson(String? value) =>
      OrderStatusvn.fromValue(value);

  static String? _statusvnToJson(OrderStatusvn? status) => status?.value;

  String get formattedPrice {
    return Const.convertPrice2(price);
  }

  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }

  String get formattedShippingFee {
    return Const.convertPrice(trackingShippingFee);
  }

  double get formattedTrackingShippingCost {
    return Const.convertPriceDouble(trackingShippingCost ?? "0.0");
  }

  String get formattedTrackingShippingFee {
    return Const.convertPrice2(trackingShippingFee.toString());
  }

  int get formattedTrackingDiscountAmount {
    return Const.convertPrice2(trackingDiscountAmount);
  }

  double get formattedTrackingOtherFee {
    return Const.convertPriceDouble(trackingOtherFee ?? "0.0");
  }

  double get formattedTrackingSurcharge {
    return Const.convertPriceDouble(trackingSurcharge ?? "0.0");
  }

  String get formattedTrackingTotalWeight {
    return Const.convertWeight(trackingCalculationWeight);
  }

  String get formattedTrackingMiningWeight {
    return Const.convertWeight2(trackingMiningWeight);
  }

  String get formattedMergeWeight {
    return "$formattedTrackingMiningWeight/$formattedTrackingTotalWeight";
  }
}
