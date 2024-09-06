import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/tracking/tracking_screen/controller/tracking_status_controller.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/base/paging_controller.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/tracking.dart';
import '../../../../data/model/model/tracking_bill.dart';
import '../../../../data/model/model/tracking_type.dart';
import '../../../../data/model/model/transaction.dart';
import '../../../../data/model/response/list_trackings_response.dart';
import '../../../../data/model/response/transaction_response.dart';
import '../../../../data/repository/tracking_repository.dart';
import '../../../../data/repository/transaction_reposioty.dart';


class TrackingController extends BaseController {
  final pagingController = PagingController<Trackings>();
  final scrollController = ScrollController();

  String? startDate, endDate;

  DateTimeRange? selectedDates;


  var exploitStatus = 0.obs;
  final listCustomerName = <TransactionName>[].obs;
  final transactionRepo = Get.find<TransactionsRepository>();
  final trackingRepo = Get.find<TrackingsRepository>();

  final listTracking = <Trackings>[].obs;

  final Rxn<DateTimeRange> dateFilter = Rxn<DateTimeRange>();
  Rxn<String> fromDateChoose = Rxn<String>();
  Rxn<String> toDateChoose = Rxn<String>();

  final idCustomer = 0.obs;
  TextEditingController codeTrackingFilter = TextEditingController();
  TextEditingController customerFilter = TextEditingController();
  TextEditingController date = TextEditingController();
  final FilterDateBy = "Thời gian nhập hàng".obs;

  TextEditingController customerController = TextEditingController();
  TextEditingController codeTracking = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  final idCustomerFilter = "".obs;

  var isLoading = false.obs;

  final isLinkDetected = false.obs;
  var indexStatus = 0.obs;
  var currentIndex = 0.obs;
  var warehouse = "".obs;
  var undefinedCustomer = false.obs;
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
  List<String> items = ["Thời gian nhập hàng", "Thời gian xuất hàng", "Thời gian đóng hàng"];

  String getfilterDateBy(String date){
    switch(date){
      case "Thời gian nhập hàng":
        return "import_date";
      case "Thời gian đóng hàng":
        return "packed_date";
      case "Thời gian xuất hàng":
        return "export_date";
    }
    return "import_date";
  }

  void checkForLink(String? text) {
    final linkPattern = RegExp(r'https?:\/\/|\.');

    isLinkDetected.value = linkPattern.hasMatch(text!);

    if (isLinkDetected.value) {
      AppSnackBar.showError(message: 'Đường link không được phép nhập vào.');
    }
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  deleteTracking(int? id) {
    callDataService(
        trackingRepo.deleteTracking(id: id), onSuccess: (_) {
      AppSnackBar.showUpdateSuccess(message: "Xóa tracking thành công");
    });
  }

  createTracking() {
    bool isValid = listCustomerName
        .any((item) =>"${item.nickName} | ${item.idCustomer} | ${item.name}" == customerController.text);
   !isValid
        ? AppSnackBar.showError(message: "Tên khách hàng không tồn tại")
        : !isNumeric(price.text == "" ? "0" : price.text)
        ? AppSnackBar.showError(message: "Giá trị hàng hoá không được chưa ký tự ngoài số")
        : callDataService(
        trackingRepo.createTracking(createFields:[ {
          "code": codeTracking.text,
          "customer": idCustomer.value == 0 ? "" : idCustomer.value,
          "price": price.text == "" ? 0 : price.text,
          "description": description.text,
        }]), onSuccess: (_) async {
      AppSnackBar.showUpdateSuccess(message: "Tạo tracking thành công");
      await Future.delayed(Duration(milliseconds: 500),(){
        Get.back(result: true);
        clear();
      });
    });
  }


  clear(){
    codeTracking.clear();
    customerController.clear();
    idCustomer.value = 0;
    price.clear();
    description.clear();
  }

  syncTracking() {
    callDataService(
        trackingRepo.syncTracking(), onSuccess: (_) async{
      AppSnackBar.showUpdateSuccess(message: "Đã gửi dữ liệu đồng bộ tracking");
      await Future.delayed(Duration(seconds: 3),(){
        onRefreshPage();
        AppSnackBar.showUpdateSuccess(message: "Đã thực hiện đồng bộ tracking thành công");
      });
    });
  }
  void onSubmit() {
    List<Map<String, dynamic>> payload = [
      {
        "code": codeTracking.text,
        "customer": idCustomer.value == 0 ? "" : idCustomer.value,
        "price": int.tryParse(price.text) ?? 0,
        "description": description.text ?? "",
      }
    ];
    createTracking();
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

  void changeStatusTracking(int newValue) {
    indexStatus.value = newValue;
  }

  void onTapStatus(int index) {
    currentIndex.value = index;
    exploitStatus.value = index;
    changeStatusTracking(exploitStatus.value);
    pagingController.initRefresh();
    onSelected();
  }


  void getTrackingList(
  {
    String? status,
    String? fromDateRx,
    String? toDateRx,
    String? customer,
    String? code,
    bool? undefinedCustomer,
    String? filterDateBy,
    String? warehouse_id
  }) {
    if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;
    callDataService<ListTrackingsResponse>(
      trackingRepo.getListTracking(
        exploitStatus: status,
        code: code == "" ? "" : code,
        page: pagingController.pageNumber,
        pageSize: 10,
        fromDate: fromDateRx ?? "",
        toDate: toDateRx ?? "",
        customer: customer == "" ? "" : customer,
          undefinedCustomer: undefinedCustomer == false ? false : undefinedCustomer,
          filterDateBy: filterDateBy ?? "import_date",
          warehouse_id: warehouse_id ?? ""
      ),
      onSuccess: (data) {
        final repoList = data.trackings ?? [];
        if (_isLastPage(repoList.length, data.meta!.total!)) {
          pagingController.appendLastPage(repoList.cast<Trackings>());
        } else {
          pagingController.appendPage(repoList.cast<Trackings>());
        }
        var newList = [...pagingController.listItems];
        listTracking.value = newList;
      },
    );
    pagingController.isLoadingPage = false;
  }


  bool _isLastPage(int newListItemCount, int totalCount) {
    return (listTracking.length) >= totalCount;
  }

  onSelected() {
    pagingController.initRefresh();
    listTracking.clear();
    getTrackingList(
        status: indexStatus.toString(),
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        customer: idCustomerFilter.value,
        code: codeTrackingFilter.text,
        undefinedCustomer: undefinedCustomer.value,
        filterDateBy: getfilterDateBy(FilterDateBy.value),
        warehouse_id: warehouse.value
    );
  }

  clearFilter(){
    codeTrackingFilter.clear();
    FilterDateBy.value = "Thời gian nhập hàng";
    date.clear();
    idCustomerFilter.value = "";
    customerFilter.clear();
    undefinedCustomer.value = false;
    fromDateChoose.value = "";
    toDateChoose.value = "";
  }

  onRefreshPage() {
    clearFilter();
    pagingController.initRefresh();
    listTracking.clear();
    getTrackingList(
        status: indexStatus.toString(),
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        customer: idCustomerFilter.value,
        code: codeTrackingFilter.text,
        undefinedCustomer: undefinedCustomer.value,
        filterDateBy: getfilterDateBy(FilterDateBy.value),
        warehouse_id: warehouse.value
    );
    listCustomerName.clear();
    getCustomerName();
  }

  onLoadNextPage() {
    logger.i("On load next");
    getTrackingList(
        status: indexStatus.toString(),
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        customer: idCustomerFilter.value,
        code: codeTrackingFilter.text,
        undefinedCustomer: undefinedCustomer.value,
        filterDateBy: getfilterDateBy(FilterDateBy.value),
        warehouse_id: warehouse.value
    );
  }

  @override
  void onInit() {
    getTrackingList();
    getCustomerName();
    super.onInit();
  }
}

class TrackingTypeController extends BaseController{
  final listTrackingType = <TrackingsType>[].obs;
  final trackingRepo = Get.find<TrackingsRepository>();

  void getTrackingType() {
    callDataService<ListTrackingTypeResponse>(
        trackingRepo.getTrackingType(),
        onSuccess: (data) {
          listTrackingType.value = data.listTrackingType ?? [];
        },
        onError: (error) {
          showErrorMessage(error.toString());
        });
  }

  @override
  void onInit() {
    getTrackingType();
    super.onInit();
  }

}

