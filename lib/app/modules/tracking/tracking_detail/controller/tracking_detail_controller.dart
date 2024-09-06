import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/orders_detail.dart';
import 'package:vncss/app/data/repository/authentication_repository.dart';
import 'package:vncss/app/data/repository/delivery_bill_repository.dart';
import 'package:vncss/app/data/service/auth_service.dart';
import 'package:vncss/app/modules/common_widget/dialog_widget.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../data/model/model/customer.dart';
import '../../../../data/model/model/delivery_bill_detail.dart';
import '../../../../data/model/model/exploit_tracking.dart';
import '../../../../data/model/model/tracking.dart';
import '../../../../data/model/model/tracking_bill.dart';
import '../../../../data/model/model/tracking_new.dart';
import '../../../../data/model/response/list_trackings_response.dart';
import '../../../../data/repository/tracking_repository.dart';
import '../../../main/controllers/main_controller.dart';
import '../../tracking_screen/controller/tracking_controller.dart';

class TrackingDetailController extends BaseController {
  final trackingRepo = Get.find<TrackingsRepository>();
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final authRepo = Get.find<AuthenticationRepository>();
  final customerNameController = Get.find<TrackingController>();
  final AuthService authService = Get.find();
  final trackings = Trackings().obs;
  final listStatusLog = <OrdersDetailStatusLogs>[].obs;
  final customer = Customer().obs;
  final trackingType = TrackingType().obs;
  final types = Rxn<String>();
  final checkEnable = true.obs;
  final warehouseController = Get.find<MainController>();
  TextEditingController shippingCost = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController surcharge = TextEditingController();
  TextEditingController otherFee = TextEditingController();
  TextEditingController trackingAmount = TextEditingController();
  TextEditingController trackingMiningWeight = TextEditingController();
  TextEditingController trackingBarrelCoefficient = TextEditingController();
  TextEditingController customerController = TextEditingController();

  final idCustomer = 0.obs;
  final idTrackingType = "".obs;
  final trackingCode = "".obs;

  TextEditingController messageCheck = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController note = TextEditingController();

  int? id;
  int? idBill;
  int? indexTap;
  int? indexUpdate;

  var isLoading = false.obs;

  final NumberFormat _numberFormat = NumberFormat("#,###");

  checkStatus(String? status) {
    switch (status) {
      case "Chờ nhập kho US":
      case "Đã nhập kho US":
      case "Đang vận chuyển về VN":
      case "Đã nhập kho VN":
      case "Đã khai thác":
        return true;
      default:
        return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    id = argument['id'];
    idBill = argument['idBill'];
    indexTap = argument['indexTap'];
    indexUpdate = argument['indexUpdate'];
    getDetailTracking();

    // shippingCost.addListener(() => _formatNumber(shippingCost));
    // shippingFee.addListener(() => _formatNumber(shippingFee));
    // discount.addListener(() => _formatNumber(discount));
    // surcharge.addListener(() => _formatNumber(surcharge));
    // otherFee.addListener(() => _formatNumber(otherFee));
  }

  @override
  void onClose() {
    getDetailTracking();
    // shippingCost.removeListener(() => _formatNumber(shippingCost));
    // shippingFee.removeListener(() => _formatNumber(shippingFee));
    // discount.removeListener(() => _formatNumber(discount));
    // surcharge.removeListener(() => _formatNumber(surcharge));
    // otherFee.removeListener(() => _formatNumber(otherFee));
    super.onClose();
  }

  void _formatNumber(TextEditingController controller) {
    String text = controller.text.replaceAll(',', '');
    if (text.isNotEmpty) {
      final int? number = int.tryParse(text);
      if (number != null) {
        final formatted = _numberFormat.format(number);
        if (formatted != controller.text) {
          int newCursorPosition = controller.selection.baseOffset +
              (formatted.length - text.length);
          controller.value = TextEditingValue(
            text: formatted,
            selection: TextSelection.collapsed(
              offset: newCursorPosition.clamp(0, formatted.length),
            ),
          );
        }
      }
    }
  }

  checkRequest() {
    callDataService(
        trackingRepo.checkRequest(
            id: id!, payload: {"message": messageCheck.text}), onSuccess: (_) {
      AppSnackBar.showUpdateSuccess(message: "Gửi yêu cầu thành công");
    });
  }

  void updateTracking()async{
    bool isValid = customerNameController.listCustomerName
        .any((item) =>"${item.nickName?.toLowerCase()} | ${item.idCustomer?.toLowerCase()} | ${item.name?.toLowerCase()}" == customerController.text.toLowerCase());
    !isValid
        ? AppSnackBar.showError(message: "Khách hàng không tồn tại")
        : callDataService(
            trackingRepo.updateTrackingDetail(id: id!, updateFields: {
              "customer": idCustomer.value,
              "description": description.text,
              "note": note.text,
              "price": int.tryParse(price.text),
              "productName": productName.text,
              "trackingType": int.tryParse(idTrackingType.value),
              "tracking_code": trackingCode.value,
              "warehouseVN": warehouseController.warehouseId == 0
                  ? null
                  : warehouseController.warehouseId
            }), onSuccess: (_) {
            Future.delayed(const Duration(milliseconds: 500), () {
              AppSnackBar.showUpdateSuccess(message: "Cập nhật thành công");
            });
            Future.delayed(const Duration(milliseconds: 600), () {
              Get.back(result: true);
            });
          });
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  String convertCommaToDot(String input) {
    return !isNumeric(input)
        ? input.replaceAll(',', '.')
        : input;
  }

  bool isDecimal(String input) {
    final decimalRegExp = RegExp(r'^[0-9]*\.?[0-9]+$');
    return decimalRegExp.hasMatch(input);
  }

  void updateTrackingDelivery() async {
    shippingCost.text.isEmpty ? shippingCost.text = 0.toString() : null;
    discount.text.isEmpty ? discount.text = 0.toString() : null;
    surcharge.text.isEmpty ? surcharge.text = 0.toString() : null;
    otherFee.text.isEmpty ? otherFee.text = 0.toString() : null;
    if (!isNumeric(shippingCost.text)) {
      AppSnackBar.showIsEmpty(message: "Giá cước VC sai định dạng");
    } else if (!isNumeric(discount.text)) {
      AppSnackBar.showIsEmpty(message: "Giảm giá sai định dạng");
    } else if (!isNumeric(surcharge.text)) {
      AppSnackBar.showIsEmpty(message: "Phụ thu sai định dạng");
    } else if (!isNumeric(otherFee.text)) {
      AppSnackBar.showIsEmpty(message: "Phí khác sai định dạng");
    } else {
      Get.dialog(
        CustomDialog(
          title: "Cập nhật tracking '${trackings.value.code}'?",
          onTapYes: () async {
            callDataService<UpdateTracking>(
                trackingRepo.updateTrackingDelivery(id: id!, updateFields: {
                  "trackingShippingCost": shippingCost.text,
                  "shippingCost": shippingCost.text,
                  "trackingSurcharge": surcharge.text,
                  "trackingDiscountAmount": discount.text,
                  "trackingOtherFee": otherFee.text,
                }), onSuccess: (_) {
              Future.delayed(const Duration(milliseconds: 1000), () {
                AppSnackBar.showUpdateSuccess(
                    message: "Cập nhật tracking thành công");
              });
            });
            Get.back();
            Get.back(result: true);
          },
          onTapNo: () {
            Get.back();
          },
        ),
      );
    }
  }

  // xóa tracking khỏi list tracking hiển thị
  void deleteTrackingList() {
    callDataService<AddTrackingDeliveryBill>(
      deliveryBillRepo
          .deleteTrackingDeliveryBill(id: idBill!, payload: {'trackingId': id}),
      onSuccess: (data) {},
    );
  }

  void exploitTracking() async {
    bool isValid = customerNameController.listCustomerName.any((item) =>
        "${item.nickName?.toLowerCase()} | ${item.idCustomer?.toLowerCase()} | ${item.name?.toLowerCase()}" ==
        customerController.text.toLowerCase());
    await Future.delayed(const Duration(milliseconds: 500), () {
      productName.text == ""
          ? AppSnackBar.showError(message: "Chưa nhập tên sản phẩm")
          : customerController.text == ""
          ? AppSnackBar.showError(message: "Chưa chọn khách hàng")
          : !isValid
          ? AppSnackBar.showError(message: "Tên khách hàng không tồn tại")
          : types.value.toString() == "null"
          ? AppSnackBar.showError(message: "Chưa chọn loại hàng hoá")
          : !isNumeric(trackingAmount.text.toString())
          ? AppSnackBar.showError(message: "Số lượng chỉ được nhập số nguyên dương")
          : !isNumeric(trackingMiningWeight.text.toString()) || trackingMiningWeight.text.toString() == "0" || trackingMiningWeight.text.toString() == "0.00"
          ? AppSnackBar.showError(message: "Cân nặng khai thác chỉ được nhập số nguyên dương lớn hơn 0")
          : !isDecimal(convertCommaToDot(trackingBarrelCoefficient.text.toString()))
          ? AppSnackBar.showError(message: "Hệ số thùng chỉ được nhập số thập phân")
          : callDataService<ExploitTracking>(
              trackingRepo.exploitTracking(id: id!, exploitFields: {
                "businessPartner": trackings.value.businessPartner!.id,
                "customer": idCustomer.value,
                "customizedBoxCoefficient":
                    double.parse(convertCommaToDot(trackingBarrelCoefficient.text.toString())),
                "note": note.text,
                "productName": productName.text,
                "trackingAmount": trackingAmount.text,
                "trackingMiningWeight": trackingMiningWeight.text,
                "trackingType": int.parse(idTrackingType.value),
                "tracking_code": trackings.value.code,
                "warehouseVn": trackings.value.warehouseVn!.id
              }), onSuccess: (_) {
              AppSnackBar.showUpdateSuccess(message: "Khai thác thành công");
              Future.delayed(const Duration(milliseconds: 500), () {
                Get.back(result: true);
              });
            });
    });
  }

  updateBoxTracking()  async {
    bool isValid = customerNameController.listCustomerName
        .any((item) =>"${item.nickName} | ${item.idCustomer} | ${item.name}" == customerController.text);
    await Future.delayed(Duration(milliseconds: 500),(){
      productName.text == ""
          ? AppSnackBar.showError(message: "Chưa nhập tên sản phẩm")
          : customerController.text == ""
          ? AppSnackBar.showError(message: "Chưa chọn khách hàng")
          : !isValid
          ? AppSnackBar.showError(message: "Tên khách hàng không tồn tại")
          : types.value.toString() == "null"
          ? AppSnackBar.showError(message: "Chưa chọn loại hàng hoá")
          : !isNumeric(trackingAmount.text.toString())
          ? AppSnackBar.showError(message: "Số lượng chỉ được nhập số nguyên dương")
          : !isNumeric(trackingMiningWeight.text.toString()) || trackingMiningWeight.text.toString() == "0"
          ? AppSnackBar.showError(message: "Cân nặng khai thác chỉ được nhập số nguyên dương lớn hơn 0")
          : !isDecimal(convertCommaToDot(trackingBarrelCoefficient.text.toString()))
          ? AppSnackBar.showError(message: "Hệ số thùng chỉ được nhập số thập phân")
          : callDataService<Trackings>(
          trackingRepo.updateBoxTracking(id: id!, updateFields: {
            "businessPartner": trackings.value.businessPartner!.id,
            "customer": idCustomer.value,
            "customizedBoxCoefficient": double.parse(trackingBarrelCoefficient.text),
            "note": note.text,
            "productName": productName.text,
            "trackingAmount": trackingAmount.text,
            "trackingMiningWeight": trackingMiningWeight.text,
            "trackingType": int.parse(idTrackingType.value),
            "tracking_code": trackingCode.value,
            "warehouseVn": trackings.value.warehouseVn!.id
          }), onSuccess: (_) {
        AppSnackBar.showUpdateSuccess(message: "Cập nhật thành công");
        Future.delayed(Duration(milliseconds: 500),(){
          Get.back(result: true);
        });
      });
    });
  }

  getDetailTracking() async {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<ListDetailTrackingResponse>(
        trackingRepo.getTrackingsDetail(id: id!), onSuccess: (data) {
      trackings.value = data.detailTracking!;
      trackingCode.value = data.detailTracking!.code!;
      listStatusLog.value = data.listStatusLog ?? [];
      if (data.detailTracking!.customer != null) {
        idCustomer.value = data.detailTracking!.customer!.id!;
        customerController.text =
            "${data.detailTracking!.customer!.nickName!} | ${data.detailTracking!.customer!.idCustomer!} | ${data.detailTracking!.customer!.name!}";
      }

          if(data.detailTracking!.trackingType != null){
            types.value = data.detailTracking!.trackingType!.name!;
            idTrackingType.value = data.detailTracking!.trackingType!.id!.toString();
          }
          if(data.detailTracking!.productName != null){
            productName.text = data.detailTracking!.productName.toString();
          }
          if(data.detailTracking!.price != null){
            price.text = data.detailTracking!.price.toString();
          }
          if(data.detailTracking!.description != null){
            description.text = data.detailTracking!.description.toString();
          }
          if(data.detailTracking!.note != null){
            note.text = data.detailTracking!.note.toString();
          }
          if(data.detailTracking!.trackingShippingCost != null){
            shippingCost.text = data.detailTracking!.formattedTrackingShippingCost.toInt().toString();
          }
          data.detailTracking!.trackingAmount != null ? trackingAmount.text = data.detailTracking!.trackingAmount.toString() :  trackingAmount.text = "1";
          data.detailTracking!.trackingMiningWeight != null ? trackingMiningWeight.text = data.detailTracking!.trackingMiningWeight.toString() :  trackingMiningWeight.text = "0";
          data.detailTracking!.trackingBarrelCoefficient != null ? trackingBarrelCoefficient.text = data.detailTracking!.trackingBarrelCoefficient.toString() :  trackingBarrelCoefficient.text = "1.05";

      discount.text = data.detailTracking!.trackingDiscountAmount.toString();
      surcharge.text =
          data.detailTracking!.formattedTrackingSurcharge.toInt().toString();
      otherFee.text =
          data.detailTracking!.formattedTrackingOtherFee.toInt().toString();
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }
}
