import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/data/model/model/orders.dart';
import 'package:vncss/app/data/model/model/tracking_status_model.dart';
import 'package:vncss/app/data/model/response/list_total_status.dart';
import 'package:vncss/app/data/repository/total_status_repository.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../core/enum/orders_status.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/transaction.dart';
import '../../../../data/model/response/list_order_response.dart';
import '../../../../data/model/response/transaction_response.dart';
import '../../../../data/repository/order_repository.dart';
import '../../../../data/repository/transaction_reposioty.dart';
import '../../../tracking/tracking_screen/controller/tracking_controller.dart';
import 'order_status_controller.dart';

class ListOrdersController extends BaseController{
  final orderRepo = Get.find<OrderRepository>();
  final listCustomerName = <TransactionName>[].obs;
  final transactionRepo = Get.find<TransactionsRepository>();
  final listTrackingController = Get.find<TrackingController>();
  final listOrder = <Orders>[].obs;
  TextEditingController customerController = TextEditingController();
  TextEditingController trackingCode = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController note = TextEditingController();
  final idTrackingType = "".obs;

  String? startDate, endDate;
  final Rxn<OrderStatus> orderStatus = Rxn<OrderStatus>();
  Rxn<String> fromDateChoose = Rxn<String>();
  Rxn<String> toDateChoose = Rxn<String>();
  final idCustomer = 0.obs;
  final types= Rxn<String>();

  TextEditingController codeFilter = TextEditingController();
  TextEditingController trackingFilter = TextEditingController();
  final idCustomerFilter = "".obs;
  TextEditingController customerFilter = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController dateFilter = TextEditingController();

  final filterDateBy = "Thời gian nhập hàng".obs;


  var exploitStatus = 0.obs;
  final pagingOrderController = PagingController<Orders>();
  var indexStatus = 0.obs;
  var currentIndex = 0.obs;

  final warehouse = ''.obs;

  var isLoading = false.obs;

  final tittle = [
    "Tất cả",
    "Chờ nhập kho US",
    "Đã nhập kho US",
    "Đang vận chuyển về VN",
    "Đã nhập kho VN",
    "Đã khai thác",
    "Đã đóng hàng",
    "Đang giao hàng",
    "Hoàn thành",
    "Đã hủy bỏ"
  ];

  List<String> items = ["Thời gian nhập hàng", "Thời gian xuất hàng", "Thời gian đóng hàng", "Thời gian đến"];

  String getfilterDateBy(String date){
    switch(date){
      case "Thời gian nhập hàng":
        return "import_date";
      case "Thời gian đóng hàng":
        return "packed_date";
      case "Thời gian xuất hàng":
        return "export_date";
      case "Thời gian đến":
        return "arrival_date";
    }
    return "import_date";
  }

  void changeStatusTracking(int newValue) {
    indexStatus.value = newValue;
  }

  void onTapStatus(int index) {
    currentIndex.value = index;
    exploitStatus.value = index;
    changeStatusTracking(exploitStatus.value);
    onRefreshPage();
  }

  clear(){
    productName.clear();
    idCustomer.value = 0;
    trackingCode.text = "";
    note.text = "";
    date.clear();
    fromDateChoose.value = "";
    toDateChoose.value = "";
  }

  clearFilter(){
    idCustomerFilter.value = "";
    dateFilter.clear();
    codeFilter.clear();
    trackingFilter.clear();
    fromDateChoose.value = "";
    toDateChoose.value = "";
    customerFilter.clear();
    filterDateBy.value = "Thời gian nhập hàng";
  }

  createOrder(){
    bool isAvailable = listTrackingController.listTracking.any((item) => item.code == trackingCode.text.toLowerCase());
    !isAvailable
        ? callDataService(
        orderRepo.createOrder(payload: {
          "customer_id": idCustomer.value == 0 ? "" : idCustomer.value,
          "note": note.text,
          "product_name": productName.text,
          "tracking_code": trackingCode.text,
          "tracking_type": idTrackingType.value,
        }), onSuccess: (_) {
      AppSnackBar.showUpdateSuccess(message: "Tạo đơn hàng thành công");
      Future.delayed(Duration(milliseconds: 500),(){
        Get.back(result: true);
      });
      clear();
    })
        : AppSnackBar.showError(message: "Mã tracking đã tồn tại");
  }

  void getCustomerName(
      {String? keyword,}) {
    callDataService<TransactionNameResponse>(
      transactionRepo.getTransactionName(
          keyword: keyword == "" ? "": keyword),
      onSuccess: (data) {
        listCustomerName.value = data.transactionName ?? [];
      },
    );
  }

  onSelected() {
    pagingOrderController.initRefresh();
    listOrder.clear();
    getOrdersList(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        customer: idCustomerFilter.value,
        trackingCode: trackingFilter.text,
        code: codeFilter.text,
      filterDateBy: getfilterDateBy(filterDateBy.value)
    );
    Get.back();
    clearFilter();
  }

  void getOrdersList({
        String? fromDateRx,
        String? toDateRx,
        String? customer,
        String? code,
        String? trackingCode,
        String? filterDateBy,
    String? warehouse_id
    }) {
    if (!pagingOrderController.canLoadNextPage()) return;
    pagingOrderController.isLoadingPage = true;
    callDataService<ListOrderResponse>(
      orderRepo.getListOrder(
        code: code == "" ? "" : code,
        trackingCode: trackingCode,
        exploitStatus: exploitStatus.toInt(),
        fromDate: fromDateRx ?? "",
        toDate: toDateRx ?? "",
        customer: customer ?? "",
        page: pagingOrderController.pageNumber,
        pageSize: 20,
          filterDateBy: filterDateBy ?? "",
          warehouse_id: warehouse_id ?? ""
      ),
      onSuccess: (data) {
        final repoList = data.order ?? [];
        if (_isLastOrderPage(repoList.length, data.meta!.total!)) {
          pagingOrderController.appendLastPage(repoList.cast<Orders>());
        } else {
          pagingOrderController.appendPage(repoList.cast<Orders>());
        }
        var newList = [...pagingOrderController.listItems];
        listOrder.value = newList;
      },
    );

    pagingOrderController.isLoadingPage = false;
  }

  bool _isLastOrderPage(int newListItemCount, int totalCount) {
    return (listOrder.length + newListItemCount) >= totalCount;
  }

  onRefreshPage(){
    pagingOrderController.initRefresh();
    listOrder.clear();
    getOrdersList(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        customer: idCustomerFilter.value,
        code: codeFilter.text,
        trackingCode: trackingFilter.text,
        filterDateBy: getfilterDateBy(filterDateBy.value),
      warehouse_id: warehouse.value
    );
    getCustomerName();
  }

  onLoadNextPage(){
    logger.i("On load next");
    getOrdersList(
      fromDateRx: fromDateChoose.value,
      toDateRx: toDateChoose.value,
      customer: idCustomerFilter.value,
      code: codeFilter.text,
      trackingCode: trackingFilter.text,
        filterDateBy: getfilterDateBy(filterDateBy.value),
        warehouse_id: warehouse.value
    );
  }
  var isGettingOrder = true.obs;
  final pagingOrderControllers = PagingController<TrackingStatusModel>();
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
          pageSize: pagingOrderControllers.pageNumber,
          code: codeFilter.text,
          trackingCode: trackingFilter.text,
          fromDate: fromDateChoose.value,
          toDate: toDateChoose.value,
          filterDateBy: getfilterDateBy(filterDateBy.value),
          exploitStatus: exploitStatus.value.toInt(),
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
  void onInit(){
    getCustomerName();
    getOrdersList(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        customer: idCustomerFilter.value,
        code: codeFilter.text,
        trackingCode: trackingFilter.text,
        filterDateBy: getfilterDateBy(filterDateBy.value),
        warehouse_id: warehouse.value
    );
    getListValueStatus();
    super.onInit();
  }
}