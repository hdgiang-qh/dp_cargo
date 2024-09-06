import 'package:json_annotation/json_annotation.dart';


part 'sync_awb.g.dart';

@JsonSerializable()
class SyncAwb {
  List<String>? processing;
  List<String>? notSynced;

  SyncAwb({this.processing, this.notSynced});

  factory SyncAwb.fromJson(Map<String, dynamic> json) => _$SyncAwbFromJson(json);
  Map<String, dynamic> toJson()=> _$SyncAwbToJson(this);
}