import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../core/utils/color_app.dart';
import '../../../../data/model/model/delivery_bill.dart';
import '../../../../data/model/response/list_delivery_bill.dart';
import '../../../../data/repository/delivery_bill_repository.dart';

class ListDeliveryBillController extends BaseController {
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final listDeliveryBill = <DeliveryBill>[].obs;
  final deliveryBill = DeliveryBill().obs;
  final code = ''.obs;

  final title = [
    // 'Tất cả',
    // 'Phiếu tạo mới',
    // 'Sale đã duyệt',
    // 'Kế toán duyệt',
    // 'Yêu cầu xuất kho',
    // 'Đã đóng hàng',
    // 'Đang giao hàng',
    "Hoàn thành",
    "Giao không thành công",
    "Đã huỷ bỏ"
  ];

  final  colors = [
    // primaryColor,
    // ColorApp.yellowE8,
    // ColorApp.blue00,
    // ColorApp.blue54,
    // ColorApp.blue4D,
    // ColorApp.blue002,
    // ColorApp.yellowFF,
    ColorApp.green23,
    ColorApp.orangeF2,
    primaryColor
  ].obs;

  var indexStatus = 7.obs;
  var currentIndex = 0.obs;

  void changeStatusDelivery(int newValue) {
    indexStatus.value = newValue + 7;
  }
  void onTapStatus(int index){
    currentIndex.value = index;
    changeStatusDelivery(currentIndex.value);
    onRefreshPage();
  }
  
  final Rxn<DateTimeRange> dateFilter = Rxn<DateTimeRange>();

  final activeIndex = 0.obs;

  @override
  void onInit() {
    getDeliveryBillsList();
    super.onInit();
  }

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

  final pagingController = PagingController<DeliveryBill>();

  void getDeliveryBillsList() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    callDataService<ListDeliveryBillResponse>(
      deliveryBillRepo.getListDeliveryBill(
        code: code.value,
        deliveryBillStatus: indexStatus.value.toString(),
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

  void getDeliveryDestroyBillsList() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    callDataService<ListDeliveryBillResponse>(
      deliveryBillRepo.getListDeliveryBill(
        code: code.value,
        deliveryBillStatus: '9',
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

  onRefreshDestroyPage() {
    pagingController.initRefresh();
    listDeliveryBill.clear();
    getDeliveryDestroyBillsList();
  }

  onLoadNextDestroyPage() {
    logger.i("On load next");
    getDeliveryDestroyBillsList();
  }
}

String formatPeriod(DateTime from, DateTime to) {
  final dateFormat = DateFormat('dd/MM/yyyy');
  return '${dateFormat.format(from)} - ${dateFormat.format(to)}';
}
