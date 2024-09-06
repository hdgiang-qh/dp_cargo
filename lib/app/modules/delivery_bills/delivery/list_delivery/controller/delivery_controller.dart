import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/delivery_bill.dart';
import 'package:vncss/app/data/model/response/list_delivery_bill.dart';
import 'package:vncss/app/data/repository/delivery_bill_repository.dart';
import 'package:vncss/app/data/service/auth_service.dart';
import 'package:vncss/app/modules/common_widget/const.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';
import 'package:vncss/app/modules/transaction/controller/transaction_controller.dart';

import '../../../../../data/model/response/list_transaction_response.dart';

class DeliveryController extends BaseController {
  final authService = Get.find<AuthService>();

  final pagingController = PagingController<DeliveryBill>();
  final scrollController = ScrollController();
  final controllerMain = Get.find<MainController>();
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final listDeliveryBill = <DeliveryBill>[].obs;
  final listTotal = <TotalBillModel>[].obs;
  final controllerName = Get.find<TransactionController>();

  final Rxn<DateTimeRange> dateFilter = Rxn<DateTimeRange>();
  Rxn<DateTime> fromDateChoose = Rxn<DateTime>();
  Rxn<DateTime> toDateChoose = Rxn<DateTime>();
  var indexStatus = 0.obs;
  var currentIndex = 0.obs;
  var total = 0.obs;
  var customerName = "".obs;
  var code = ''.obs;
  int warehouseId = 0;

  TextEditingController forCode = TextEditingController();
  TextEditingController forClient = TextEditingController();
  TextEditingController date = TextEditingController();

  final title = [
    'Tất cả',
    'Phiếu tạo mới',
    'Sale đã duyệt',
    'Kế toán duyệt',
    'Yêu cầu xuất kho',
    'Đã đóng hàng',
    'Đang giao hàng',
    "Hoàn thành",
    "Giao không thành công",
    "Đã huỷ bỏ"
  ];

  Color buildColor({required String value}) {
    Color color = Colors.white;
    switch (value) {
      case "Phiếu mới tạo":
        color = ColorApp.orangeF2;
      case "Sale duyệt":
        color = ColorApp.purpleB5;
      case "Kế toán duyệt":
        color = ColorApp.blue70;
      case "Yêu cầu xuất kho":
        color = ColorApp.blue4D;
      case "Đã đóng hàng":
        color = ColorApp.blue36;
      case "Đang giao hàng":
        color = ColorApp.yellowFFC;
      case "Đơn hàng giao không thành công":
        color = primaryColor;
      case "Hoàn thành đơn hàng":
        color = ColorApp.green4C;
      case "Hủy PXK":
        color = ColorApp.blueB5;
    }
    return color;
  }

  Color buildTextColor({required String value}) {
    Color color = Colors.white;
    switch (value) {
      case "Phiếu mới tạo":
        color = ColorApp.orangeF2;
      case "Sale duyệt":
        color = ColorApp.purpleB5;
      case "Kế toán duyệt":
        color = ColorApp.blue70;
      case "Yêu cầu xuất kho":
        color = ColorApp.blue4D;
      case "Đã đóng hàng":
        color = ColorApp.blue36;
      case "Đang giao hàng":
        color = ColorApp.yellowFFC;
      case "Đơn hàng giao không thành công":
        color = primaryColor;
      case "Hoàn thành đơn hàng":
        color = ColorApp.green4C;
      case "Hủy PXK":
        color = ColorApp.blueB5;
    }
    return color;
  }

  final colors = [
    primaryColor,
    ColorApp.orangeF2,
    ColorApp.purpleB5,
    ColorApp.blue70,
    ColorApp.blue4D,
    ColorApp.blue36,
    ColorApp.yellowFFC,
    ColorApp.green4C,
    primaryColor,
    ColorApp.blueB5
  ].obs;

  void changeStatusDelivery(int newValue) {
    indexStatus.value = newValue;
  }

  void onTapStatus(int index) {
    currentIndex.value = index;
    changeStatusDelivery(currentIndex.value);
    onRefreshPage();
  }

  var isLoading = false.obs;

  // danh sách pxk
  void getDeliveryBillsList({
    String? idStatus,
    DateTime? fromDateRx,
    DateTime? toDateRx,
    String? cusName,
    String? codes,
  }) {
    if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;
    callDataService<ListDeliveryBillResponse>(
      deliveryBillRepo.getListDeliveryBill(
          code: codes == "" ? "" : codes,
          deliveryBillStatus: authService.userInfo.value?.role?.id == 1 ||
                  authService.userInfo.value?.role?.id == 7
              ? idStatus
              : "6",
          page: pagingController.pageNumber,
          pageSize: 10,
          fromDate: fromDateRx ?? fromDateChoose.value,
          toDate: toDateRx ?? toDateChoose.value,
          customer: cusName == "" ? "" : cusName,
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        isLoading.value == true;
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
    return (listDeliveryBill.length) >= totalCount;
  }

  // tổng pxh từng trạng thái
  void getTotalDelivery() {
    callDataService<TotalDeliveryBill>(
      deliveryBillRepo.getTotalDelivery(
          page: pagingController.pageNumber,
          pageSize: 10,
          code: code.value,
          btnFilterStatus: 0.toString(),
          deliveryBillStatus: indexStatus.toString(),
          fromDate: fromDateChoose.value,
          toDate: toDateChoose.value,
          customer: customerName.value,
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        listTotal.clear();
        listTotal.value = data.listTotal ?? [];
        listTotal.add(
          TotalBillModel(name: "", total: 0, id: 1),
        );
        total.value = 0;
        for (TotalBillModel bill in listTotal) {
          if (bill.total != null) {
            total.value += bill.total!;
          }
        }
      },
    );
  }

  onClearValue() {
    date.clear();
    forCode.clear();
    forClient.clear();
    fromDateChoose.value = null;
    toDateChoose.value = null;
    code.value = "";
    customerName.value = "";
  }

  //filter
  onSelected() {
    bool isValid = controllerName.listTransactionName.any((item) =>
        "${item.idCustomer?.toLowerCase()} | ${item.nickName?.toLowerCase()} | ${item.name?.toLowerCase()}" ==
        forClient.text.toLowerCase());
    if (date.text.isEmpty && forCode.text.isEmpty && forClient.text.isEmpty) {
      onRefreshPage();
      Get.back();
    } else if (!isValid && forClient.text.isNotEmpty) {
      forClient.clear();
      Get.back();
      AppSnackBar.showIsEmpty(message: "Tên khách hàng không tồn tại");
    } else {
      code.value = forCode.text;
      pagingController.initRefresh();
      listDeliveryBill.clear();
      getDeliveryBillsList(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        idStatus: indexStatus.toString(),
        cusName: customerName.value,
        codes: forCode.text,
      );
      getTotalDelivery();
      Get.back();
    }
  }

  onRefreshPage() {
    pagingController.initRefresh();
    listDeliveryBill.clear();
    getDeliveryBillsList(
      fromDateRx: fromDateChoose.value,
      toDateRx: toDateChoose.value,
      idStatus: indexStatus.toString(),
      cusName: customerName.value,
      codes: code.value,
    );
    getTotalDelivery();
  }

  onRefreshPageValue() {
    pagingController.initRefresh();
    listDeliveryBill.clear();
    getDeliveryBillsList(
      fromDateRx: fromDateChoose.value,
      toDateRx: toDateChoose.value,
      idStatus: indexStatus.toString(),
      cusName: customerName.value,
      codes: code.value,
    );
    getTotalDelivery();
  }

  onLoadNextPage() {
    // logger.i("On load next");
    getDeliveryBillsList(
      fromDateRx: fromDateChoose.value,
      toDateRx: toDateChoose.value,
      idStatus: indexStatus.toString(),
      cusName: customerName.value,
      codes: code.value,
    );
  }

  @override
  void onInit() {
    getDeliveryBillsList(
      idStatus: indexStatus.toString(),
    );
    getTotalDelivery();
    super.onInit();
  }
}
