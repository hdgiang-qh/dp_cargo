import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vncss/app/data/model/model/configuration_model.dart';
import 'package:vncss/app/data/model/response/coefficient_response.dart';

import '../model/model/bill_of_lading.dart';
import '../model/response/bill_of_lading_response.dart';

part 'configuration_data_source.g.dart';

@RestApi()
abstract class ConfigurationDataSource {
  factory ConfigurationDataSource(Dio dio, {String baseUrl}) =
      _ConfigurationDataSource;

  @GET('/api/general_configs/list?key=BOX_COEFFICIENT_CONFIG')
  Future<ConfigurationBoxResponse> getConfigurationBox(
      @Query("warehouse_id") String? warehouseId);

  @GET('/api/general_configs/list?key=CONTACT_INFORMATION_CONFIG')
  Future<ConfigurationInformationResponse> getConfigurationInformation(
      @Query("warehouse_id") String? warehouseId);

  @GET('/api/general_configs/list?key=CODE_PREFIX_CONFIG')
  Future<ConfigurationPrefixResponse> getConfigurationPrefix(
      @Query("warehouse_id") String? warehouseId);

  @GET('/api/general_configs/list?key=MAIL_SERVER_CONFIG')
  Future<ConfigurationMailResponse> getConfigurationMail(
      @Query("warehouse_id") String? warehouseId);

  @GET('/api/roles/list')
  Future<ConfigurationGroupResponse> getConfigurationGroup(
      @Query("warehouse_id") String? warehouseId);

  @PUT('/api/roles/update/{id}')
  Future updateConfigurationGroup(
      @Path('id') int id, @Body() Map<String, dynamic> payload);

  @POST('/api/roles/create')
  Future createConfigurationGroup(@Body() Map<String, dynamic> payload);

  @DELETE('/api/roles/delete/{id}')
  Future deleteConfigurationGroup(
      @Path('id') int id);

  @GET('/api/roles/{id}')
  Future<ConfigurationGroupDetailResponse> getConfigurationGroupDetail(
      @Path('id') int id, @Query("warehouse_id") String? warehouseId);

  @GET('/api/permissions/list')
  Future<ConfigurationPermissionResponse> getConfigurationPermission(
      @Query("warehouse_id") String? warehouseId);

  @GET('/api/general_configs/list?key=PRICING_CONFIG')
  Future<ConfigurationPriceResponse> getConfigurationPrice(
      @Query("warehouse_id") String? warehouseId);

  @GET('/api/general_configs/interfaces')
  Future<ConfigurationInterfaceResponse> getConfigurationInterface();

  @PUT('/api/general_configs/{id}')
  Future updateConfiguration(
      @Path("id") int id, @Body() Map<String, dynamic> payload);

  @POST('/api/general_configs')
  Future postConfiguration(@Body() Map<String, dynamic> payload);

  @PUT('/api/general_configs/{id}')
  Future optionConfigurationBank(
      @Path('id') int id, @Body() Map<String, dynamic> payload);

  @DELETE('/api/general_configs/{id}')
  Future deleteConfiguration(@Path("id") int id);
}
