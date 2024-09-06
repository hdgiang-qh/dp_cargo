import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/permission_model.dart';
import 'package:vncss/app/data/model/response/coefficient_response.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';

import '../../../data/repository/coefficient_reponsitory.dart';

class RoleCreateController extends BaseController {
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final listPermission = <PermissionsModel>[].obs;
  final controllerMain = Get.find<MainController>();

  final listPermissionNew = <PermissionsNew>[].obs;
  final listPermissionFinal = <PermissionsFinal>[].obs;
  final TextEditingController permission = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController group = TextEditingController();

  final listValueAdd = <ValueUp>[].obs;

  String? type;
  final listRole = [
    'Admin',
    'Quản lý',
    'NV Kế toán',
    'NV Kinh doanh',
    'NV CSKH',
    'NV Khai thác',
    'NV Giao hàng',
    'NV Marketing'
  ];

  String roleType(String title) {
    String i = '';
    switch (title) {
      case 'Admin':
        i = 'admin';
      case 'Quản lý':
        i = 'quan_ly';
      case 'NV CSKH':
        i = 'nhan_vien_cskh';
      case 'NV Kế toán':
        i = 'ke_toan';
      case "NV Khai thác":
        i = "marketing";
      case "NV Kinh Doanh":
        i = "nhan_vien_kinh_doanh";
      case "NV Giao hàng":
        i = "shipper";
      case "NV Marketing":
        i = "nhan_vien_khai_thac";
      default:
        i = "Chưa chọn quyền";
    }
    return i;
  }

  getConfigurationPermission() {
    callDataService<ConfigurationPermissionResponse>(
      coefficientRepo.getConfigurationPermission(
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        listPermission.value = data.listPermission ?? [];

        for (int i = 0; i < listPermission.length; i++) {
          listPermissionNew.add(PermissionsNew(listPermission[i], false));
          // var item = listPermissionNew[i];
          // listPermissionFinal.add(PermissionsFinal(item, [], null));
        }
        for (int i = 0; i < listPermissionNew.length; i++) {
          var item = listPermissionNew[i];
          if (item.isSelected) {
            var businessLogic = item.items.businessLogic;
            if (businessLogic == null || businessLogic.isEmpty) {
              listPermissionFinal.add(PermissionsFinal(item, [], null));
              continue;
            }

            List<bool> listIsSelected =
            List.generate(businessLogic.length, (index) => false);
            // for (int j = 0; j < businessLogic.length; j++) {
            //   for (int u = 0; u < listAction.length; u++) {
            //     if (item.items.id == listAction[u].id) {
            //       if (businessLogic[j]?.id ==
            //           listAction[u].permissionBusinessLogicId) {
            //         listIsSelected[j] = true;
            //         inValue = j + 1;
            //         break;
            //       }
            //       continue;
            //     }
            //   }
            // }
            listPermissionFinal
                .add(PermissionsFinal(item, listIsSelected, null));
          } else {
            var businessLogic = item.items.businessLogic;
            List<bool> listIsSelected =
            businessLogic != null && businessLogic.isNotEmpty
                ? List.filled(businessLogic.length, false)
                : [];
            listPermissionFinal
                .add(PermissionsFinal(item, listIsSelected, null));
          }
        }
      },
    );
  }

  final selectedRadioIndex = <RxInt>[].obs;
  void updateRadioSelection(int groupIndex, int selectedIndex) {
    selectedRadioIndex.value =
        List.generate(listPermissionFinal.length, (index) => (-1).obs);
    selectedRadioIndex[groupIndex].value = selectedIndex;
    for (int i = 0;
    i < listPermissionFinal[groupIndex].listIsSelected.length;
    i++) {
      listPermissionFinal[groupIndex].listIsSelected[i] = (i == selectedIndex);
      listPermissionFinal[groupIndex].items.isSelected = true;
    }
    listPermissionFinal.refresh();
  }

  void addValue() {
    listValueAdd.clear();
    for (int i = 0; i < listPermissionFinal.length; i++) {
      var item = listPermissionFinal[i];
      if (item.items.isSelected == true) {
        listValueAdd.add(ValueUp(
            id: item.items.items.id, permission_business_logic_id: item.per));
        continue;
      } else {
        continue;
      }
    }
  }

  createConfigurationGroup() {
    if (permission.text.isEmpty ||
        description.text.isEmpty ||
        group.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: 'Các trường không được để trống');
    } else {
      callDataService(
        coefficientRepo.createConfigurationGroup(payload: {
          "actions": listValueAdd.toList(),
          "description": description.text.toString(),
          "name": permission.text.toString(),
          "type": type.toString() ,
        }),
        onSuccess: (data) {
          AppSnackBar.showSuccess(message: 'Tạo thành công');
        },
        onError: (error) async {
          AppSnackBar.showIsEmpty(message: "");
          var translation = await GoogleTranslator().translate("rights already exists", to: 'vi');
          AppSnackBar.showWarning(message: translation.text);
        }
      );
    }
  }

  @override
  void onInit() {
    getConfigurationPermission();
    super.onInit();
  }
}
