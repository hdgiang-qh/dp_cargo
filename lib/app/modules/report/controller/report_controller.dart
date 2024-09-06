import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/enum/tracking_report_build.dart';
import 'package:vncss/app/data/service/auth_service.dart';

import '../../../data/model/model/report_detail_model.dart';
import '../../../data/model/model/warehouse.dart';
import '../../../data/model/model/report_model.dart';
import '../../../data/model/response/report_response.dart';
import '../../../data/repository/report_repository.dart';
import '../../main/controllers/main_controller.dart';

class TrackingData {
  TrackingData(this.day, this.value);

  final String day;
  final int value;
}

class ReportController extends BaseController {
  final pagingController = PagingController<Exploitation>();
  final pagingControllerWh = PagingController<WareHouseModel>();
  final pagingControllerAwb = PagingController<Awb>();
  final pagingControllerBillCustom = PagingController<BillCustomModel>();
  final pagingControllerBillSale = PagingController<BillSaleModel>();
  final scrollController = ScrollController();
  final controllerMain = Get.find<MainController>();
  WareHouse? wareHouse;
  ExploitationEmployee? exploitationEmployee;
  final AuthService authService = Get.find();
  TextEditingController wh = TextEditingController();
  TextEditingController nameStaff = TextEditingController();
  final nameWh = Rxn<String>();

  final reportRepo = Get.find<ReportRepository>();

  final listReportWarehouse = <WareHouseModel>[].obs;

  final listBillSale = <BillSaleModel>[].obs;
  final listBillSaleDetailTracking =
      <ReportDetailModelStatisticByDeliveryBillTracking>[].obs;
  final listBillCustom = <BillCustomModel>[].obs;
  final listWareHouse = <WareHouse>[].obs;
  final listChartValue = ReportChartModel().obs;
  final listExploitation = <Exploitation>[].obs;
  final listExploitationEmployee = <ExploitationEmployee>[].obs;
  final listAwb = <Awb>[].obs;

  List<int?> listValue = [];
  List<String> listDay = [
    "2-4",
    "5-6",
    "7-8",
    "9-10",
    "11-12",
    "13-14",
    "15-16",
    "17-18",
    "19-20",
    "20+"
  ];

  List<TrackingData> get data {
    List<TrackingData> data = [];
    for (int i = 0; i < listDay.length; i++) {
      int? sales = listValue.length > i ? listValue[i] : null;
      data.add(TrackingData(listDay[i], sales ?? 0));
    }
    return data;
  }

  var isLoading = false.obs;
  TextEditingController date = TextEditingController();
  DateTime toDate = DateTime.now().toUtc();
  DateTime fromDate =
      DateTime(DateTime.now().year, DateTime.now().month, 1, 0).toUtc();

  var indexReport = 0.obs;
  var orderBy = "".obs;
  var valueChart = 0.obs;
  var warehouseId = "".obs;
  var employeeId = "".obs;
  var idDetail = "".obs;
  final listEmployee = [].obs;
  Rxn<DateTime> fromDateChoose = Rxn<DateTime>();
  Rxn<DateTime> toDateChoose = Rxn<DateTime>();

  DateTimeRange? selectedDates;
  String? startDate, endDate;

  void onTapCustom() {
    indexReport.value = 1;
    getListReportBillCustom();
  }

  void onTapSale() {
    indexReport.value = 0;
    getListReportBillSale();
  }

  void setValue({required int index}) {
    valueChart.value = listChartValue.value.trackingDate?[index] ?? 0;
  }

  String reportTitle({required int index}) {
    var value = "".obs;
    switch (index) {
      case 0:
        value.value = "Kho khai thác";
      case 1:
        value.value = "Phiếu xuất kho";
      case 2:
        value.value = "AWB";
      case 3:
        value.value = "Thống kê";
      case 4:
        value.value = "Thống kê khai thác";
    }
    return value.value;
  }

  int buildLength({required int index, required int indexDelivery}) {
    if (index == 0) {
      return listReportWarehouse.length;
    } else if (index == 1) {
      if (indexDelivery == 0) {
        return listBillSale.length;
      } else {
        return listBillCustom.length;
      }
    } else if (index == 2) {
      return listAwb.length;
    } else if (index == 3) {
      return 1;
    } else {
      return listExploitation.length;
    }
  }

  void getListReportWarehouse(
      {DateTime? fromDateRx, DateTime? toDateRx, String? idWarehouse}) {
    pagingControllerWh.isLoadingPage = true;
    callDataService<WarehouseResponse>(
      reportRepo.getListReportWarehouse(
          fromDate: fromDateRx == null
              ? fromDate.toIso8601String()
              : fromDateChoose.value?.toUtc().toIso8601String(),
          toDate: toDateRx == null
              ? toDate.toIso8601String()
              : toDateChoose.value?.toUtc().toIso8601String(),
          warehouseId: controllerMain.warehouseId == 0
              ? idWarehouse == "0"
                  ? null
                  : idWarehouse
              : controllerMain.warehouseId.toString(),
          warehouseIds: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        isLoading.value = true;
        listReportWarehouse.value = data.listWarehouse!;
      },
    );
    pagingControllerWh.isLoadingPage = false;
  }

  // danh sach kho
  void getListWarehouse() {
    callDataService<ListWarehouseResponse>(
      reportRepo.getListWarehouse(
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        isLoading.value = true;
        listWareHouse.value = data.listWarehouse!;
        listWareHouse.insert(
            0,
            WareHouse(
                id: 0,
                createdAt: "",
                createdById: null,
                name: "Tất cả",
                updatedAt: "",
                updatedById: null));
      },
    );
  }

  var selectedWareHouse = Rx<WareHouse?>(null);

  var trackingReportBill = Rx<TrackingReportBill?>(null);

  void updateWareHouse(WareHouse? newWareHouse) {
    selectedWareHouse.value = newWareHouse;
    warehouseId.value = selectedWareHouse.value?.id.toString() ?? "";
  }

  void updateTrackingReportBill(TrackingReportBill? newStatus) {
    trackingReportBill.value = newStatus;
    orderBy.value = trackingReportBill.value?.valueText ?? "";
  }

  void getListReportBillSale(
      {DateTime? fromDateRx,
      DateTime? toDateRx,
      String? idWarehouse,
      String? ordersBy}) {
    callDataService<BillSaleResponse>(
      reportRepo.getListReportBillSale(
          page: pagingControllerBillSale.pageNumber,
          pageSize: 10,
          orderBy: ordersBy == "" ? orderBy.value : ordersBy,
          fromDate: fromDateRx == null
              ? fromDate.toUtc().toIso8601String()
              : fromDateChoose.value?.toUtc().toIso8601String(),
          toDate: toDateRx == null
              ? toDate.toUtc().toIso8601String()
              : toDateChoose.value?.toUtc().toIso8601String(),
          warehouseId: controllerMain.warehouseId == 0
              ? idWarehouse == "0"
                  ? null
                  : idWarehouse
              : controllerMain.warehouseId.toString(),
          warehouseIds: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        isLoading.value = true;
        final repoList = data.listBillSale ?? [];
        if (_isLastPageBillSale(repoList.length, data.pagination!.total!)) {
          pagingControllerBillSale.appendLastPage(repoList);
        } else {
          pagingControllerBillSale.appendPage(repoList);
        }
        var newList = [...pagingControllerBillSale.listItems];
        listBillSale.value = newList;
      },
    );
  }

  bool _isLastPageBillSale(int newListItemCount, int totalCount) {
    return (listBillSale.length) >= newListItemCount + totalCount;
  }

  void getListReportBillCustom(
      {DateTime? fromDateRx,
      DateTime? toDateRx,
      String? idWarehouse,
      String? ordersBy}) {
    callDataService<BillCustomResponse>(
      reportRepo.getListReportBillCustom(
          page: pagingControllerBillCustom.pageNumber,
          pageSize: 10,
          orderBy: ordersBy == "" ? orderBy.value : ordersBy,
          fromDate: fromDateRx == null
              ? fromDate.toIso8601String()
              : fromDateChoose.value?.toUtc().toIso8601String(),
          toDate: toDateRx == null
              ? toDate.toIso8601String()
              : toDateChoose.value?.toUtc().toIso8601String(),
          warehouseId: controllerMain.warehouseId == 0
              ? idWarehouse == "0"
                  ? null
                  : idWarehouse
              : controllerMain.warehouseId.toString(),
          warehouseIds: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        isLoading.value = true;
        final repoList = data.listBillCustom ?? [];
        if (_isLastPageBillCustom(repoList.length, data.pagination!.total!)) {
          pagingControllerBillCustom.appendLastPage(repoList);
        } else {
          pagingControllerBillCustom.appendPage(repoList);
        }
        var newList = [...pagingControllerBillCustom.listItems];
        listBillCustom.value = newList;
      },
    );
  }

  bool _isLastPageBillCustom(int newListItemCount, int totalCount) {
    return (listBillCustom.length) >= newListItemCount + totalCount;
  }

  void getListChartValue({DateTime? fromDateRx, DateTime? toDateRx}) {
    callDataService<ChartResponse>(
      reportRepo.getChartValue(
        fromDate: fromDateRx == null
            ? fromDate.toIso8601String()
            : fromDateChoose.value?.toUtc().toIso8601String(),
        toDate: toDateRx == null
            ? toDate.toIso8601String()
            : toDateChoose.value?.toUtc().toIso8601String(),
      ),
      onSuccess: (data) {
        isLoading.value = true;
        listChartValue.value = data.listChartValue!;
        listValue = data.listChartValue?.trackingDate ?? <int>[];
      },
    );
  }

  void getListExploitation(
      {DateTime? fromDateRx, DateTime? toDateRx, String? employee}) {
    if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;
    callDataService<ExploitationResponse>(
      reportRepo.getExploitation(
          page: pagingController.pageNumber,
          pageSize: 10,
          fromDate: fromDateRx == null
              ? ""
              : fromDateChoose.value?.toUtc().toIso8601String(),
          toDate: toDateRx == null
              ? ""
              : toDateChoose.value?.toUtc().toIso8601String(),
          employeeId: employee == "" ? "" : employee),
      onSuccess: (data) {
        isLoading.value = true;
        final repoList = data.listExploitation ?? [];
        if (_isLastPage(repoList.length, data.pagination!.total!)) {
          pagingController.appendLastPage(repoList);
        } else {
          pagingController.appendPage(repoList);
        }
        var newList = [...pagingController.listItems];
        listExploitation.value = newList;
      },
    );
    pagingController.isLoadingPage = false;
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (listExploitation.length) >= newListItemCount + totalCount;
  }

  void getListExploitationEmployee() {
    callDataService<ExploitationEmployeeResponse>(
      reportRepo.getExploitationEmployee(),
      onSuccess: (data) {
        isLoading.value = true;
        listExploitationEmployee.value = data.listExploitationEmployee!;
      },
    );
  }

  void getListAwb(
      {DateTime? fromDateRx, DateTime? toDateRx, String? idWarehouse}) {
    if (!pagingControllerAwb.canLoadNextPage()) return;
    pagingControllerAwb.isLoadingPage = true;
    callDataService<AwbResponse>(
        reportRepo.getAwb(
            page: pagingControllerAwb.pageNumber,
            pageSize: 10,
            fromDate: fromDateRx == null
                ? fromDate.toUtc().toIso8601String()
                : fromDateChoose.value?.toUtc().toIso8601String(),
            toDate: toDateRx == null
                ? toDate.toUtc().toIso8601String()
                : toDateChoose.value?.toUtc().toIso8601String(),
            warehouseId: idWarehouse == "0" ? null : idWarehouse),
        onSuccess: (data) {
      isLoading.value = true;
      final repoList = data.listAwb ?? [];
      if (_isLastPageAwb(repoList.length, data.pagination!.total!)) {
        pagingControllerAwb.appendLastPage(repoList);
      } else {
        pagingControllerAwb.appendPage(repoList);
      }
      var newList = [...pagingControllerAwb.listItems];
      listAwb.value = newList;
    }, onError: (error) {
      print(error);
    });
    pagingControllerAwb.isLoadingPage = false;
  }

  bool _isLastPageAwb(int newListItemCount, int totalCount) {
    return (listAwb.length) >= newListItemCount + totalCount;
  }

  onRefreshPage() {
    pagingControllerWh.initRefresh();
    listReportWarehouse.clear();
    getListReportWarehouse();

    pagingControllerBillSale.initRefresh();
    listBillSale.clear();
    getListReportBillSale();

    pagingControllerBillCustom.initRefresh();
    listBillCustom.clear();
    getListReportBillCustom();
    getListChartValue();

    pagingController.initRefresh();
    listExploitation.clear();
    getListExploitation();

    pagingControllerAwb.initRefresh();
    listAwb.clear();
    getListAwb();
  }

  onSelected() {
    pagingControllerAwb.initRefresh();
    listAwb.clear();
    getListAwb(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        idWarehouse: warehouseId.value);
    getListChartValue(
        fromDateRx: fromDateChoose.value, toDateRx: toDateChoose.value);

    pagingControllerWh.initRefresh();
    listReportWarehouse.clear();
    getListReportWarehouse(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        idWarehouse: warehouseId.value);

    pagingController.initRefresh();
    listExploitation.clear();
    getListExploitation(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        employee: employeeId.value);

    pagingControllerBillSale.initRefresh();
    listBillSale.clear();
    getListReportBillSale(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        idWarehouse: warehouseId.value,
        ordersBy: orderBy.value);

    pagingControllerBillCustom.initRefresh();
    listBillCustom.clear();
    getListReportBillCustom(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        idWarehouse: warehouseId.value,
        ordersBy: orderBy.value);
  }

  onSelectedV() {
    listAwb.clear();
    getListAwb(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        idWarehouse: warehouseId.value);
    getListChartValue(
        fromDateRx: fromDateChoose.value, toDateRx: toDateChoose.value);

    listReportWarehouse.clear();
    getListReportWarehouse(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        idWarehouse: warehouseId.value);

    listExploitation.clear();
    getListExploitation(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        employee: employeeId.value);

    listBillSale.clear();
    getListReportBillSale(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        idWarehouse: warehouseId.value,
        ordersBy: orderBy.value);

    listBillCustom.clear();
    getListReportBillCustom(
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        idWarehouse: warehouseId.value,
        ordersBy: orderBy.value);
  }

  onClearValue() {
    date.clear();
    nameStaff.clear();
    fromDateChoose.value = null;
    toDateChoose.value = null;
    selectedWareHouse.value = null;
    warehouseId.value = selectedWareHouse.value?.id.toString() ?? "";
    employeeId.value = "";
    wareHouse = null;
    exploitationEmployee = null;
    trackingReportBill.value = null;
    orderBy.value = trackingReportBill.value?.valueText ?? "";
    onRefreshPage();
  }

  onLoadNextPage() {
    logger.i("On load next");
    getListReportWarehouse(
        fromDateRx: fromDateChoose.value, toDateRx: toDateChoose.value);
    getListExploitation(
        fromDateRx: fromDateChoose.value, toDateRx: toDateChoose.value);
    getListAwb(fromDateRx: fromDateChoose.value, toDateRx: toDateChoose.value);
    getListReportBillCustom(
        fromDateRx: fromDateChoose.value, toDateRx: toDateChoose.value);
    getListReportBillSale(
        fromDateRx: fromDateChoose.value, toDateRx: toDateChoose.value);
  }

  @override
  void onInit() {
    if (authService.userInfo.value?.role?.id == 1 ||
        authService.userInfo.value?.role?.id == 7) {
      getListReportWarehouse();
      getListReportBillSale();
      getListReportBillCustom();
      getListWarehouse();
      getListChartValue();
      getListExploitation();
      getListExploitationEmployee();
      getListAwb();
    } else{
      return;
    }

    super.onInit();
  }
}
