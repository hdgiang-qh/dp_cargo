import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../data/model/model/delivery_bill.dart';
import '../../../../data/model/response/list_delivery_bill.dart';
import '../../../../data/repository/delivery_bill_repository.dart';

class ListDeliveryBillsDestroyController extends BaseController {
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final listDeliveryBill = <DeliveryBill>[].obs;
  final deliveryBill = DeliveryBill().obs;
  final code = ''.obs;
  
  final Rxn<DateTimeRange> dateFilter = Rxn<DateTimeRange>();

  final activeIndex = 0.obs;

  @override
  void onInit() {
    getDeliveryDestroyBillsList();
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

  void getDeliveryDestroyBillsList() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    callDataService<ListDeliveryBillResponse>(
      deliveryBillRepo.getListDeliveryBill(
        code: code.value,
        deliveryBillStatus: '6',
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

  onRefreshDestroyPage() {
    pagingController.initRefresh();
    listDeliveryBill.clear();
    getDeliveryDestroyBillsList();
  }

  onLoadNextDestroyPage() {
    logger.i("On load next");
    getDeliveryDestroyBillsList();
  }
//
// Future<void> getDateTime(BuildContext context) async {
//   final themeData = Theme.of(context);
//   dateFilter.value = await showDateRangePicker(
//       builder: (context, child) => Theme(
//           data: themeData.copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: AppColors.primary,
//               onPrimary: Colors.black, // header text color
//               onSurface: AppColors.primary,
//             ),
//           ),
//           child: child!),
//       context: context,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       initialDateRange: DateTimeRange(start: DateTime.now(), end: DateTime.now()));
//   if (dateFilter.value != null) {
//     dateEditController.text = formatPeriod(dateFilter.value!.start, dateFilter.value!.end);
//   }
// }
}

String formatPeriod(DateTime from, DateTime to) {
  final dateFormat = DateFormat('dd/MM/yyyy');
  return '${dateFormat.format(from)} - ${dateFormat.format(to)}';
}
