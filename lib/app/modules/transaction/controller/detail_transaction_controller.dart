import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';

import '../../../core/base/paging_controller.dart';
import '../../../data/model/model/transaction.dart';
import '../../../data/model/response/transaction_response.dart';
import '../../../data/repository/transaction_reposioty.dart';

class DetailTransactionController extends BaseController {
  final pagingController = PagingController<Transactions>();
  final scrollController = ScrollController();
  int? id;

  final transactionDetailRepo = Get.find<TransactionsRepository>();
  final detailTransaction = Transactions().obs;
  final controllerMain = Get.find<MainController>();

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

  var isLoading = false.obs;
  Future<Transactions> getDetail() async {
    try {
      isLoading.value = true;
      final data = await transactionDetailRepo.getTransactionDetail(
          id: id!,
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString());
      detailTransaction.value = data.transaction!;
      return detailTransaction.value;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  completeTransaction() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService(
        transactionDetailRepo.changeTransaction(
            id: id!, payload: {'status': "hoàn thành"}), onSuccess: (data) {
      Future.delayed(const Duration(milliseconds: 600),
          () => AppSnackBar.showSuccess(message: "Duyệt thành công"));
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  cancelTransaction() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService(
        transactionDetailRepo.changeTransaction(
            id: id!, payload: {'status': "hủy"}), onSuccess: (data) {
      Future.delayed(const Duration(milliseconds: 600),
          () => AppSnackBar.showSuccess(message: "Hủy thành công"));
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  @override
  void onInit() {
    id = argument['id'];
    getDetail();
    super.onInit();
  }
}
