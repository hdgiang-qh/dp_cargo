import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/permission_model.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';

import '../../../data/model/model/staff.dart';
import '../../../data/model/response/coefficient_response.dart';
import '../../../data/repository/coefficient_reponsitory.dart';

class RightsDetailController extends BaseController {
  final pagingController = PagingController<StaffRoleName>();
  final coefficientRepo = Get.find<ConfigurationReponsitory>();
  final listConfigurationGroupDetail = StaffRoleName().obs;
  final listAction = <StaffAction>[].obs;
  final listPermission = <PermissionsModel>[].obs;
  final listPermissionNew = <PermissionsNew>[].obs;
  final listPermissionFinal = <PermissionsFinal>[].obs;
  final controllerMain = Get.find<MainController>();
  final listValueUp = <ValueUp>[].obs;
  final selectedRadioIndex = <RxInt>[].obs;

  final TextEditingController permission = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController group = TextEditingController();
  int? id;
  int inValue = 0;
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

  String roleTitle(String title) {
    String i = '';
    switch (title) {
      case 'shipper':
        i = 'NV Giao hàng';
      case 'admin':
        i = 'Admin';
      case 'nhan_vien_cskh':
        i = 'NV CSKH';
      case 'ke_toan':
        i = 'NV Kế toán';
      case "nhan_vien_khai_thac":
        i = "NV Marketing";
      case "marketing":
        i = "NV Khai thác";
      case 'quan_ly':
        i = 'Quản lý';
      case "nhan_vien_kinh_doanh":
        i = "NV Kinh Doanh";
      default:
        i = "Chưa chọn quyền";
    }
    return i;
  }

  var isLoading = false.obs;
  void getConfigurationGroupDetail() {
    callDataService<ConfigurationGroupDetailResponse>(
      coefficientRepo.getConfigurationGroupDetail(
          id: id!,
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        isLoading.value = true;
        listConfigurationGroupDetail.value = data.listCoeGroupDetail!;
        listAction.value = data.listAction ?? [];
        permission.text = listConfigurationGroupDetail.value.name ?? '';
        description.text = listConfigurationGroupDetail.value.description ?? '';
        group.text =
            roleTitle(listConfigurationGroupDetail.value.type.toString());
        getConfigurationPermission();
      },
    );
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
          bool found = false;
          for (int j = 0; j < listAction.length; j++) {
            if (listPermission[i].id == listAction[j].id) {
              listPermissionNew.add(PermissionsNew(listPermission[i], true));
              found = true;
              break;
            }
          }
          if (!found) {
            listPermissionNew.add(PermissionsNew(listPermission[i], false));
          }
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
            for (int j = 0; j < businessLogic.length; j++) {
              for (int u = 0; u < listAction.length; u++) {
                if (item.items.id == listAction[u].id) {
                  if (businessLogic[j]?.id ==
                      listAction[u].permissionBusinessLogicId) {
                    listIsSelected[j] = true;
                    inValue = j + 1;
                    break;
                  }
                  continue;
                }
              }
            }
            listPermissionFinal
                .add(PermissionsFinal(item, listIsSelected, inValue));
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

  void addValue() {
    listValueUp.clear();
    for (int i = 0; i < listPermissionFinal.length; i++) {
      var item = listPermissionFinal[i];
      if (item.items.isSelected == true) {
        listValueUp.add(ValueUp(
            id: item.items.items.id, permission_business_logic_id: item.per));
        continue;
      } else {
        continue;
      }
    }
  }

  updateConfigGroup() async {
    if (permission.text.isEmpty ||
        description.text.isEmpty ||
        group.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: 'Các trường không được để trống');
    } else {
      print(listValueUp[2].permission_business_logic_id);
      print(listPermissionFinal[4].listIsSelected[1]);
      callDataService(
        coefficientRepo.updateConfigurationGroup(id: id!, payload: {
          "actions": listValueUp.toList(),
          "description": description.text.toString(),
          "name": permission.text.toString(),
          "type": type == null
              ? listConfigurationGroupDetail.value.type.toString()
              : type.toString(),
        }),
        onSuccess: (_) {
          AppSnackBar.showSuccess(message: 'Cập nhật thành công');
        },
      );
    }
  }

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

  onSelected() {}

  onRefreshPage() {
    pagingController.initRefresh();
    listPermission.clear();
    listPermissionNew.clear();
    listPermissionFinal.clear();
    getConfigurationPermission();
  }

  onLoadNextPage() {
    logger.i("On load next");
  }

  @override
  void onInit() {
    id = argument['id'];
    getConfigurationGroupDetail();
    super.onInit();
  }
}
