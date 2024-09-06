import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/repository/tracking_repository.dart';

import '../../../core/base/base_controller.dart';
import '../../../core/values/app_colors.dart';
import '../../../data/model/model/search_tracking.dart';
import '../../../data/model/response/list_trackings_response.dart';
import '../../main/controllers/main_controller.dart';

class SearchTrackingController extends BaseController {
  final trackingRepo = Get.find<TrackingsRepository>();
  final listSearchTracking = <SearchTracking>[].obs;
  final code = TextEditingController().obs;
  FocusNode focusNode = FocusNode();
  final controllerMain = Get.find<MainController>();

  Color buildColor({required String value}) {
    Color color = Colors.white;
    switch (value) {
      case "Chờ nhập kho US":
        color = AppColors.waitingForWarehouseUS.withOpacity(0.2);
      case "Đã nhập kho US":
        color = AppColors.enteredWarehouseUS.withOpacity(0.2);
      case "Đang vận chuyển về VN":
        color = AppColors.transportingToVN.withOpacity(0.2);
      case "Đã nhập kho VN":
        color = AppColors.enteredWarehouseVN.withOpacity(0.2);
      case "Đã đóng hàng":
        color = AppColors.packed.withOpacity(0.2);
      case "Đang giao hàng":
        color = AppColors.delivering.withOpacity(0.2);
      case "Đã khai thác":
        color = AppColors.exploited.withOpacity(0.2);
      case "Hoàn thành":
        color = AppColors.completed.withOpacity(0.2);
      case "Đã hủy bỏ":
        color = AppColors.canceled.withOpacity(0.2);
    }
    return color;
  }

  Color buildTextColor({required String value}) {
    Color color = Colors.white;
    switch (value) {
      case "Chờ nhập kho US":
        color = AppColors.waitingForWarehouseUS;
      case "Đã nhập kho US":
        color = AppColors.enteredWarehouseUS;
      case "Đang vận chuyển về VN":
        color = AppColors.transportingToVN;
      case "Đã nhập kho VN":
        color = AppColors.enteredWarehouseVN;
      case "Đã đóng hàng":
        color = AppColors.packed;
      case "Đang giao hàng":
        color = AppColors.delivering;
      case "Đã khai thác":
        color = AppColors.exploited;
      case "Hoàn thành":
        color = AppColors.completed;
      case "Đã hủy bỏ":
        color = AppColors.canceled;
    }
    return color;
  }

  var isLoading = false.obs;
  void getSearchTrackingList() {
    callDataService<SearchTrackingResponse>(
        trackingRepo.getListSearchTracking(
            code: code.value.text.toString(),
            warehouseID: controllerMain.warehouseId == 0
                ? null
                : controllerMain.warehouseId.toString()), onSuccess: (data) {
          isLoading.value = true;
      listSearchTracking.value = data.listSearchTracking ?? [];
    }, onError: (error) {
      print(error);
    });
  }

  onGetBarcode() {
    Get.back();
    getSearchTrackingList();
  }

  onChoose() {
    getSearchTrackingList();
  }

  onClear() {
    listSearchTracking.clear();
    code.value.clear();
  }


  @override
  void onInit() {
    super.onInit();
  }
}
