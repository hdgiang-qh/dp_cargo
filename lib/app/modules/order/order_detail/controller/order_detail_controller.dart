import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/orders_detail.dart';
import '../../../../data/model/response/list_order_response.dart';
import '../../../../data/repository/order_repository.dart';
import '../../../tracking/tracking_screen/controller/tracking_controller.dart';

class OrderDetailController extends BaseController {
  final orderRepo = Get.find<OrderRepository>();
  final orders = OrdersDetail().obs;
  final customerNameController = Get.find<TrackingController>();
  final listHistoryAction = <OrdersDetailStatusLogs>[].obs;
  final types= Rxn<String>();
  TextEditingController productName = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController customerName = TextEditingController();

  final idCustomer = 0.obs;
  final idTrackingType = 0.obs;

  int? id;

  var isLoading = false.obs;

  @override
  void onInit() {
    id = argument['id'];
    getDetailOrder();
    super.onInit();
  }

  void updateOrder() {
    bool isValid = customerNameController.listCustomerName
        .any((item) =>"${item.nickName?.toLowerCase()} | ${item.idCustomer?.toLowerCase()} | ${item.name?.toLowerCase()}" == customerName.text.toLowerCase());
    !isValid
        ? AppSnackBar.showError(message: "Khách hàng không tồn tại")
        : callDataService<ListOrderDetailResponse>(
        orderRepo.updateOrderDetail(id: id!, updateFields: {
          "productName": productName.text,
          "customer": idCustomer.value,
          "trackingType": idTrackingType.value,
          "note": note.text,
        }), onSuccess: (_) {
      AppSnackBar.showUpdateSuccess(message: "Cập nhật thành công");
      Get.back(result: true);
    });
  }

  getDetailOrder() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<ListOrderDetailResponse>(
        orderRepo.getOrderDetail(id: id!),
        onSuccess: (data){
          orders.value = data.orderDetail!;
          data.orderDetail?.customer?.name == null
              ? customerName.text = "Chọn loại hàng hoá"
              : customerName.text = "${data.orderDetail?.customer?.nickName} | ${data.orderDetail?.customer?.idCustomer} | ${data.orderDetail?.customer?.name}";
          data.statusLog == null
              ? listHistoryAction.clear()
              : listHistoryAction.value = data.statusLog!;
          productName.text = data.orderDetail?.productName ?? "";
          idCustomer.value = data.orderDetail?.customer?.id ?? 0;
          idTrackingType.value = data.orderDetail?.trackingType?.id ?? 0;
          note.text = data.orderDetail?.note ?? "";
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }
}