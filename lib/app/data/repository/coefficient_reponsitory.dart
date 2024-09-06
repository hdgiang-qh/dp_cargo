import 'package:vncss/app/data/model/response/coefficient_response.dart';

import '../model/model/configuration_model.dart';

abstract class ConfigurationReponsitory {
  Future<ConfigurationBoxResponse> getConfigurationBox({String? warehouseId});

  Future<ConfigurationInformationResponse> getConfigurationInformation(
      {String? warehouseId});

  Future<ConfigurationPrefixResponse> getConfigurationPrefix(
      {String? warehouseId});

  Future<ConfigurationMailResponse> getConfigurationMail({String? warehouseId});

  Future<ConfigurationGroupResponse> getConfigurationGroup(
      {String? warehouseId});

  Future updateConfigurationGroup(
      {required int id, required Map<String, dynamic> payload});

  Future createConfigurationGroup(
      {required Map<String, dynamic> payload});

  Future deleteConfigurationGroup(
      {required int id});

  Future<ConfigurationGroupDetailResponse> getConfigurationGroupDetail(
      {required int id, String? warehouseId});

  Future<ConfigurationPermissionResponse> getConfigurationPermission(
      {String? warehouseId});

  Future<ConfigurationPriceResponse> getConfigurationPrice(
      {String? warehouseId});

  Future<ConfigurationInterfaceResponse> getConfigurationInterface();

  Future updateConfiguration(
      {required int id, required Map<String, dynamic> payload});

  Future postConfiguration({required Map<String, dynamic> payload});

  Future optionConfigurationBank({required int id,required Map<String, dynamic> payload});

  Future deleteConfiguration({required int id});
}
