import 'package:json_annotation/json_annotation.dart';
import 'vn_delivery_unit.dart';

part 'vn_delivery_order.g.dart';

@JsonSerializable()
class VnDeliveryOrder {
  int? id;
  String? code;
  int? quantity;
  int? deliveryBillId;
  int? status;
  int? vnDeliveryUnitId;
  VnDeliveryUnit? vnDeliveryUnit;  

  VnDeliveryOrder({
    this.id,
    this.code,
    this.quantity,
    this.deliveryBillId,
    this.status,
    this.vnDeliveryUnitId,
    this.vnDeliveryUnit,
  });
  factory VnDeliveryOrder.fromJson(Map<String, dynamic> json) => _$VnDeliveryOrderFromJson(json);
  Map<String, dynamic> toJson() => _$VnDeliveryOrderToJson(this);
}