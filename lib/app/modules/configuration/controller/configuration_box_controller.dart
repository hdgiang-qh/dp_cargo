import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';

import '../../../data/model/model/configuration_model.dart';
import '../../../data/model/response/coefficient_response.dart';
import '../../../data/repository/coefficient_reponsitory.dart';

class ConfigurationBoxController extends BaseController {
  final pagingController = PagingController<ConfigurationBox>();
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final listConfigurationBox = <ConfigurationBox>[].obs;

  final controllerMain = Get.find<MainController>();

  TextEditingController updateValue = TextEditingController();

  bool isValidFormat(String input) {
    RegExp regex = RegExp(r'^\d{1,3}\.\d{1,3}$');
    return regex.hasMatch(input);
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  var isLoading = false.obs;
  Future<List<ConfigurationBox>>? getConfigurationBox() async {
    try {
      isLoading.value = true;
      final data = await coefficientRepo.getConfigurationBox(
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString());
      listConfigurationBox.value = data.listCoeBox ?? [];
      updateValue.text = data
          .listCoeBox![0].configValue!.config![0]!.boxConfiguratione
          .toString();
      return listConfigurationBox;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void updateConfigurationBox(int id, String key) {
    callDataService(
      coefficientRepo.updateConfiguration(
        id: id,
        payload: {
          'key': key,
          'value': {
            'info': {
              'title': "Cập nhật hệ số thùng",
              'description': "Hệ số thùng"
            },
            'config': [
              {'box_coefficiente': updateValue.text}
            ]
          }
        },
      ),
      onSuccess: (data) {
        AppSnackBar.showSuccess(message: "Cập nhật hệ số thùng thành công");
      },
    );
  }

  onSelected() {}

  onRefreshPage() {}

  onLoadNextPage() {
    logger.i("On load next");
  }

  @override
  void onInit() {
    getConfigurationBox();
    super.onInit();
  }
}
