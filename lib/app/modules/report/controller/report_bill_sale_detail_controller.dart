import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/data/model/model/report_detail_model.dart';
import 'package:vncss/app/data/repository/report_repository.dart';

import '../../../data/model/response/report_response.dart';
import '../../common_widget/const.dart';

class ReportBillSaleDetailController extends BaseController {
  final reportRepo = Get.find<ReportRepository>();
  final listBillSaleDetail = <ReportDetailModelStatisticByDeliveryBill>[].obs;
  final reportDetailValue = ReportDetailModel().obs;
  final pagingController =
      PagingController<ReportDetailModelStatisticByDeliveryBill>();

  Color buildColor({required String value}) {
    Color color = Colors.white;
    switch (value) {
      case "Phiếu mới tạo":
        color = ColorApp.orangeF2.withOpacity(0.2);
      case "Sale duyệt":
        color = ColorApp.purpleB5.withOpacity(0.2);
      case "Kế toán duyệt":
        color = ColorApp.blue70.withOpacity(0.2);
      case "Yêu cầu xuất kho":
        color = ColorApp.blue4D.withOpacity(0.2);
      case "Đã đóng hàng":
        color = ColorApp.blue36.withOpacity(0.2);
      case "Đang giao hàng":
        color = ColorApp.yellowFFC.withOpacity(0.2);
      case "Đơn hàng giao không thành công":
        color = primaryColor;
      case "Hoàn thành đơn hàng":
        color = ColorApp.green4C.withOpacity(0.2);
      case "Hủy PXK":
        color = ColorApp.blueB5.withOpacity(0.2);
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

  String idValue = "";
  String fromDateRx = "";
  String toDateRx = "";
  String errorMessage = '';

  var isLoading = false.obs;


  Future<void> loadDeliveryBills() async {
    isLoading.value = true;
    errorMessage = '';

    try {
      await getListReportBillSaleDetail();
    } catch (error) {
      errorMessage= 'Failed to load delivery bills: $error';
      Get.snackbar('Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ReportDetailModelStatisticByDeliveryBill>>?
      getListReportBillSaleDetail() async {
    try {
      isLoading.value = true;
      final data = await reportRepo.getListReportBillSaleDetail(
        id: idValue,
        fromDate: fromDateRx,
        toDate: toDateRx,
      );
      listBillSaleDetail.value = data.listStaticByDeliveryBill ?? [];
      reportDetailValue.value = data.reportDetailValue!;
      return listBillSaleDetail;
    } catch (error) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  onRefreshPage() {
    pagingController.initRefresh();
    listBillSaleDetail.clear();
    getListReportBillSaleDetail();
  }

  @override
  void onInit() {
    idValue = argument['id'];
    fromDateRx = argument['fromDate'];
    toDateRx = argument["toDate"];
    getListReportBillSaleDetail();
    super.onInit();
  }
}
