import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/delivery_bill.dart';
import '../../../../data/model/model/tracking.dart';
import '../../../../data/model/model/tracking_status_model.dart';
import '../../../../data/model/response/list_total_status.dart';
import '../../../../data/model/response/list_trackings_response.dart';
import '../../../../data/repository/tracking_repository.dart';
import '../../../../data/repository/total_status_repository.dart';
import 'mawb_controller.dart';


class AwbStatusController extends BaseController {

  var isGettingOrder = false.obs;
  final pagingOrderController = PagingController<TotalBillModel>();
  final awbController = Get.find<AWBController>();
  final awbStatusRepo = Get.find<TotalStatusRepository>();
  final listStatus = <TotalBillModel>[].obs;
  final Rxn<DateTimeRange> dateFilter = Rxn<DateTimeRange>();

  var total = 0.obs;

  final colors = [
    Color(0xffb92f2e),
    Color(0xFFB58A00),
    Color(0xFF751414),
    Color(0xFF70BBFD),
    Color(0xFF3380FF),
    Color(0xFF367A56),
    Color(0xFF2D346F),

  ].obs;

  void getListValueStatus(){
    callDataService<ListAwbStatusResponse>(
        awbStatusRepo.getListAwbStatus(
          keyWords: awbController.awbCodeFilter.text,
          exploitStatus: awbController.exploitStatus.value,
          boxCode: awbController.boxCodeFilter.text,
          trackingCode: awbController.trackingCodeFilter.text,
        ),
        onSuccess: (data) {
          listStatus.clear();
          total.value = 0;
          listStatus.value = data.listAwbStatus ?? [];
          listStatus.add(TotalBillModel(name: "Tất cả", total: 0, id: 0),);
          for (TotalBillModel awb in listStatus) {
            if (awb.total != null) {
              total.value += awb.total!;
            }
          }
        },onError: (_){
          AppSnackBar.showIsEmpty();
    });
  }

  @override
  void onInit() {
    getListValueStatus();
    super.onInit();
  }
}