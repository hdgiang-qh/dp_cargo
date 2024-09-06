import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/interface_model.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';
import 'package:vncss/app/modules/util/images.dart';
import 'package:vncss/app/routes/app_pages.dart';

import '../../../data/model/model/configuration_model.dart';
import '../../../data/model/response/coefficient_response.dart';
import '../../../data/repository/coefficient_reponsitory.dart';

class ConfigurationInterfaceController extends BaseController {
  final pagingController = PagingController<ConfigurationPrefix>();
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final listInterface = <InterfaceModel>[].obs;
  List<Map<String, dynamic>> combinedTable = [];

  Map<int, Map<String, String>> trackingTypeOptionsList = {};
  Map<int, Map<String, String>> warehouseConfigOptionsList = {};
  Map<int, Map<String, String>> costOptionsList = {};
  List<String> title = [];

  var isLoading = false.obs;
  Future<List<InterfaceModel>>? getInterface() async{
    try {
      isLoading.value = true;
      final data = await coefficientRepo.getConfigurationInterface();
      listInterface.value = data.listInterface ?? [];
      for (int i = 0; i < listInterface.length; i++) {
        var pricingConfig = listInterface[i];
        if (pricingConfig.models?.view == 'list') {
          for (var field in pricingConfig.models?.fields ?? []) {
            if (field.key == "tracking_type" && field.options != null) {
              trackingTypeOptionsList[i] = field.options!;
            } else if (field.key == "warehouse_config_id" &&
                field.options != null) {
              warehouseConfigOptionsList[i] = field.options!;
            } else if (field.key == "cost" && field.options != null) {
              costOptionsList[i] = field.options!;
            }
            title.add(field.title);
          }
        }
      }
      combinedTable.clear();
      trackingTypeOptionsList.forEach((trackingIndex, trackingOptions) {
        trackingOptions.forEach((trackingKey, trackingValue) {
          warehouseConfigOptionsList
              .forEach((warehouseIndex, warehouseOptions) {
            warehouseOptions.forEach((warehouseKey, warehouseValue) {
              combinedTable.add({
                "tracking_type_key": trackingKey,
                "tracking_type_value": trackingValue,
                "warehouse_config_id_key": warehouseKey,
                "warehouse_config_id_value": warehouseValue,
              });
            });
          });
        });
      });
      return listInterface;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Function() onTapIndex({required String key}) {
    Function() i;
    switch (key) {
      case 'PRICING_CONFIG':
        i = Get.toNamed(Routes.COEFFICIENT_PRICE) as Function();
        break;
      case 'BOX_COEFFICIENT_CONFIG':
        i = Get.toNamed(Routes.COEFFICIENT_BOX) as Function();
        break;
      case 'BANK_ACCOUNT_CONFIG':
        i = Get.toNamed(Routes.COEFFICIENT_BANK) as Function();
        break;
      case 'CONTACT_INFORMATION_CONFIG':
        i = Get.toNamed(Routes.COEFFICIENT_COMMON) as Function();
        break;
      case 'MAIL_SERVER_CONFIG':
        i = Get.toNamed(Routes.COEFFICIENT_MAIL) as Function();
        break;
      case 'CODE_PREFIX_CONFIG':
        i = Get.toNamed(Routes.COEFFICIENT_PREFIX) as Function();
        break;
      default:
        i = () {};
        break;
    }
    return i;
  }

  String? pathIcon({required String key}) {
    String? i;
    switch (key) {
      case 'PRICING_CONFIG':
        i = Images.price_list;
      case 'BOX_COEFFICIENT_CONFIG':
        i = Images.coefficient;
      case 'BANK_ACCOUNT_CONFIG':
        i = Images.conflig_account;
      case 'CONTACT_INFORMATION_CONFIG':
        i = Images.conflig_contact;
      case 'MAIL_SERVER_CONFIG':
        i = Images.conflig_mail;
      case 'CODE_PREFIX_CONFIG':
        i = Images.conflig_prefix;
    }
    return i;
  }

  onRefreshPage() {}

  onLoadNextPage() {
    logger.i("On load next");
  }

  @override
  void onInit() {
    getInterface();
    super.onInit();
  }
}
