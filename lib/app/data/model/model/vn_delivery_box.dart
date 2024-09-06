import 'package:json_annotation/json_annotation.dart';

import '../../../core/enum/boxes_status.dart';

part 'vn_delivery_box.g.dart';

@JsonSerializable()
class VnDeliveryBox {
  int? id;
  String? code;
  int? vnDeliveryOrderId;
  int? deliveredById;
  DateTime? receivedDate;
  DateTime? deliveredDate;
  String? deliveredImageUrl;
  String? note;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  BoxesStatus? status;

  VnDeliveryBox({
    this.id,
    this.code,
    this.vnDeliveryOrderId,
    this.deliveredById,
    this.receivedDate,
    this.deliveredDate,
    this.deliveredImageUrl,
    this.note,
    this.status,
  });

  factory VnDeliveryBox.fromJson(Map<String, dynamic> json) => _$VnDeliveryBoxFromJson(json);
  Map<String, dynamic> toJson() => _$VnDeliveryBoxToJson(this);

  static BoxesStatus? _statusFromJson(int? id) => BoxesStatus.fromId(id);

  static int? _statusToJson(BoxesStatus? status) => status?.id;
}