import 'package:json_annotation/json_annotation.dart';

part 'tracking_type.g.dart';

@JsonSerializable()
class TrackingsType {
  int? id;
  String? name;
  String? status;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? createdById;
  String? updatedById;

  TrackingsType(
      {this.id,
        this.name,
        this.status,
        this.uid,
        this.createdAt,
        this.updatedAt,
        this.createdById,
        this.updatedById});

  factory TrackingsType.fromJson(Map<String, dynamic> json) =>
      _$TrackingsTypeFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingsTypeToJson(this);

}
