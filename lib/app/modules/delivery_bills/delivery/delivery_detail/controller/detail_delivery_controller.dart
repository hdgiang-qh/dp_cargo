

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/data/model/model/delivery_bill.dart';
import 'package:vncss/app/data/model/model/delivery_bill_detail.dart';
import 'package:vncss/app/data/model/model/merged_delivery_bill_information.dart';
import 'package:vncss/app/data/model/model/tracking_bill.dart';
import 'package:vncss/app/data/model/model/vn_delivery_box.dart';
import 'package:vncss/app/data/model/model/vn_delivery_order.dart';
import 'package:vncss/app/data/model/response/list_delivery_bill.dart';
import 'package:vncss/app/data/repository/delivery_bill_repository.dart';
import 'package:vncss/app/modules/delivery_bills/add_delivery_bills/model/bill_delivery_expensive.dart';
import 'package:vncss/app/modules/staff/controller/staff_controller.dart';
import 'package:vncss/generated/l10n.dart';

import '../../../../../core/enum/delivery_bill_status.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../common_widget/const.dart';
import '../../../../main/controllers/main_controller.dart';

class DetailDeliveryController extends BaseController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController note = TextEditingController();

  final errorName = Rxn<String>();
  final errorPhone = Rxn<String>();
  final errorEmail = Rxn<String>();
  final errorAddress = Rxn<String>();

  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  final FocusNode noteFocus = FocusNode();

  final controllerMain = Get.find<MainController>();

  final listTrackingCustomerDetail = <TrackingCustom>[].obs;
  final controllerStaff = Get.find<StaffController>();
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final deliveryBill = DeliveryBillDetail().obs;
  final tracking = <TrackingsBill>[].obs;
  final checkItem = <bool>[].obs;
  final checkItemTracking = <bool>[].obs;
  Rxn<int> totalShip = Rxn<int>();
  Rxn<int> totalSurcharge = Rxn<int>();
  Rxn<int> totalOtherFee = Rxn<int>();
  Rxn<int> totalDiscount = Rxn<int>();
  String? balance;

  List<int> idTrackingDetail = [];
  List<int> idTrackingExport = [];
  final listNew = <TrackingCustom>[].obs;
  final listAddItem = <TrackingCustom>[].obs;
  final listShowItem = <TrackingCustom>[].obs;

  /// chứa các code đã quét
  final barcodes = RxList<String>();

  /// chứa code đã get về
  final putVnDeliveryBoxes = RxList<String>();

  List<VnDeliveryBox> get vnDeliveryBoxes =>
      deliveryBill.value.vnDeliveryBoxes ?? [];

  List<VnDeliveryOrder> get vnDeliveryOrder =>
      deliveryBill.value.vnDeliveryOrder ?? [];

  final deliveryBillExpensive = BillDeliveryExpensive(
          trackingOtherFee: 0, trackingShippingFee: 0, trackingSurcharge: 0)
      .obs;

  int? id;
  int? idTracking;
  int? idShipper;
  final deliveryStatus = "".obs;
  bool isFirstTrackingCheck = true;

  // void onUpdateBarCode(String value) {
  //   final copyBarcode = [value,...barcodes];
  //   copyBarcode.toSet();
  //   barcodes.addAll(copyBarcode);
  //   update();
  // }


  void onUpdateBarCode(String value) {
    /// Tạo một Set để tự động loại bỏ các giá trị trùng lặp
    final Set<String> uniqueCodes = Set.from(barcodes)..add(value);

    /// Chuyển Set thành List
    final copyBarcode = uniqueCodes.toList();
    // List<String>? data = deliveryBillDetailController.vnDeliveryBoxes
    //     .where((box) => box.id.toString() != null)
    //     .map((box) => box.id.toString())
    //     .toList();
    //
    // List<String> ids = data.where((id) => barcodes.contains(id)).toList();
    /// Cập nhật danh sách mã vạch gốc
    barcodes.clear();
    barcodes.addAll(copyBarcode);
    // callDataService(
    //   deliveryBillRepo.receive(
    //     receiveModel: ReceiveModel(ids: copyBarcode),
    //   ),
    //   onSuccess: (data) async {
    //     print('API: $data');
    //   },
    // );
    update();
  }

  Color buildColor({required String value}) {
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

  Color buildColorBol({required int status}) {
    Color color = Colors.white;
    switch (status) {
      case 0:
        color = AppColors.waitingForWarehouseUS;
      case 1:
        color = AppColors.delivering;
      case 2:
        color = AppColors.completed;
      case 3:
        color = AppColors.canceled;
      case 4:
        color = AppColors.cancelled;
    }
    return color;
  }

  String buildTextBol({required int status}) {
    String text = "";
    switch (status) {
      case 0:
        text = "Mã mới tạo";
      case 1:
        text = "Đang giao hàng";
      case 2:
        text = "Giao thành công";
      case 3:
        text = "Giao thất bại";
      case 4:
        text = "Đã hủy bỏ";
    }
    return text;
  }

  void putBoxes(String value) {
    final data = [value, ...putVnDeliveryBoxes];
    data.toSet();
    putVnDeliveryBoxes.addAll(data);
    update();
  }

  @override
  void onInit() {
    id = argument['id'];
    idTracking = argument['idTracking'];
    getDetailDelivery();
    getListTrackingCustomerDetail();
    super.onInit();
  }

  // cập nhật lại tracking phiếu
  onCheckValueListTracking() async {
    addSelectedItems();
    postTrackingList();
    await Future.delayed(const Duration(milliseconds: 1000), () {
      getDetailDelivery();
    }).then(
        (_) => AppSnackBar.showUpdateSuccess(message: "Cập nhật thành công"));
  }

  // chi phí
  void getExpensive() {
    totalShip.value = tracking.fold(
        0, (sum, value) => sum! + value.formattedShippingFee.toInt());
    totalSurcharge.value = tracking.fold(
        0, (sum, value) => sum! + value.formattedTrackingSurcharge.toInt());
    totalOtherFee.value = tracking.fold(
        0, (sum, value) => sum! + value.formattedTrackingOtherFee.toInt());
    totalDiscount.value = tracking.fold(
        0, (sum, value) => sum! + value.trackingDiscountAmount!.toInt());
  }

  var isLoading = false.obs;

  // chi tiết phiếu
  getDetailDelivery() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<DeliveryBillDetail>(
        deliveryBillRepo.getDeliveryBillDetail(
            id: id!,
            warehouseId: controllerMain.warehouseId == 0
                ? null
                : controllerMain.warehouseId.toString()), onSuccess: (data) {
      isLoading.value == true;
      deliveryBill.value = data;
      deliveryStatus.value =
          data.deliveryBillStatus?.value.toString() ?? S.current.isNull;
      tracking.clear();
      tracking.value = data.trackings ?? [];

      checkItemTracking.value =
          List.generate(tracking.length, (index) => false);

      for (int i = 0; i < checkItemTracking.length; i++) {
        if (tracking[i].exploitStatus?.value ==
            DeliveryStatus.packing.value.toString()) {
          idTrackingExport.add(tracking[i].id ?? 0);
        }
      }

      if (isFirstTrackingCheck && tracking.isEmpty) {
        isFirstTrackingCheck = false;
        if (deliveryBill.value.deliveryBillStatus?.value ==
            DeliveryStatus.warehouse.value.toString()) {
          Future.delayed(const Duration(milliseconds: 500),
                  () => AppSnackBar.playSound("assets/sounds/notfound_vn.mp3"));
        }
      }
      balance = Const.convertPrice(
          double.parse(data.customer?.balance ?? "0.0").toInt() -
              data.trackingTotalMoney!);
      name.clear();
      phone.clear();
      email.clear();
      address.clear();
      note.clear();
      name.text = data.name.toString();
      phone.text = data.customerPhone.toString();
      email.text = data.email.toString();
      address.text = data.customerAddress.toString();
      note.text = data.note ?? "";
      getExpensive();
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }


  onClearValue() {
    name.clear();
    phone.clear();
    email.clear();
    address.clear();
    note.clear();
    name.text = deliveryBill.value.name.toString();
    phone.text = deliveryBill.value.customerPhone.toString();
    email.text = deliveryBill.value.email.toString();
    address.text = deliveryBill.value.customerAddress.toString();
    note.text = deliveryBill.value.note ?? "";
  }

  bool isValidEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool isNumeric(String input) {
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  //cập nhật thông tin phiếu khách hàng
  void updateDeliveryDetail() async {
    name.text.isEmpty
        ? errorName.value = "Chưa nhập giá trị"
        : errorName.value = null;
    phone.text.isEmpty
        ? errorPhone.value = "Chưa nhập giá trị"
        : errorPhone.value = null;
    email.text.isEmpty
        ? errorEmail.value = "Chưa nhập giá trị"
        : errorEmail.value = null;
    address.text.isEmpty
        ? errorAddress.value = "Chưa nhập giá trị"
        : errorAddress.value = null;
    if (name.text.isEmpty ||
        phone.text.isEmpty ||
        email.text.isEmpty ||
        address.text.isEmpty) {
      AppSnackBar.failureCreate(title: "Nhập thông tin nhận hàng!");
    } else {
      String phoneNumber = phone.text.trim();
      if (!isNumeric(phone.text)) {
        AppSnackBar.showIsEmpty(message: 'Không được chứa ký tự khác số');
      } else if (!isValidEmail(email.text)) {
        errorEmail.value = "Email sai định dạng";
      } else if (phoneNumber.length != 10) {
        AppSnackBar.showIsEmpty(message: 'Số điện thoại phải có độ dài 10 số');
      } else if (!phoneNumber.startsWith('0')) {
        AppSnackBar.showIsEmpty(
            message: 'Số điện thoại phải bắt đầu bằng số 0');
      } else {
        callDataService<DeliveryBillDetail>(
            deliveryBillRepo.updateDeliveryBillDetail(id: id!, updateFields: {
              "customerName": name.text,
              "name": name.text,
              "email": email.text,
              "customerAddress": address.text,
              "customerPhone": phone.text,
              "note": note.text,
            }), onSuccess: (_) {
          AppSnackBar.showUpdateSuccess(message: "Cập nhật thành công");
        });
        Get.back(result: true);
      }
    }
  }

  //  danh sách tracking của khách hàng
  void getListTrackingCustomerDetail() {
    callDataService<ListTrackingCustomerDetail>(
      deliveryBillRepo.getListTrackingCustomerDetail(id: idTracking!),
      onSuccess: (data) {
        listTrackingCustomerDetail.clear();
        listTrackingCustomerDetail.value =
            data.listTrackingCustomerDetail ?? [];
        checkItem.value =
            List.generate(listTrackingCustomerDetail.length, (index) => false);
      },
    );
  }

  // thêm tracking cho phiếu từ list tracking
  void postTrackingList() {
    callDataService<AddTrackingDeliveryBill>(
      deliveryBillRepo.addTrackingDeliveryBill(
          id: id!, payload: {'trackingIds': idTrackingDetail}),
      onSuccess: (data) {},
    );
  }

  // chọn tracking
  void addSelectedItems() {
    List<TrackingCustom> selectedItems = [];
    for (int i = 0; i < checkItem.length; i++) {
      if (checkItem[i]) {
        selectedItems.add(listTrackingCustomerDetail[i]);
        idTrackingDetail.add(listTrackingCustomerDetail[i].id ?? 0);
      }
    }
    if (selectedItems.isNotEmpty) {
      listAddItem.clear();
      listAddItem.addAll(selectedItems);
      for (var item in selectedItems) {
        listTrackingCustomerDetail.remove(item);
      }
      checkItem.removeWhere((item) => item == true);
      listShowItem.addAll(listAddItem);
    }
  }

  // hủy phiếu xuất kho
  void cancelDeliveryBill() {
    if (id == null) {
      return;
    }
    callDataService(deliveryBillRepo.cancelDeliveryBill(id: id!),
        onError: (error) {
      showErrorMessage(error.toString());
    }, onSuccess: (data) async {
      await Future.delayed(const Duration(milliseconds: 1200), () {
        AppSnackBar.showSuccess(message: "Hủy PXK thành công");
      });
    });
  }

  // sale duyệt phiếu xuất kho
  void saleApproveDeliveryBill() {
    if (id == null) {
      return;
    }
    callDataService(deliveryBillRepo.saleApproveDeliveryBill(id: id!),
        onError: (error) {
      showErrorMessage(error.toString());
    }, onSuccess: (data) async {
      await Future.delayed(const Duration(milliseconds: 1200), () {
        AppSnackBar.showSuccess(message: "Chuyển sale duyệt thành công");
      });
    });
  }

  // kế toán duyệt phiếu xuất kho
  void accountantApproveDeliveryBill() {
    if (id == null) {
      return;
    }
    callDataService(deliveryBillRepo.accountantApproveDeliveryBill(id: id!),
        onError: (error) {
      showErrorMessage(error.toString());
    }, onSuccess: (data) async {
      await Future.delayed(const Duration(milliseconds: 1200), () {
        AppSnackBar.showSuccess(message: "Chuyển kế toán duyệt thành công");
      });
    });
  }

  // yêu cầu xuất kho
  void skipApproveDeliveryBill() {
    if (id == null) {
      return;
    }
    callDataService(deliveryBillRepo.skipApproveDeliveryBill(id: id!),
        onError: (error) async {
      await Future.delayed(const Duration(milliseconds: 1600), () {
        AppSnackBar.failure(message: "Không tìm thấy phiếu xuất kho");
      });
    }, onSuccess: (data) async {
      await Future.delayed(const Duration(milliseconds: 1200), () {
        AppSnackBar.showSuccess(
            message:
                "Quản lý duyệt phiếu xuất kho sang yêu cầu xuất kho thành công!");
      });
    });
  }

  //khách hàng xác nhận
  void customApproveDeliveryBill() {
    if (id == null) {
      return;
    }
    callDataService(deliveryBillRepo.customApproveDeliveryBill(id: id!),
        onError: (error) {
      showErrorMessage(error.toString());
    }, onSuccess: (data) async {
      await Future.delayed(const Duration(milliseconds: 1200), () {
        AppSnackBar.showSuccess(message: "Khách hàng xác nhận thành công");
      });
    });
  }

  // set đóng hàng
  void packTrackingDeliveryBill({int? idTracking}) {
    if (id == null) {
      return;
    }
    callDataService(
        deliveryBillRepo.packTrackingDeliveryBill(
            id: id!, payload: {'trackingId': idTracking}),
        onError: (error) async {}, onSuccess: (data) async {
      await Future.delayed(const Duration(milliseconds: 1200), () {
        AppSnackBar.playSound("assets/sounds/found_vn.mp3");
      });
    });
  }

  // chuyển đang giao
  void packDeliveryBill() {
    if (id == null) {
      return;
    }
    callDataService(deliveryBillRepo.packDeliveryBill(id: id!),
        onError: (error) async {}, onSuccess: (data) async {});
  }

  //xác nhận và thanh toán
  void exportDeliveryBill() {
    callDataService(
        deliveryBillRepo.exportDeliveryBill(
            id: id!, payload: {'trackingIds': idTrackingExport}),
        onError: (error) async {}, onSuccess: (data) async {
      await Future.delayed(const Duration(milliseconds: 1200), () {
        AppSnackBar.showSuccess(message: "Xác nhận xuất kho thành công!");
      });
    });
  }

// gán shipper tổng
  void assignShipper() {
    bool isValid = controllerStaff.listShipper.any((item) =>
        item.fullname?.toLowerCase() ==
        controllerStaff.shipper.text.toLowerCase());
    if (controllerStaff.shipper.text.isEmpty) {
      AppSnackBar.showIsEmpty(message: "Hãy chọn shipper");
    } else if (!isValid || controllerStaff.shipper.text.isEmpty) {
      controllerStaff.shipper.clear();
      AppSnackBar.showIsEmpty(message: "Shipper không tồn tại");
    } else {
      for (int i = 0; i < controllerStaff.listShipper.length; i++) {
        var item = controllerStaff.listShipper[i];
        if (item.fullname?.toLowerCase() ==
            controllerStaff.shipper.text.toLowerCase()) {
          idShipper = item.id;
          break;
        }
      }
      callDataService(
          deliveryBillRepo
              .assignShipper(id: id!, payload: {'deliveredById': idShipper}),
          onError: (error) async {}, onSuccess: (data) async {
        AppSnackBar.showSuccess(message: "Gán shipper thành công");
      });
      Get.back(result: true);
    }
  }

  // giao thất bại
  void failedDeliveryBill() {
    if (id == null) {
      return;
    }
    callDataService(deliveryBillRepo.failedDeliveryBill(id: id!),
        onError: (error) {
      showErrorMessage(error.toString());
    }, onSuccess: (data) {
      Future.delayed(const Duration(milliseconds: 1200), () {
        AppSnackBar.showIsEmpty(message: "Đơn hàng giao thất bại");
      });
    });
  }

  // hoàn thành giao
  void finishDeliveryBill() {
    if (id == null) {
      return;
    }
    callDataService(deliveryBillRepo.finishDeliveryBill(id: id!),
        onError: (error) {
      showErrorMessage(error.toString());
    }, onSuccess: (data) {
      Future.delayed(const Duration(milliseconds: 1200), () {
        AppSnackBar.showSuccess(message: "Hoàn thành đơn hàng");
      });
    });
  }

  final boxesByDelivery = RxList<VnDeliveryBox>();

  List<MergedDelivery> mergeDeliveries(
      List<VnDeliveryOrder> orders, List<VnDeliveryBox> boxes) {
    List<MergedDelivery> mergedDeliveries = [];
    for (var order in orders) {
      List<VnDeliveryBox> matchedBoxes =
          boxes.where((box) => box.vnDeliveryOrderId == order.id).toList();
      mergedDeliveries.add(MergedDelivery(order, matchedBoxes));
    }
    return mergedDeliveries;
  }
}
