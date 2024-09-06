import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import 'package:vncss/app/data/model/model/create_bill_custom_model.dart';
import 'package:vncss/app/data/model/model/delivery_bill.dart';
import 'package:vncss/app/data/model/model/delivery_bill_detail.dart';
import 'package:vncss/app/modules/delivery_bills/delivery/create_delivery_bill/controller/create_delivery_bill_controller.dart';

import '../../../../../core/base/paging_controller.dart';
import '../../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../../data/model/response/list_delivery_bill.dart';
import '../../../../../data/repository/delivery_bill_repository.dart';

class ConfirmCreateController extends BaseController {
  int? customId;
  int? id = 0;
  final customers = CreateBCTModel().obs;
  final listTrackingCustomerDetail = <TrackingCustom>[].obs;
  final pagingControllerCB = PagingController<CreateBillModel>();
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();

  Rxn<int> totalM = Rxn<int>();
  Rxn<int> totalSurcharge = Rxn<int>();
  Rxn<int> totalOtherFee = Rxn<int>();
  Rxn<int> totalDiscount = Rxn<int>();
  List<int> idTrackingDetail = [];
  final checkItem = <bool>[].obs;
  final listAddItem = <TrackingCustom>[].obs;
  final listShowItem = <TrackingCustom>[].obs;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController note = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode noteFocus = FocusNode();

  final errorName = Rxn<String>();
  final errorPhone = Rxn<String>();
  final errorEmail = Rxn<String>();
  final errorAddress = Rxn<String>();

  String checkGender(String gender) {
    switch (gender) {
      case "male":
        return "Nam";
      case "female":
        return "Nữ";
      default:
        return "Khác";
    }
  }

  // danh sách tracking của custom
  void getListTrackingCustomerDetail() {
    callDataService<ListTrackingCustomerDetail>(
      deliveryBillRepo.getListTrackingCustomerDetail(id: id!),
      onSuccess: (data) {
        listTrackingCustomerDetail.clear();
        listTrackingCustomerDetail.value =
            data.listTrackingCustomerDetail ?? [];
        checkItem.value =
            List.generate(listTrackingCustomerDetail.length, (index) => false);
      },
    );
  }

  void addSelectedItems() {
    List<TrackingCustom> selectedItems = [];
    idTrackingDetail.clear();
    for (int i = 0; i < checkItem.length; i++) {
      if (checkItem[i]) {
        selectedItems.add(listTrackingCustomerDetail[i]);
        idTrackingDetail.add(listTrackingCustomerDetail[i].id ?? 0);
      }
    }
    if (selectedItems.isNotEmpty) {
      listShowItem.clear();
      listShowItem.addAll(selectedItems);

      double money = listShowItem.fold(
          0, (sum, item) => sum + item.doubleTrackingTotalMoney);
      int discount = listShowItem.fold(
          0, (sum, item) => sum + item.intTrackingDiscountAmount);
      double surcharge = listShowItem.fold(
          0, (sum, item) => sum + item.doubleTrackingSurcharge);
      double otherFee = listShowItem.fold(
          0, (sum, item) => sum + item.doubleTrackingOtherFee);

      totalSurcharge.value = surcharge.toInt();
      totalOtherFee.value = otherFee.toInt();
      totalDiscount.value = discount;
      totalM.value =
          money.toInt() - discount + surcharge.toInt() + otherFee.toInt();
    } else {
      totalSurcharge.value = null;
      totalOtherFee.value = null;
      totalDiscount.value = null;
      totalM.value = null;
      listShowItem.clear();
    }
  }

  // thêm phiếu xuất kho
  void createTrackingList() {
    callDataService<AddTrackingDeliveryBill>(
      deliveryBillRepo.createDeliveryBill(payload: {
        'trackingIds': idTrackingDetail,
        'address': address.text,
        'customerId': id,
        'email': email.text,
        'note': note.text,
        'name': name.text,
        'phone': phone.text
      }),
      onSuccess: (data) {
        AppSnackBar.showSuccess(message: "Tạo phiếu xuất kho thành công");
      },
    );
  }

  bool isValidEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  onConfirmCreate() {
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
      String input = name.text.trim();
      if (input.contains(RegExp(r'\d'))) {
        AppSnackBar.showIsEmpty(message: 'Tên không được chứa ký tự là số');
      } else if (phoneNumber.length != 10) {
        AppSnackBar.showIsEmpty(message: 'Số điện thoại phải có độ dài 10 số');
      } else if (!phoneNumber.startsWith('0')) {
        AppSnackBar.showIsEmpty(
            message: 'Số điện thoại phải bắt đầu bằng số 0');
      } else if (!isValidEmail(email.text)) {
        errorEmail.value = "Email sai định dạng";
      } else {
        if (idTrackingDetail.isEmpty) {
          return AppSnackBar.showIsEmpty(message: "Chưa chọn tracking");
        } else {
          addSelectedItems();
          createTrackingList();
          Get.back();
          Future.delayed(const Duration(milliseconds: 500), () {
            Get.find<CreateDeliveryController>().onRefreshPage();
          });
        }
      }
    }
  }

  var isLoading = false.obs;

  void getDetailCustomers() {
    callDataService<TrackingCustomerDetailResponse>(
        deliveryBillRepo.getBillCustomTracking(id: id!), onSuccess: (data) {
      isLoading.value == true;
      customers.value = data.createBCTModel!;
      name.text = data.createBCTModel?.name ?? "";
      phone.text = data.createBCTModel?.phone ?? "";
      email.text = data.createBCTModel?.email ?? "";
      address.text = data.createBCTModel?.address ?? "";
      note.text = data.createBCTModel?.note ?? "";
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  onRefreshPage() {
    pagingControllerCB.initRefresh();
    listTrackingCustomerDetail.clear();
    getListTrackingCustomerDetail();
  }

  onLoadNextPage() {
    logger.i("On load next");
  }

  onCreateBill() {
    pagingControllerCB.initRefresh();
    Get.back();
  }

  @override
  void onInit() {
    id = argument['id'];
    super.onInit();
    getDetailCustomers();
    getListTrackingCustomerDetail();
  }
}
