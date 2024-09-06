import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../data/model/model/box_coeffecient_config.dart';
import '../../../../data/model/model/config_price.dart';
import '../../../../data/model/response/list_config_price_response.dart';
import '../../../../data/model/response/list_config_response.dart';
import '../../../../data/repository/list_config_price_repository.dart';


class ConfigPriceController extends BaseController {
  final listConfigPrice = <ConfigPriceData>[].obs;
  final listBoxCoeffecientConfig = <BoxCoeffecientConfig>[].obs;
  final configPriceRepo = Get.find<ListConfigPriceRepository>();
  final filteredList = <ConfigPriceData>[].obs;
  TextEditingController boxCoeffecientConfigController = TextEditingController();
  var selectedFilter = ''.obs;
  String? tittle;

  void getListConfigPrice(){
    callDataService<ListConfigPriceResponse>(
        configPriceRepo.getListConfigPrice(),
        onSuccess: (data)
        {
          listConfigPrice.value = data.configPrice!.toList();
        }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  void getListBoxConeffecientConfig(){
    callDataService<ListeBoxCoeffecientConfigResponse>(
        configPriceRepo.getListBoxCoefficientConfig(),
        onSuccess: (data)
        {
          listBoxCoeffecientConfig.value = data.configBoxCoefficient!.toList();
          boxCoeffecientConfigController.text = data.configBoxCoefficient![0].configValue!.config![0].boxCoefficiente!;
        }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  void filterData(int id) {
    if(id == 0){
      filteredList.clear();
    }else{
      if (filteredList.isEmpty) {
        filteredList.value = listConfigPrice;
      } else {
        filteredList.value = listConfigPrice.where((data) => data.id == id).toList();
      }
    }

  }
  void onDropdownChanged(int? newValue) {
    if (newValue != null && listConfigPrice.any((data) => data.configValue?.info?.description == newValue)) {
      filterData(newValue);
    }
  }

  @override
  void onInit() {
    getListConfigPrice();
    getListBoxConeffecientConfig();
    super.onInit();
  }
}