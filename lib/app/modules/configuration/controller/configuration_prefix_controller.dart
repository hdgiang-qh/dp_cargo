import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';

import '../../../data/model/model/configuration_model.dart';
import '../../../data/model/response/coefficient_response.dart';
import '../../../data/repository/coefficient_reponsitory.dart';

class ConfigurationPrefixController extends BaseController {
  final pagingController = PagingController<ConfigurationPrefix>();
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final listConfigurationPrefix = <ConfigurationPrefix>[].obs;

  final controllerMain = Get.find<MainController>();

  TextEditingController prefixOrderCodeController = TextEditingController();
  TextEditingController prefixPXKCodeController = TextEditingController();

  var isLoading = false.obs;
  Future<List<ConfigurationPrefix>>? getConfigurationPrefix() async{
    try {
      isLoading.value = true;
      final data = await coefficientRepo.getConfigurationPrefix(
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString());
      listConfigurationPrefix.value = data.listCoePrefix ?? [];
      prefixOrderCodeController.text = data
          .listCoePrefix![0].configValue!.config![0]!.orderCodePrefix
          .toString();
      prefixPXKCodeController.text = data
          .listCoePrefix![0].configValue!.config![0]!.deliveryBillCodePrefix
          .toString();
      return listConfigurationPrefix;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void updateConfigurationPrefix(int id, String key) {
    if (prefixPXKCodeController.text.isEmpty ||
        prefixOrderCodeController.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: "Các trường không được để trống");
    } else {
      Get.dialog(CustomDialog(
          title: "Xác nhận cập nhật mã tiền tố?",
          onTapYes: () {
            callDataService(
              coefficientRepo.updateConfiguration(
                id: id,
                payload: {
                  'key': key,
                  'value': {
                    'info': {
                      'title': "Cấu hình tiền tố",
                      'description': "Cấu hình tiền tố các mã"
                    },
                    'config': [
                      {
                        'order_code_prefix': prefixOrderCodeController.text,
                        "delivery_bill_code_prefix":
                            prefixPXKCodeController.text
                      }
                    ]
                  }
                },
              ),
              onSuccess: (data) {
                AppSnackBar.showSuccess(
                    message:
                        "Cập nhật thông tin cấu hình mã tiền tố thành công");
              },
            );
            Get.back();
          },
          onTapNo: () => Get.back()));
    }
  }

  onSelected() {}

  onRefreshPage() {}

  onLoadNextPage() {
    logger.i("On load next");
  }

  @override
  void onInit() {
    getConfigurationPrefix();
    super.onInit();
  }
}
