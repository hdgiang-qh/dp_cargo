import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../data/model/model/overview.dart';
import '../../../../data/model/model/tracking_status_model.dart';
import '../../../../data/model/response/list_total_status.dart';
import '../../../../data/model/response/overview_response.dart';
import '../../../../data/repository/overview_repository.dart';
import '../../../../data/repository/total_status_repository.dart';


class OverviewController extends BaseController {
  final overview = OverviewModel().obs;
  final overviewRepo = Get.find<OverviewRepository>();

  void getOverview(){
    callDataService<OverviewResponse>(
        overviewRepo.getOverview(),
        onSuccess: (data)
        {
          overview.value = data.overviewModel!;
        }, onError: (error) {
          showErrorMessage(error.toString());
    });

  }

  @override
  void onInit() {
    getOverview();
    super.onInit();
  }
}