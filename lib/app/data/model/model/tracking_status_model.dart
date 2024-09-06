import 'package:json_annotation/json_annotation.dart';

part 'tracking_status_model.g.dart';

@JsonSerializable()
class TrackingStatusModel {
  String? name;
  String? total;
  int? id;

  TrackingStatusModel({this.name, this.total, this.id});

  factory TrackingStatusModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingStatusModelToJson(this);
}