import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/tracking/tracking_screen/controller/tracking_controller.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../data/model/model/tracking.dart';
import '../../../../data/model/model/tracking_status_model.dart';
import '../../../../data/model/response/list_total_status.dart';
import '../../../../data/model/response/list_trackings_response.dart';
import '../../../../data/repository/tracking_repository.dart';
import '../../../../data/repository/total_status_repository.dart';


class TrackingStatusController extends BaseController {
  final code = ''.obs;
  var exploitStatus = 0.obs;
  final trackingController = Get.find<TrackingController>();
  final trackingStatusRepo = Get.find<TotalStatusRepository>();
  final listStatus = <TrackingStatusModel>[].obs;
  final Rxn<DateTimeRange> dateFilter = Rxn<DateTimeRange>();
  var indexStatus = 0.obs;
  var currentIndex = 0.obs;
  var customer = "".obs;
  var undefinedCustomer = false.obs;
  var totalString = "".obs;
  var total = 0.obs;

  final colors = [
    AppColors.allTracking,
    AppColors.waitingForWarehouseUS,
    AppColors.enteredWarehouseUS,
    AppColors.transportingToVN,
    AppColors.enteredWarehouseVN,
    AppColors.exploited,
    AppColors.packed,
    AppColors.delivering,
    AppColors.completed,
    AppColors.canceled
  ].obs;

  void getListValueStatus(){
    callDataService<ListTrackingStatusResponse>(
        trackingStatusRepo.getListTrackingStatus(
            exploitStatus: exploitStatus.toString(),
            code: trackingController.codeTrackingFilter.text,
            customer: trackingController.idCustomerFilter.value,
            undefinedCustomer: trackingController.undefinedCustomer.value,
            fromDate: trackingController.fromDateChoose.value,
            toDate: trackingController.toDateChoose.value,
            filterDateBy: trackingController.getfilterDateBy(trackingController.FilterDateBy.value)
        ),
        onSuccess: (data) {
          listStatus.clear();
          total.value = 0;
          totalString.value = "";
          listStatus.value = data.listTrackingStatus ?? [];
          listStatus.add(TrackingStatusModel(name: "Tất cả", total: "", id: 0),);
          for (TrackingStatusModel tracking in listStatus) {
            if (tracking.total != null) {
              total.value += int.parse(tracking.total!);
              totalString.value = total.value.toString();
            }
          }
        });
  }

  @override
  void onInit() {
    getListValueStatus();
    super.onInit();
  }
}