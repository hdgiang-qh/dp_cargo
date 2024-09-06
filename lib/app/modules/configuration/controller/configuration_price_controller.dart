import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';
import 'package:vncss/app/modules/configuration/controller/configuration_interface_controller.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';

import '../../../data/model/model/configuration_model.dart';
import '../../../data/model/model/interface_model.dart';
import '../../../data/model/response/coefficient_response.dart';
import '../../../data/repository/coefficient_reponsitory.dart';

class ConfigurationPriceController extends BaseController {
  final pagingController = PagingController<ConfigurationPrice>();
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final listConfigurationPrice = <ConfigurationPrice>[].obs;
  List<Map<String, dynamic>> listConfig = [];
  List<Map<String, dynamic>> listConfigAdd = [];
  final controllerInterface = Get.find<ConfigurationInterfaceController>();

  final controllerMain = Get.find<MainController>();
  final showData = <bool>[].obs;
  late List<List<TextEditingController>> controllers;
  List<int> costUpdate = [];
  List<int> costAdd = [];
  late List<TextEditingController> controllerTitle;
  late List<TextEditingController> controllerAdd;
  TextEditingController addTitle = TextEditingController();

  List<Map<String, dynamic>> combinedData = [];

  List<List<Map<String, dynamic>>> combinedConfig = [];
  List<Map<String, dynamic>> combinedList = [];
  var isLoading = false.obs;


  getConfigurationPrices() {
    callDataService<ConfigurationPriceResponse>(
        coefficientRepo.getConfigurationPrice(
            warehouseId: controllerMain.warehouseId == 0
                ? null
                : controllerMain.warehouseId.toString()), onSuccess: (data) {
      isLoading.value = true;
      listConfigurationPrice.value = data.listPrice ?? [];
      showData.value = List<bool>.filled(listConfigurationPrice.length, false);

      controllers = listConfigurationPrice.map((config) {
        return config.configValue!.config!.map((item) {
          return TextEditingController(text: item?.cost.toString());
        }).toList();
      }).toList();

      controllerTitle = listConfigurationPrice.map((item) {
        return TextEditingController(text: item.configValue!.info!.description);
      }).toList();

      controllerAdd = controllerInterface.combinedTable.map((item) {
        return TextEditingController();
      }).toList();

      combinedConfig.clear();
      for (int i = 0; i < listConfigurationPrice.length; i++) {
        for (int j = 0;
        j < listConfigurationPrice[i].configValue!.config!.length;
        j++) {
          List<Map<String, dynamic>> configList = listConfigurationPrice[i]
              .configValue
              ?.config!
              .map((item) => {
            'tracking_type': item?.trackingType,
            'warehouse_config_id': item?.warehouseConfigId,
            'cost': item?.cost,
          })
              .toList() ??
              [];
          combinedConfig.add(configList);
        }
      }
      combineData();
    });
  }

  Future<void> combineData() async {
    for (int y = 0; y < listConfigurationPrice.length; y++) {
      if (controllerInterface.combinedTable.length ==
          listConfigurationPrice[y].configValue!.config!.length) {
        for (int i = 0; i < controllerInterface.combinedTable.length; i++) {
          combinedList.add({
            ...controllerInterface.combinedTable[i],
            'cost': listConfigurationPrice[y]
                    .configValue!
                    .config?[i]
                    ?.cost
                    ?.toInt() ??
                0,
          });
        }
      } else {
        for (int i = 0;
            i < listConfigurationPrice[y].configValue!.config!.length;
            i++) {
          combinedList.add({
            ...controllerInterface.combinedTable[i],
            'cost': listConfigurationPrice[y]
                .configValue!
                .config![i]!
                .cost!
                .toInt(),
          });
        }
      }
    }
  }

  void matchList() {
    listConfig.clear();
    for (int i = 0; i < controllerInterface.combinedTable.length; i++) {
      if (i < costUpdate.length) {
        listConfig.add({
          "tracking_type": double.parse(
              controllerInterface.combinedTable[i]['tracking_type_key'])
              .toInt(),
          "warehouse_config_id": double.parse(
              controllerInterface.combinedTable[i]['warehouse_config_id_key'])
              .toInt(),
          "cost": costUpdate[i].toInt(),
        });
      } else {
        print("Warning: costUpdate does not have enough elements");
        break;
      }
    }
  }

  void matchListAdd() {
    listConfigAdd.clear();
    for (int i = 0; i < controllerInterface.combinedTable.length; i++) {
      listConfigAdd.add({
        "tracking_type": double.parse(
                controllerInterface.combinedTable[i]['tracking_type_key'])
            .toInt(),
        "warehouse_config_id": double.parse(
                controllerInterface.combinedTable[i]['warehouse_config_id_key'])
            .toInt(),
        "cost": costAdd[i].toInt(),
      });
    }
  }

  void deleteConfigurationPrice(int id) {
    callDataService(
      coefficientRepo.deleteConfiguration(id: id),
      onSuccess: (data) {
        AppSnackBar.showSuccess(message: "Xóa bảng giá thành công");
      },
    );
  }

  void createConfigurationPrice({required String key, required String des}) {
    callDataService(
      coefficientRepo.postConfiguration(payload: {
        "key": key,
        'value': {
          'info': {'title': "Bảng giá cước vận chuyển", 'description': des},
          'config': listConfigAdd
        }
      }),
      onSuccess: (data) {
        AppSnackBar.showSuccess(message: "Tạo bảng giá '$des' thành công");
      },
    );
  }

  void updateConfigurationPrice(
      {required int id,
      required String key,
      required String title,
      required String des}) {
    callDataService(
      coefficientRepo.updateConfiguration(id: id, payload: {
        "key": key,
        'value': {
          'info': {'title': title, 'description': des},
          'config': listConfig
        }
      }),
      onSuccess: (data) {
        AppSnackBar.showSuccess(message: "Cập nhật bảng giá thành công");
      },
    );
  }

  String trackingType(String value) {
    String i = "";
    switch (value) {
      case "2":
        i = 'Hàng thường';
      case "3":
        i = 'Đồng hồ';
      case "4":
        i = 'Hàng điện tử';
      case "5":
        i = 'Laptop';
      case "6":
        i = 'Cigars';
      case "7":
        i = 'BBW';
      case "8":
        i = 'Giày dép, Quần áo';
      case "9":
        i = 'Mỹ Phẩm - Nước Hoa';
    }
    return i;
  }

  String warehouseValue(String value) {
    String i = "";
    switch (value) {
      case "1":
        i = 'HCM';
      case "2":
        i = 'Hà Nội';
    }
    return i;
  }

  printControllersValues(int index) {
    if (index >= 0 && index < controllers.length) {
      var controllerList = controllers[index];
      costUpdate.clear();
      bool hasInvalidValue = false;
      String invalidValue = '';
      String errorType = '';

      for (var controller in controllerList) {
        String value = controller.text.trim();
        if (value.isEmpty) {
          hasInvalidValue = true;
          invalidValue = 'trống';
          errorType = 'trống';
          AppSnackBar.showIsEmpty(message: "Không được để trống các giá trị");
          break;
        } else if (!RegExp(r'^-?\d+(\.\d+)?$').hasMatch(value)) {
          hasInvalidValue = true;
          invalidValue = value;
          AppSnackBar.showIsEmpty(message: "Có giá trị không phải là số hợp lệ");
          errorType = 'không phải là số hợp lệ';
          break;
        } else {
          costUpdate.add(double.parse(value).toInt());
        }
      }

      if (hasInvalidValue) {
        if (errorType == 'trống') {
          print('Lỗi: Phát hiện giá trị trống.');
        } else {
          print('Lỗi: Giá trị "$invalidValue" $errorType.');
        }
        costUpdate.clear();
      } else {
        print('Tất cả các giá trị đều hợp lệ và đã được thêm vào costUpdate.');
        Get.dialog(
          CustomDialog(
            title: "Cập nhật bảng giá hay không?",
            onTapYes: () async {
              updateConfigurationPrice(
                  id: listConfigurationPrice[
                  index]
                      .id ??
                      0,
                  key: listConfigurationPrice[index]
                      .configKey
                      .toString(),
                  title: listConfigurationPrice[
                  index]
                      .configValue
                      ?.info
                      ?.title ??
                      '',
                  des: controllerTitle[index].text);
              Get.back();
              Future.delayed(
                  const Duration(milliseconds: 500),
                      () {
                   onRefreshPage();
                  });
            },
            onTapNo: () {
              Get.back();
            },
          ),
        );
      }
    } else {
      print('Invalid index');
    }
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  addControllersValues() {
    costAdd.clear();
    for (var controller in controllerAdd) {
      if (controller.text.isEmpty) {
        controller.text = 0.toString();
      } else if (!isNumeric(controller.text)) {
        AppSnackBar.showIsEmpty(message: "Giá không được chứa ký tự ngoài số");
      }
      if (!isNumeric(controller.text)) {
        return;
      } else {
        costAdd.add(double.parse(controller.text).toInt());
      }
    }
  }

  @override
  void onInit() {
    getConfigurationPrices();
    super.onInit();
  }

  onRefreshPage() {
    pagingController.initRefresh();
    listConfigurationPrice.clear();
    getConfigurationPrices();
  }

  onLoadNextPage() {
    logger.i("On load next");
  }
}
