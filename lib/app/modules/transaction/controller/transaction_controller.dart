import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:vncss/app/data/repository/authentication_repository.dart';
import 'package:vncss/app/data/service/auth_service.dart';

import '../../../core/base/base_controller.dart';
import '../../../core/base/paging_controller.dart';
import '../../../core/enum/transaction_status.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../../data/model/model/transaction.dart';
import '../../../data/model/response/transaction_response.dart';
import '../../../data/repository/transaction_reposioty.dart';
import '../../common_widget/const.dart';
import '../../main/controllers/main_controller.dart';

class TransactionController extends BaseController {
  final pagingController = PagingController<Transactions>();
  final transactionRepo = Get.find<TransactionsRepository>();
  final scrollController = ScrollController();
  final listTransaction = <Transactions>[].obs;
  final listTransactionName = <TransactionName>[].obs;
  final listBank = <BankModel>[].obs;
  final listBankModelConfigValueConfig = <BankModelConfigValueConfig>[].obs;
  final listNewBank = <BankList>[].obs;
  String? startDate, endDate;
  DateTimeRange? selectedDates;
  final AuthService authService = Get.find();

  final controllerMain = Get.find<MainController>();

  Rxn<String> fromDateChoose = Rxn<String>();
  Rxn<String> toDateChoose = Rxn<String>();

  TextEditingController date = TextEditingController();
  TextEditingController values = TextEditingController();

  TextEditingController name = TextEditingController();
  final idName = Rxn<int>();
  TextEditingController money = TextEditingController();
  TextEditingController typeTrans = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController bank = TextEditingController();

  var actionStatuses = Rx<ActionStatuses?>(null);
  var transactionStatusesUpper2 = Rx<TransactionStatusesUpper2?>(null);
  final AuthenticationRepository authenticationRepository = Get.find();

  void updateActionStatus(ActionStatuses? newStatus) {
    if (newStatus != null) {
      actionStatuses.value = newStatus;
      status = newStatus.value;
    }
  }

  String statusAction({required String values}) {
    final status = "--".obs;
    switch (values) {
      case "hủy":
        status.value = "Huỷ";
      case "hoàn thành":
        status.value = "Hoàn thành";
      case "chờ duyệt":
        status.value = "Chờ duyệt";
    }
    return status.value;
  }

  var indexStatus = 0.obs;
  var currentIndex = 0.obs;
  var method = "".obs;
  var status = "";
  final type = Rxn<String>();
  var customerId = "";
  String? bankName;
  String? accNumber;
  String? accName;
  String? bankBranch;
  int? idBank;

  void changeStatusFilter(int newValue) {
    indexStatus.value = newValue;
  }

  List<String> methods = [
    "Tất cả",
    "Thanh toán",
    "Nạp tiền",
    "Hoàn tiền",
    "Rút tiền"
  ];

  List<Color> colorMethod = [
    primaryColor,
    ColorApp.blue00,
    ColorApp.orangeF2,
    ColorApp.green23,
    ColorApp.red75,
  ];

  void onTapStatus(int index, String filter) {
    currentIndex.value = index;
    method.value = filter;
    changeStatusFilter(currentIndex.value);
   onRefreshPage();
  }
  void onTapStatusV(int index, String filter) {
    currentIndex.value = index;
    method.value = filter;
    changeStatusFilter(currentIndex.value);
    onSelected();
  }

  String? filterStatus({required String filters}) {
    final filter = "".obs;
    switch (filters) {
      case "Tất cả":
        filter.value = "";
      case "Thanh toán":
        filter.value = TransactionStatusesUpper.pay.value;
      case "Nạp tiền":
        filter.value = TransactionStatusesUpper.recharge.value;
      case "Hoàn tiền":
        filter.value = TransactionStatusesUpper.refund.value;
      case "Rút tiền":
        filter.value = TransactionStatusesUpper.withdrawMoney.value;
    }
    return filter.value;
  }

  var isLoading = false.obs;

  getTransactionList(
      {String? fromDateRx,
        String? toDateRx,
        String? type,
        String? customId,
        String? statusValue}) async {
    // if (!pagingController.canLoadNextPage()) return;
    pagingController.isLoadingPage = true;
    callDataService<TransactionResponse>(
      transactionRepo.getListTransactions(
          page: pagingController.pageNumber,
          pageSize: 10,
          type: type == "" ? "" : type,
          fromDate: fromDateRx ?? "",
          toDate: toDateRx ?? "",
          customerId: customId == "" ? null : customId,
          status: statusValue == "" ? null : statusValue,
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        final repoList = data.transaction ?? [];
        if (_isLastPage(repoList.length, data.paginations!.total!)) {
          pagingController.appendLastPage(repoList);
        } else {
          pagingController.appendPage(repoList);
        }
        var newList = [...pagingController.listItems];
        listTransaction.value = newList;
      },
    );

    pagingController.isLoadingPage = false;
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (listTransaction.length) >= totalCount;
  }

  void getTransactionName() {
    callDataService<TransactionNameResponse>(
      transactionRepo.getTransactionName(
          keyword: "",
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        listTransactionName.value = data.transactionName ?? [];
      },
    );
  }

  checkEmptyValue() {
    bool isValid = listTransactionName.any((item) =>
        "${item.idCustomer?.toLowerCase()} | ${item.nickName?.toLowerCase()} | ${item.name?.toLowerCase()}" ==
        values.text.toLowerCase());
    if (actionStatuses.value == null &&
        values.text.isEmpty &&
        date.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: "Trường lọc trống!");
    } else if (!isValid && values.text.isNotEmpty) {
      AppSnackBar.showIsEmpty(message: "Tên khách hàng không tồn tại");
      values.clear();
    } else {
      for (int i = 0; i < listTransactionName.length; i++) {
        var item = listTransactionName[i];
        if ("${item.idCustomer?.toLowerCase()} | ${item.nickName?.toLowerCase()} | ${item.name?.toLowerCase()}" ==
            values.text.toLowerCase()) {
          customerId = item.id.toString();
          break;
        }
      }
      onSelected();
      Get.back();
    }
  }

  // danh sach ngan hang
  void getBankData() {
    callDataService<BankResponse>(
      transactionRepo.getBank(
          key: "BANK_ACCOUNT_CONFIG",
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        listBank.value = data.listBank ?? [];
        listBankModelConfigValueConfig.value = data.listConfig ?? [];

        for (var item in listBank) {
          listNewBank.clear();
          for (int i = 0; i <= listBank[0].configValue!.config!.length; i++) {
            bankName = item.configValue?.config?[i]?.bankName.toString();
            accNumber = item.configValue?.config?[i]?.accountNumber.toString();
            accName = item.configValue?.config?[i]?.accountName.toString();
            bankBranch = item.configValue?.config?[i]?.bankBranch.toString();

            listNewBank.add(BankList(
                id: item.id,
                stringName: "$accNumber - $accName - $bankName - $bankBranch"));
          }
        }
      },
    );
  }

  String? changeUpperStatus({required String uppers}) {
    final upper = Rxn<String>();
    switch (uppers) {
      case "Thanh toán":
        upper.value = TransactionStatusesUpper.pay.value;
      case "Nạp tiền":
        upper.value = TransactionStatusesUpper.recharge.value;
      case "Hoàn tiền":
        upper.value = TransactionStatusesUpper.refund.value;
      case "Rút tiền":
        upper.value = TransactionStatusesUpper.withdrawMoney.value;
    }
    return upper.value;
  }

  String? code;
  String? urlImage;

  String generateRandomString(int length) {
    const characters = '0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

  onSetValue() {
    code = '1719994${generateRandomString(6)}';
  }

  void uploadLogoBank({required File file}) {
    callDataService(
        authenticationRepository.uploadFile(
            objectType: 'customer_transaction_images',
            objectId: 'customer_${idName.value}',
            type: 'regular_image',
            file: file), onSuccess: (url) {
      urlImage = url;
    });
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  // tao giao dich
  createTransaction() {
    bool isValid = listTransactionName.any((item) =>
        "${item.idCustomer?.toLowerCase()} | ${item.nickName?.toLowerCase()} | ${item.name?.toLowerCase()}" ==
        name.text.toLowerCase());
    if (!isValid) {
      AppSnackBar.showIsEmpty(message: "Tên khách hàng không tồn tại");
    } else {
      callDataService(
        transactionRepo.createTransactions(payload: {
          "bank_account": bank.text,
          "customer_id": idName.value,
          "customer_transaction_money": money.text,
          "customer_transaction_note": note.text,
          "customer_transaction_type": typeTrans.text,
          "file": urlImage
        }),
        onSuccess: (data) {
          Future.delayed(
              const Duration(milliseconds: 500), () => Get.back(result: true));
          Future.delayed(
              const Duration(milliseconds: 600),
              () =>
                  AppSnackBar.showSuccess(message: "Tạo giao dịch thành công"));
        },
      );
    }
  }

  onClearValue() {
    status = "";
    customerId = "";
    values.clear();
    date.clear();
    actionStatuses.value = null;
  }

  onSelected() {
    pagingController.initRefresh();
    listTransaction.clear();
    getTransactionList(
      type: filterStatus(filters: method.value),
      fromDateRx: fromDateChoose.value,
      toDateRx: toDateChoose.value,
      customId: customerId,
      statusValue: status,
    );
    listTransactionName.clear();
    getTransactionName();
  }

  onRefreshPage() {
    status = "";
    customerId = "";
    values.clear();
    date.clear();
    actionStatuses.value = null;
    fromDateChoose.value = null;
    toDateChoose.value = null;
    pagingController.initRefresh();
    listTransaction.clear();
    getTransactionList(
        type: filterStatus(filters: method.value),
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        customId: customerId,
        statusValue: status);
    listTransactionName.clear();
    getTransactionName();
    listBankModelConfigValueConfig.clear();
    listBank.clear();
    getBankData();
  }

  onLoadNextPage() {
    logger.i("On load next");
    getTransactionList(
        type: filterStatus(filters: method.value),
        fromDateRx: fromDateChoose.value,
        toDateRx: toDateChoose.value,
        customId: customerId,
        statusValue: status);
  }

  @override
  void onInit() {
    if (authService.userInfo.value?.role?.id == 1 ||
        authService.userInfo.value?.role?.id == 7) {
      getBankData();
      getTransactionList();
      getTransactionName();
    } else{
      return;
    }
    super.onInit();
  }
}
