import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/core/base/paging_controller.dart';
import 'package:vncss/app/core/widget/dialog/app_snackbar.dart';
import 'package:vncss/app/data/model/model/delivery_bill_detail.dart';
import 'package:vncss/app/data/model/response/pagination.dart';
import 'package:vncss/app/data/repository/delivery_bill_repository.dart';
import 'package:vncss/app/data/service/setting_service.dart';
import 'package:vncss/app/modules/main/controllers/main_controller.dart';

import '../../../core/enum/bill_of_lading_status.dart';
import '../../../core/enum/delivery_bill_status.dart';
import '../../../data/model/model/bill_of_lading.dart';
import '../../../data/model/response/bill_of_lading_response.dart';
import '../../../data/model/response/list_delivery_bill.dart';
import '../../../data/repository/bill_of_lading_reponsitory.dart';
import '../../common_widget/const.dart';

class BillOfLadingController extends BaseController {
  final settingService = Get.find<SettingService>();
  final pagingController = PagingController<BillOfLading>();
  final scrollController = ScrollController();
  final billOfLadingRepo = Get.find<BillOfLadingRepository>();
  final deliveryRepo = Get.find<DeliveryBillRepository>();
  final listCodePacked = <AddTrackingDeliveryBill>[].obs;
  final listDeliveryUnit = <BillOfLadingVnDeliveryUnit>[].obs;
  List<CodePacked> codeList = [];

  final controllerMain = Get.find<MainController>();
  TextEditingController values = TextEditingController();
  final listBillOfLading = <BillOfLading>[].obs;
  final listBillOfLadingDetail = BillOfLading().obs;
  final metaValue = Meta().obs;
  BillOfLadingStatus? billOfLadingStatus;

  final codeDelivery = TextEditingController();
  final codeBol = TextEditingController();
  final deliveryUnit = TextEditingController();
  final quantity = TextEditingController();

  final errorQuantity = Rxn<String>();

  int? idDeliOrder;
  int? idShipper;
  final idDeliveryUnit = Rxn<int>();
  final idDeliveryBill = Rxn<int>();
  List<int> deliId = [];
  final errorBol = Rxn<String>();
  final errorCode = Rxn<String>();
  final errorShip = Rxn<String>();

  onClearValue() {
    codeDelivery.clear();
    codeBol.clear();
    deliveryUnit.clear();
    quantity.clear();
    errorBol.value = null;
    errorCode.value = null;
    errorShip.value = null;
    errorQuantity.value = null;
  }

  final code = Rxn<String>();

  final status = ''.obs;

  final keyword = "".obs;

  String generateRandomString(int length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));
  }

  onSetValue() {
    codeBol.text = generateRandomString(12);
  }

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

  String idStatus({required String status}) {
    var i = "".obs;
    switch (status) {
      case "Mã mới tạo":
        i.value = 0.toString();
      case "Đang giao hàng":
        i.value = 1.toString();
      case "Hoàn thành":
        i.value = 2.toString();
      case "Giao hàng không thành công":
        i.value = 3.toString();
      case "Đã hủy bỏ":
        i.value = 4.toString();
    }
    return i.value;
  }

  var indexStatus = 0.obs;
  var currentIndex = 0.obs;

  void changeStatusDelivery(int newValue) {
    indexStatus.value = newValue;
  }

  Future<void> onTapStatus(int index, String valueIndex) async {
    currentIndex.value = index;
    status.value = idStatus(status: valueIndex);
    onRefreshPage();
  }

  Future<void> onTapStatusV(int index, String valueIndex) async {
    currentIndex.value = index;
    status.value = idStatus(status: valueIndex);
    onSelected();
  }

  // danh sách vận đơn
  var isLoading = false.obs;

  void getBillOfLadingList({String? codes}) {
    pagingController.isLoadingPage = true;
    callDataService<BillOfLadingResponse>(
      billOfLadingRepo.getBillOfLading(
          status: status.value,
          code: codes == "" ? "" : codes,
          page: pagingController.pageNumber,
          pageSize: 10,
          warehouseId: controllerMain.warehouseId == 0
              ? null
              : controllerMain.warehouseId.toString()),
      onSuccess: (data) {
        isLoading.value == true;
        final repoList = data.billOfLading ?? [];
        if (_isLastPage(repoList.length, data.meta!.total!)) {
          pagingController.appendLastPage(repoList);
        } else {
          pagingController.appendPage(repoList);
        }
        var newList = [...pagingController.listItems];
        listBillOfLading.value = newList;
        metaValue.value = data.meta!;
      },
    );

    pagingController.isLoadingPage = false;
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (listBillOfLading.length) >= totalCount;
  }

  //cập nhật shipper vận đơn
  void updateBolShipper() {
    callDataService(
      billOfLadingRepo.updateBolShipper(
          id: idDeliOrder!, payload: {'deliveredById': idShipper}),
      onSuccess: (data) async {
        await Future.delayed(const Duration(milliseconds: 500), () {
          AppSnackBar.showSuccess(message: "Gán shipper thành công!");
        });
      },
    );
  }

  // chuyển đang giao chi tiết
  void changeDeliveringDetail() {
    callDataService(
      billOfLadingRepo
          .changeDeliveringDetail(id: idDeliOrder!, payload: {'newStatus': 1}),
      onSuccess: (data) async {
        await Future.delayed(const Duration(milliseconds: 500), () {
          AppSnackBar.showSuccess(message: "Thay đổi trạng thái thành công!");
        });
      },
    );
  }

  // chuyển hoàn thành
  void changeSuccessDetail() {
    callDataService(
        billOfLadingRepo.changeDeliveringDetail(
            id: idDeliOrder!,
            payload: {'newStatus': 2}), onSuccess: (data) async {
      await Future.delayed(const Duration(milliseconds: 500), () {
        AppSnackBar.showSuccess(message: "Thay đổi trạng thái thành công!");
      });
    }, onError: (error) async {
      await Future.delayed(const Duration(milliseconds: 500), () {
        AppSnackBar.showIsEmpty(message: "Thay đổi trạng thái thất bại!");
      });
    });
  }

  // chuyển hủy
  void changeCancelDetail() {
    callDataService(
      billOfLadingRepo
          .changeDeliveringDetail(id: idDeliOrder!, payload: {'newStatus': 3}),
      onSuccess: (data) async {
        await Future.delayed(const Duration(milliseconds: 500), () {
          AppSnackBar.showSuccess(message: "Thay đổi trạng thái thành công!");
        });
      },
    );
  }

  onSelected() {
    pagingController.initRefresh();
    listBillOfLading.clear();
    getBillOfLadingList(codes: code.value);
  }

  // danh sách code Đã đóng hàng
  getCodePacked() {
    callDataService<ListCodePackedResponse>(
      deliveryRepo.searchKeyword(keyword: keyword.value),
      onSuccess: (data) {
        listCodePacked.value = data.listCodePacked ?? [];
        for (var item in listCodePacked) {
          if (item.deliveryBillStatus ==
              DeliveryStatus.packing.value.toString()) {
            codeList.add(CodePacked(id: item.id, code: item.code));
          }
        }
      },
    );
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

  void validateInput() {
    String value = deliveryUnit.text;
    bool isValid = listDeliveryUnit
        .any((item) => item.name?.toLowerCase() == value.toLowerCase());
    if (!isValid) {
      errorShip.value = 'Đơn vị vận chuyển không hợp lệ';
    } else {
      errorShip.value = null;
    }
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  //tạo vận đơn
  createBillOfLading() {
    bool isValid = listDeliveryUnit.any(
        (item) => item.name?.toLowerCase() == deliveryUnit.text.toLowerCase());
    bool isValidCode = codeList.any(
        (item) => item.code?.toLowerCase() == codeDelivery.text.toLowerCase());
    codeBol.text.isEmpty
        ? errorBol.value = "Trường bắt buộc"
        : errorBol.value = null;
    codeDelivery.text.isEmpty
        ? errorCode.value = "Trường bắt buộc"
        : errorCode.value = null;
    deliveryUnit.text.isEmpty
        ? errorShip.value = "Trường bắt buộc"
        : errorShip.value = null;
    quantity.text.isEmpty
        ? errorQuantity.value = "Trường bắt buộc"
        : errorQuantity.value = null;
    if (codeDelivery.text.isEmpty ||
        codeBol.text.isEmpty ||
        deliveryUnit.text.isEmpty ||
        quantity.text.isEmpty) {
      return;
    } else if (codeBol.text.length > 15 || codeBol.text.length < 10) {
      errorBol.value =
          "Chuỗi phải chứa các chữ cái viết hoa và số, và có độ dài từ 10 đến 15 ký tự";
    } else if (!isNumeric(quantity.text)) {
      errorQuantity.value = "Không được chứa ký tự ngoài số";
    } else if (double.parse(quantity.text) <= 0) {
      errorQuantity.value = "Số lượng cần có giá trị lớn hơn 0!";
    } else if (!isValid) {
      errorShip.value = 'Đơn vị vận chuyển không hợp lệ';
    } else if (!isValidCode) {
      errorCode.value = 'Mã phiếu không hợp lệ';
    } else {
      for (int i = 0; i < listDeliveryUnit.length; i++) {
        var item = listDeliveryUnit[i];
        if (item.name?.toLowerCase() == deliveryUnit.text.toLowerCase()) {
          idDeliveryUnit.value = item.id;
          break;
        }
      }
      errorQuantity.value = null;
      errorBol.value = null;
      errorShip.value = null;
      callDataService<BolAdd>(
        billOfLadingRepo.createBol(payload: {
          'code': codeBol.text,
          'deliveryBillId': idDeliveryBill.value,
          'deliveryUnitId': idDeliveryUnit.value,
          'quantity': quantity.text == "1" ? 1 : quantity.text
        }),
        onSuccess: (data) async {
          await Future.delayed(const Duration(milliseconds: 700), () {
            AppSnackBar.showSuccess(message: "Tạo vận đơn thành công!");
          });
        },
      );
      Future.delayed(
          const Duration(milliseconds: 500), () => Get.back(result: true));
    }
  }
  

  // xóa vận đơn
  void deleteBillOfLading({required int id}) {
    callDataService<BolAdd>(
      billOfLadingRepo.deleteBol(id: id),
      onSuccess: (data) async {
        await Future.delayed(const Duration(milliseconds: 1200), () {
          AppSnackBar.showSuccess(message: "Xóa vận đơn thành công!");
        });
      },
    );
  }

  Future<void> onRefreshPage() async {
    pagingController.initRefresh();
    code.value = null;
    listBillOfLading.clear();
    getBillOfLadingList();
  }

  onLoadNextPage() {
    //   logger.i("On load next");
    getBillOfLadingList();
  }

  @override
  void onInit() {
    getBillOfLadingList();
    getCodePacked();
    Get.find<MainController>().userLogin.value.role?.id == 1
        ? getDeliveryUnit()
        : null;
    // onLoadNextPage();
    super.onInit();
  }
}
