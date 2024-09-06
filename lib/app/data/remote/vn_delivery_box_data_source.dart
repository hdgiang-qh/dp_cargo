import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../model/model/vn_delivery_box.dart';
import '../model/response/api_response_data.dart';
part 'vn_delivery_box_data_source.g.dart';

@RestApi()
abstract class VnDeliveryBoxDataSource {
  factory VnDeliveryBoxDataSource(Dio dio, {String baseUrl}) = _VnDeliveryBoxDataSource;

  @GET('/api/vn_delivery_boxes')
  Future<ApiResponseData<List<VnDeliveryBox>>> getListVnDeliveryBoxes();

  @PUT('/api/vn_delivery_boxes/:id/note')
  Future<ApiResponseData> vnDeliveryBoxNote(@Path('id') int id, @Field('note') String note);

  @PUT('/api/vn_delivery_boxes/receiving')
  Future<ApiResponseData> vnDeliveryBoxReceiving(@Field('codes') List<String> codes);

  @PUT('/api/vn_delivery_boxes/success')
  Future<ApiResponseData> vnDeliverySuccess(@Field('codes') List<String> codes);

}