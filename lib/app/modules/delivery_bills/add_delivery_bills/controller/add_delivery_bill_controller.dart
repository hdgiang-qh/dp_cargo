import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/base/base_controller.dart';
import '../../../../core/snackbars/loaders.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/delivery_bill.dart';
import '../../../../data/model/model/tracking_bill.dart';
import '../../../../data/model/model/vn_delivery_box.dart';
import '../../../../data/model/request/create_delivery_bill_request.dart';
import '../../../../data/repository/authentication_repository.dart';
import '../../../../data/repository/delivery_bill_repository.dart';
import '../../../../data/service/auth_service.dart';
import '../../../../routes/app_pages.dart';
import '../../../../take_photo/take_photo_screen.dart';
import '../../../barcode/model/receive_model.dart';
import '../../../barcode/model/success_model.dart';
import '../../delivery_bills_detail/controller/delivery_bill_detail_controller.dart';
import '../../list_delivery_bills/controller/list_delivery_bills_controller.dart';
import '../model/bill_delivery_expensive.dart';

class AddDeliveryBillController extends BaseController {
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final authRepo = Get.find<AuthenticationRepository>();
  final deliveryBill = DeliveryBill();
  final vnveryBill = VnDeliveryBox();
  final ids = RxList<String>();
  final listTracking = <TrackingsBill>[].obs;
  final listSelectedTracking = <TrackingsBill>[].obs;
  final deliveryBillDetailController = Get.put(DeliveryBillDetailController());
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController note = TextEditingController();

  final deliveryBillExpensive = BillDeliveryExpensive(
          trackingOtherFee: 0, trackingShippingFee: 0, trackingSurcharge: 0)
      .obs;
  int? idS;

  @override
  void onInit() {
    idS = argument['id'];
    reset();
    initDefaultInfo();
    // getAddListTracking();
    super.onInit();
  }

  void initDefaultInfo() async {
    final user = await authRepo.getUserInfo();
    name.text = user.fullname ?? '';
    phone.text = user.phone ?? '';
    email.text = user.email ?? '';
    address.text = user.customer?.address ?? '';
  }

  void select(TrackingsBill? trackingBillId) {
    if (trackingBillId == null) {
      return;
    }
    if (listSelectedTracking.contains(trackingBillId)) {
      listSelectedTracking.remove(trackingBillId);
    } else {
      listSelectedTracking.add(trackingBillId);
    }
  }

  // void getAddListTracking() {
  //   callDataService<List<TrackingsBill>>(
  //       deliveryBillRepo.getDeliveryBillTracking(), onSuccess: (data) {
  //     listTracking.value = data;
  //   }, onError: (error) {});
  // }

  void getExpensive() {
    deliveryBillExpensive.value = BillDeliveryExpensive(
        trackingShippingFee: 0, trackingSurcharge: 0, trackingOtherFee: 0);
    for (final i in listSelectedTracking) {
      deliveryBillExpensive.value.trackingShippingFee +=
          double.tryParse(i.trackingShippingFee ?? '0') ?? 0;
      deliveryBillExpensive.value.trackingOtherFee +=
          double.tryParse(i.trackingOtherFee ?? '0') ?? 0;
      deliveryBillExpensive.value.trackingSurcharge +=
          double.tryParse(i.trackingSurcharge ?? '0') ?? 0;
    }
  }

  void receiveBox() {
    List<String>? data = deliveryBillDetailController.vnDeliveryBoxes
        .where((box) => box.id != null)
        .map((box) => box.id.toString())
        .toList();

    List<String> ids = data.toSet().toList();
    callDataService(
      deliveryBillRepo.receive(receiveModel: ReceiveModel(ids: ids)),
      onSuccess: (data) async {
        Loaders.successSnackBar(title: 'Nhận hàng thành công');
        Get.toNamed(Routes.QR_SCREEN);
      },
    );
  }

  void successBox() {
    List<String>? data = deliveryBillDetailController.vnDeliveryBoxes
        .where((box) => box.id != null)
        .map((box) => box.id.toString())
        .toList();

    List<String> ids = data.toSet().toList();
    callDataService(
      deliveryBillRepo.success(successModel: SuccessModel(ids: ids)),
      onSuccess: (data) async {
        Get.to(TakePhotoScreen(
            deliveryBillDetail:
                deliveryBillDetailController.deliveryBill.value));
      },
    );
  }

  void addDeliveryBill() async {
    final user = Get.find<AuthService>().userInfo.value;
    List<TrackingIds>? trackingIds = listSelectedTracking
        .where((trackingBill) => trackingBill.id != null)
        .map((trackingBill) => TrackingIds(id: trackingBill.id?.toString()))
        .toList();

    callDataService(
        deliveryBillRepo.addDeliveryBill(
            request: CreateDeliveryBillRequest(
          customerName: name.text,
          phone: phone.text,
          address: address.text,
          note: note.text,
          customerId: user?.customer?.id,
          trackingIds: trackingIds,
        )), onSuccess: (data) {
      reset();
      Get.find<ListDeliveryBillController>().onRefreshPage();
      Get.back();
      AppSnackBar.showSuccess(message: 'Tạo phiếu thành công');
    });
  }

  reset() {
    name.clear();
    phone.clear();
    email.clear();
    address.clear();
    note.clear();
    deliveryBillExpensive.value = BillDeliveryExpensive(
      trackingShippingFee: 0,
      trackingSurcharge: 0,
      trackingOtherFee: 0,
    );
    listSelectedTracking.clear();
  }
}
