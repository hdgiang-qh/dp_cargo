import 'package:json_annotation/json_annotation.dart';

part 'notify.g.dart';

@JsonSerializable()
class Notify {
  String? receiver;
  DateTime? timestamp;
  String? type;
  String? title;
  String? message;
  @JsonKey(name: 'location_id')
  String? locationId;
  @JsonKey(name: 'gateway_serial')
  String? gatewaySerial;
  bool? readed;
  Data? data;

  Notify(
      {this.receiver,
        this.timestamp,
        this.type,
        this.title,
        this.message,
        this.locationId,
        this.gatewaySerial,
        this.readed,
        this.data});

  factory Notify.fromJson(Map<String, dynamic> json) => _$NotifyFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyToJson(this);
}

@JsonSerializable()
class Data {
  int? timestamp;
  int? status;
  int? battery;
  String? nType;
  String? nId;

  Data({this.timestamp, this.status, this.battery, this.nType, this.nId});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}
