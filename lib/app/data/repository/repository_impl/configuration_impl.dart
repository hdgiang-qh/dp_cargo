import 'package:get/get.dart';
import 'package:vncss/app/data/model/response/coefficient_response.dart';
import 'package:vncss/app/data/remote/configuration_data_source.dart';

import '../../../core/base/base_repo_handle.dart';
import '../coefficient_reponsitory.dart';

class ConfigurationImpl extends BaseRepoSource
    implements ConfigurationReponsitory {
  final ConfigurationDataSource _dataSource =
      Get.find<ConfigurationDataSource>();

  @override
  Future<ConfigurationBoxResponse> getConfigurationBox({String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getConfigurationBox(warehouseId));
  }

  @override
  Future<ConfigurationInformationResponse> getConfigurationInformation(
      {String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getConfigurationInformation(warehouseId));
  }

  @override
  Future<ConfigurationPrefixResponse> getConfigurationPrefix(
      {String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getConfigurationPrefix(warehouseId));
  }

  @override
  Future<ConfigurationMailResponse> getConfigurationMail(
      {String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getConfigurationMail(warehouseId));
  }

  @override
  Future<ConfigurationGroupResponse> getConfigurationGroup(
      {String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getConfigurationGroup(warehouseId));
  }

  @override
  Future<ConfigurationGroupDetailResponse> getConfigurationGroupDetail(
      {required int id, String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getConfigurationGroupDetail(id, warehouseId));
  }

  @override
  Future<ConfigurationPermissionResponse> getConfigurationPermission(
      {String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getConfigurationPermission(warehouseId));
  }

  @override
  Future<ConfigurationPriceResponse> getConfigurationPrice(
      {String? warehouseId}) {
    return callApiWithErrorHandleRepo(
        _dataSource.getConfigurationPrice(warehouseId));
  }

  @override
  Future<ConfigurationInterfaceResponse> getConfigurationInterface() {
    return callApiWithErrorHandleRepo(_dataSource.getConfigurationInterface());
  }

  @override
  Future updateConfiguration(
      {required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.updateConfiguration(id, payload));
  }

  @override
  Future postConfiguration({required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.postConfiguration(payload));
  }

  @override
  Future optionConfigurationBank(
      {required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.optionConfigurationBank(id, payload));
  }

  @override
  Future deleteConfiguration({
    required int id,
  }) {
    return callApiWithErrorHandleRepo(_dataSource.deleteConfiguration(id));
  }

  @override
  Future updateConfigurationGroup(
      {required int id, required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.updateConfigurationGroup(id, payload));
  }

  @override
  Future createConfigurationGroup(
      {required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(
        _dataSource.createConfigurationGroup(payload));
  }

  @override
  Future deleteConfigurationGroup(
      {required int id}) {
    return callApiWithErrorHandleRepo(
        _dataSource.deleteConfigurationGroup(id));
  }
}
