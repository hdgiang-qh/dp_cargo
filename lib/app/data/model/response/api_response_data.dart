import 'package:json_annotation/json_annotation.dart';

part 'api_response_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponseData<T> {
  final T data;

  ApiResponseData({required this.data});

  factory ApiResponseData.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ApiResponseDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseDataToJson(this, toJsonT);
}
