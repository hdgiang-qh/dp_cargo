import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../data/model/model/tracking_status_model.dart';
import '../../../../data/model/response/list_total_status.dart';
import '../../../../data/repository/total_status_repository.dart';
import 'list_orders_controller.dart';


class OrderStatusController extends BaseController {
  var isGettingOrder = true.obs;
  final pagingOrderController = PagingController<TrackingStatusModel>();
  final orderController = Get.find<ListOrdersController>();
  final orderStatusRepo = Get.find<TotalStatusRepository>();
  final listStatus = <TrackingStatusModel>[].obs;

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
    callDataService<ListOrderStatusResponse>(
        orderStatusRepo.getListOrderStatus(
          page: 10,
          pageSize: pagingOrderController.pageNumber,
          code: orderController.codeFilter.text,
          trackingCode: orderController.trackingFilter.text,
          fromDate: orderController.fromDateChoose.value,
          toDate: orderController.toDateChoose.value,
          filterDateBy: orderController.getfilterDateBy(orderController.filterDateBy.value),
          exploitStatus: orderController.exploitStatus.value.toInt(),
          isGettingOrder: isGettingOrder.value,
        ),
        onSuccess: (data)
        {
          listStatus.clear();
          total.value = 0;
          totalString.value = "";
          listStatus.value = data.listOrderStatus ?? [];
          listStatus.add(TrackingStatusModel(name: "", total: "", id: 1),);
          for (TrackingStatusModel order in listStatus) {
            if (order.total != null) {
              total.value += int.parse(order.total!);
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