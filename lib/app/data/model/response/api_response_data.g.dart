// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseData<T> _$ApiResponseDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponseData<T>(
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$ApiResponseDataToJson<T>(
  ApiResponseData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };
