import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/repository/delivery_bill_repository.dart';
import 'package:vncss/app/modules/bill_of_lading/controller/bill_of_lading_controller.dart';

import '../../../core/base/base_controller.dart';
import '../../../data/model/model/bill_of_lading.dart';
import '../../../data/model/response/bill_of_lading_response.dart';
import '../../../data/repository/bill_of_lading_reponsitory.dart';
import '../../common_widget/const.dart';

class BillOfLadingDetailController extends BaseController {
  final billOfLadingRepo = Get.find<BillOfLadingRepository>();
  final listBillOfLadingDetail = BillOfLading().obs;
  final listDeliveryUnit = <BillOfLadingVnDeliveryUnit>[].obs;

  final codeDeliveryUpdate = TextEditingController();
  final codeBolUpdate = TextEditingController();
  final deliveryUnitUpdate = TextEditingController();
  final quantityUpdate = TextEditingController();

  final errorShipUpdate = Rxn<String>();
  final errorQuantityUpdate = Rxn<String>();
  final idDeliveryUnitUpdate = Rxn<int>();
  final idDeliveryBillUpdate = Rxn<int>();

  String statusValue({required int status}) {
    var i = "".obs;
    switch (status) {
      case 0:
        i.value = "Mã mới tạo";
      case 1:
        i.value = "Đang giao hàng";
      case 2:
        i.value = "Hoàn thành";
      case 3:
        i.value = "Giao hàng không thành công";
      case 4:
        i.value = "Đã hủy bỏ";
    }
    return i.value;
  }

  Color colorValue({required int status}) {
    var i = Colors.white.obs;
    switch (status) {
      case 0:
        i.value = ColorApp.yellowFFC.withOpacity(0.2);
      case 1:
        i.value = ColorApp.orangeF2.withOpacity(0.2);
      case 2:
        i.value = ColorApp.greenBC;
      case 3:
        i.value = ColorApp.redB6.withOpacity(0.2);
      case 4:
        i.value = ColorApp.red75.withOpacity(0.2);
    }
    return i.value;
  }

  Color colorText({required int status}) {
    var i = Colors.white.obs;
    switch (status) {
      case 0:
        i.value = ColorApp.yellowFFC;
      case 1:
        i.value = ColorApp.orangeF2;
      case 2:
        i.value = ColorApp.green1B;
      case 3:
        i.value = ColorApp.redB6;
      case 4:
        i.value = ColorApp.red75;
    }
    return i.value;
  }

  int? id;
  int? ids;
  int idBol = 0;

  var isLoading = false.obs;

  void getBillOfLadingDetail() {
    callDataService<BillOfLadingDetailResponse>(
      billOfLadingRepo.getBillOfLadingDetail(id: id),
      onSuccess: (data) {
        isLoading.value == true;
        listBillOfLadingDetail.value = data.billOfLadingDetail!;
        codeBolUpdate.text = listBillOfLadingDetail.value.code!;
        deliveryUnitUpdate.text =
        listBillOfLadingDetail.value.vnDeliveryUnit!.name!;
        quantityUpdate.text = listBillOfLadingDetail.value.quantity.toString();
        idDeliveryBillUpdate.value = listBillOfLadingDetail.value.deliveryBillId;
        idBol = listBillOfLadingDetail.value.id!;
        idDeliveryUnitUpdate.value =
            listBillOfLadingDetail.value.vnDeliveryUnitId;
      },
    );
  }
  // Future<BillOfLading> getBillOfLadingDetail() async {
  //   try {
  //     isLoading.value = true;
  //     final data = await billOfLadingRepo.getBillOfLadingDetail(id: id);
  //     listBillOfLadingDetail.value = data.billOfLadingDetail!;
  //     codeBolUpdate.text = listBillOfLadingDetail.value.code!;
  //     deliveryUnitUpdate.text =
  //         listBillOfLadingDetail.value.vnDeliveryUnit!.name!;
  //     quantityUpdate.text = listBillOfLadingDetail.value.quantity.toString();
  //     idDeliveryBillUpdate.value = listBillOfLadingDetail.value.deliveryBillId;
  //     idBol = listBillOfLadingDetail.value.id!;
  //     idDeliveryUnitUpdate.value =
  //         listBillOfLadingDetail.value.vnDeliveryUnitId;
  //     return listBillOfLadingDetail.value;
  //   } catch (error) {
  //     rethrow;
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  //cập nhật vận đơn
  updateBol() {
    bool isValid = listDeliveryUnit.any((item) =>
        item.name?.toLowerCase() == deliveryUnitUpdate.text.toLowerCase());
    deliveryUnitUpdate.text.isEmpty
        ? errorShipUpdate.value = "Trường bắt buộc"
        : errorShipUpdate.value = null;
    quantityUpdate.text.isEmpty
        ? errorQuantityUpdate.value = "Trường bắt buộc"
        : errorQuantityUpdate.value = null;

    if (deliveryUnitUpdate.text.isEmpty || quantityUpdate.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: "Các trường không được để trống");
    } else if (!isValid) {
      errorShipUpdate.value = 'Đơn vị vận chuyển không hợp lệ';
    } else if (!isNumeric(quantityUpdate.text)) {
      errorQuantityUpdate.value = "Không được chứa ký từ ngoài số";
    } else if (double.parse(quantityUpdate.text) <= 0) {
      errorQuantityUpdate.value = "Số lượng cần có giá trị lớn hơn 0!";
    } else {
      errorShipUpdate.value = null;
      errorQuantityUpdate.value = null;
      callDataService<BolAdd>(
          billOfLadingRepo.updateBol(id: idBol, payload: {
            'code': codeBolUpdate.text,
            'deliveryBillId': idDeliveryBillUpdate.value,
            'quantity': quantityUpdate.text,
            'deliveryUnitId': idDeliveryUnitUpdate.value
          }), onSuccess: (data) async {
        await Future.delayed(const Duration(milliseconds: 500), () {
          AppSnackBar.showSuccess(message: "Cập nhật vận đơn thành công!");
        });
      }, onError: (error) {
        AppSnackBar.showIsEmpty(message: "Số lượng cần có giá trị lớn hơn 0!");
      });
      Get.back(result: true);
    }
  }

  // danh sách đơn vị vận chuyển
  getDeliveryUnit() {
    callDataService<DeliveryUnitsResponse>(
      billOfLadingRepo.getDeliveryUnits(page: 1, pageSize: 100, status: "0"),
      onSuccess: (data) {
        listDeliveryUnit.value = data.listDeliveryUnits ?? [];
      },
    );
  }

  changeDelivering() {
    callDataService(
      billOfLadingRepo.receivingBox(payload: {
        'ids': [ids]
      }),
      onSuccess: (data) {},
    );
  }

  changeSuccess() {
    callDataService(
      billOfLadingRepo.successBox(payload: {
        'ids': [ids]
      }),
      onSuccess: (data) {},
    );
  }

  changeCancel() {
    callDataService(
      billOfLadingRepo.failedBox(payload: {
        'ids': [ids]
      }),
      onSuccess: (data) {},
    );
  }

  onRefreshPage() {}

  @override
  void onInit() {
    id = argument['id'];
    getBillOfLadingDetail();
    getDeliveryUnit();
    super.onInit();
  }
}
