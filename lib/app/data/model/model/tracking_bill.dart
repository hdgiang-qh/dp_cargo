import '../../../core/enum/orders_status.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../modules/common_widget/const.dart';

part 'tracking_bill.g.dart';

@JsonSerializable()
class TrackingsBill {
  int? id;
  String? code;
  String? description;
  List<TrackingType?>? trackingType;
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
  bool? isSplit;
  String? parentTracking;
  bool? isDeleted;
  String? imageUrl;
  String? note;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  OrderStatus? exploitStatus;
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
  int? trackingAmount;
  String? orderId;
  String? optionalImage;
  String? price;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? vnExportDate;
  int? vnPackedById;
  bool? isRenamed;
  String? priority;
  int? whTrackingId;
  String? vnImportDate;
  String? productName;
  bool? hasError;

  TrackingsBill({
    this.id,
    this.code,
    this.trackingType,
    this.description,
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
    this.weight,
    this.trackingAmount,
    this.orderId,
    this.optionalImage,
    this.price,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.vnExportDate,
    this.vnPackedById,
    this.isRenamed,
    this.priority,
    this.productName,
    this.whTrackingId,
    this.vnImportDate,
    this.hasError,
  });

  factory TrackingsBill.fromJson(Map<String, dynamic> json) =>
      _$TrackingsBillFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingsBillToJson(this);

  static OrderStatus? _statusFromJson(String? value) =>
      OrderStatus.fromValue(value);

  static String? _statusToJson(OrderStatus? status) => status?.value;


  String get formattedTrackingTotalMoney {
    return Const.convertPrice(trackingTotalMoney);
  }

  double get formattedShippingFee {
    return double.parse(trackingShippingFee ?? "0.0");
  }

  double get formattedTrackingOtherFee {
    return double.parse(trackingOtherFee ?? "0.0");
  }

  double get formattedTrackingSurcharge{
    return double.parse(trackingSurcharge ?? "0.0");
  }


  String get formattedTrackingTotalWeight {
    return Const.convertWeight(trackingCalculationWeight.toString());
  }

  String get formattedTrackingMiningWeight {
    return Const.convertWeight2(trackingMiningWeight.toString());}

  String get formattedMergeWeight {
    return "$formattedTrackingMiningWeight/$formattedTrackingTotalWeight";}
}

@JsonSerializable()
class TrackingType {
  int? id;
  String? name;
  String? status;
  String? uid;
  String? createdAt;
  String? updatedAt;

  TrackingType(
      {this.id,
        this.name,
        this.status,
        this.uid,
        this.createdAt,
        this.updatedAt,
  });
  factory TrackingType.fromJson(Map<String, dynamic> json) =>
      _$TrackingTypeFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingTypeToJson(this);
}

