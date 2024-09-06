import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/data/model/model/delivery_bill.dart';
import 'package:vncss/app/data/model/response/list_delivery_bill.dart';
import 'package:vncss/app/modules/transaction/controller/transaction_controller.dart';

import '../../../../../core/base/paging_controller.dart';
import '../../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../../data/model/response/list_delivery_bill.dart';
import '../../../../../data/repository/delivery_bill_repository.dart';

class CreateDeliveryController extends BaseController {
  TextEditingController custom = TextEditingController();
  int? customId;
  final listBillCreate = <CreateBillModel>[].obs;
  final pagingControllerCB = PagingController<CreateBillModel>();
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final controllerName = Get.find<TransactionController>();

  var isLoading = false.obs;

  void getBillCreateList({int? ctID}) {
    // if (!pagingControllerCB.canLoadNextPage()) return;
    pagingControllerCB.isLoadingPage = true;
    callDataService<ListCreateBillResponse>(
      deliveryBillRepo.getListBillCreate(
          page: pagingControllerCB.pageNumber, pageSize: 10, customId: ctID),
      onSuccess: (data) {
        isLoading.value == true;
        final repoList = data.listBillCreate ?? [];
        if (_isLastPageBillCreate(repoList.length, data.pagination!.total!)) {
          pagingControllerCB.appendLastPage(repoList);
        } else {
          pagingControllerCB.appendPage(repoList);
        }
        var newList = [...pagingControllerCB.listItems];
        listBillCreate.value = newList;
      },
    );

    pagingControllerCB.isLoadingPage = false;
  }
  // Future<List<CreateBillModel>>? getBillCreateList({int? ctID}) async {
  //   try {
  //     isLoading.value = true;
  //     final data = await deliveryBillRepo.getListBillCreate(
  //         page: pagingControllerCB.pageNumber, pageSize: 10, customId: ctID);
  //
  //     final repoList = data.listBillCreate ?? [];
  //     if (_isLastPageBillCreate(repoList.length, data.pagination!.total!)) {
  //       pagingControllerCB.appendLastPage(repoList);
  //     } else {
  //       pagingControllerCB.appendPage(repoList);
  //     }
  //     var newList = [...pagingControllerCB.listItems];
  //     listBillCreate.value = newList;
  //     return listBillCreate;
  //   } catch (error) {
  //     print('Error fetching delivery bills: $error');
  //     throw error;
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  bool _isLastPageBillCreate(int newListItemCount, int totalCount) {
    return (listBillCreate.length) >= totalCount;
  }

  onRefreshPage() {
    custom.clear();
    pagingControllerCB.initRefresh();
    listBillCreate.clear();
    getBillCreateList();
  }

  onLoadNextPage() {
    logger.i("On load next");
    getBillCreateList();
  }

  onCreateBill() {
    bool isValid = controllerName.listTransactionName.any((item) =>
        "${item.idCustomer?.toLowerCase()} | ${item.nickName?.toLowerCase()} | ${item.name?.toLowerCase()}" ==
        custom.text.toLowerCase());
    if (custom.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: "Trường lọc trống");
    } else if (!isValid) {
      AppSnackBar.showIsEmpty(message: "Tên khách hàng không tồn tại");
      custom.clear();
      onRefreshPage();
    } else {
      for (int i = 0; i < controllerName.listTransactionName.length; i++) {
        var item = controllerName.listTransactionName[i];
        if ("${item.idCustomer?.toLowerCase()} | ${item.nickName?.toLowerCase()} | ${item.name?.toLowerCase()}" ==
            custom.text.toLowerCase()) {
          customId = item.id;
          break;
        }
      }
      pagingControllerCB.initRefresh();
      listBillCreate.clear();
      getBillCreateList(ctID: customId);
      Get.back();
    }
  }

  @override
  void onInit() {
    getBillCreateList();
    super.onInit();
  }
}
