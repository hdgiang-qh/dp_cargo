import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vncss/app/modules/common_widget/const.dart';


import '../../../core/base/base_controller.dart';
import '../../../core/base/paging_controller.dart';
import '../../../data/model/model/delivery_bill.dart';
import '../../../data/model/response/list_delivery_bill.dart';
import '../../../data/repository/authentication_repository.dart';
import '../../../data/repository/delivery_bill_repository.dart';
import '../../../data/service/auth_service.dart';
import '../../../data/service/setting_service.dart';

class HomeController extends BaseController {
  final authService = Get.find<AuthService>();

  final settingService = Get.find<SettingService>();

  final authRepo = Get.find<AuthenticationRepository>();
  final pagingController = PagingController<DeliveryBill>();
  final scrollController = ScrollController();

  final code = ''.obs;

  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final listDeliveryBill = <DeliveryBill>[].obs;
  final Rxn<DateTimeRange> dateFilter = Rxn<DateTimeRange>();

  int get countFilter {
    int count = 0;
    if (dateFilter.value != null) {
      count++;
    }
    if (code.isNotEmpty) {
      count++;
    }
    return count;
  }

  void getDeliveryBillsList() {
    if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;
    callDataService<ListDeliveryBillResponse>(
      deliveryBillRepo.getListDeliveryBill(
        code: code.value,
        deliveryBillStatus: '5',
        page: pagingController.pageNumber,
        pageSize: 20,
        fromDate: dateFilter.value?.start,
        toDate: dateFilter.value?.end,
      ),
      onSuccess: (data) {
        final repoList = data.deliveryBills ?? [];
        if (_isLastPage(repoList.length, data.meta!.total!)) {
          pagingController.appendLastPage(repoList);
        } else {
          pagingController.appendPage(repoList);
        }

        var newList = [...pagingController.listItems];

        listDeliveryBill.value = newList;
      },
    );
    pagingController.isLoadingPage = false;
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (listDeliveryBill.length + newListItemCount) >= totalCount;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    listDeliveryBill.clear();
    getDeliveryBillsList();
  }

  onLoadNextPage() {
    logger.i("On load next");
    getDeliveryBillsList();
  }

  @override
  void onInit() {
    listDeliveryBill.clear();
    getDeliveryBillsList();
    onLoadNextPage();
    super.onInit();
  }
}
