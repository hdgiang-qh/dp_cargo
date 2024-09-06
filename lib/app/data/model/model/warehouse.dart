import 'package:json_annotation/json_annotation.dart';

part 'warehouse.g.dart';

@JsonSerializable()
class WareHouse {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? createdById;
  String? updatedById;

  WareHouse(
      {this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.createdById,
        this.updatedById});

  factory WareHouse.fromJson(Map<String, dynamic> json) => _$WareHouseFromJson(json);
  Map<String, dynamic> toJson() => _$WareHouseToJson(this);
}
