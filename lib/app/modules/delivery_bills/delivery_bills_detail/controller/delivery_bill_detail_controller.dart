
import 'package:get/get.dart';
import '../../../../core/base/base_controller.dart';
import '../../../../core/widget/dialog/app_snackbar.dart';
import '../../../../data/model/model/delivery_bill_detail.dart';
import '../../../../data/model/model/merged_delivery_bill_information.dart';
import '../../../../data/model/model/vn_delivery_box.dart';
import '../../../../data/model/model/vn_delivery_order.dart';
import '../../../../data/repository/delivery_bill_repository.dart';
import '../../../../take_photo/take_photo_screen.dart';
import '../../../barcode/model/receive_model.dart';
import '../../../barcode/model/success_model.dart';
import '../../add_delivery_bills/model/bill_delivery_expensive.dart';

class DeliveryBillDetailController extends BaseController {
  final deliveryBillRepo = Get.find<DeliveryBillRepository>();
  final deliveryBill = DeliveryBillDetail().obs;
  final vnDeliveryBox = VnDeliveryBox().obs;

  /// chứa các code đã quét
  final barcodes = RxList<String>();

  /// chứa code đã get về
  final putVnDeliveryBoxes = RxList<String>();

  List<VnDeliveryBox> get listNewCode {
    return deliveryBill.value.vnDeliveryBoxes
            ?.where((box) => box.status?.id == 0)
            .toList() ??
        [];
  }

  List<VnDeliveryBox> get vnDeliveryBoxes =>
      deliveryBill.value.vnDeliveryBoxes ?? [];

  List<VnDeliveryOrder> get vnDeliveryOrder =>
      deliveryBill.value.vnDeliveryOrder ?? [];

  final deliveryBillExpensive = BillDeliveryExpensive(
          trackingOtherFee: 0, trackingShippingFee: 0, trackingSurcharge: 0)
      .obs;

  int? id;

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

  void sendSingleBox() {
    List<String> ids = [];
    for (var box in vnDeliveryBoxes) {
      if (barcodes.contains(box.code)) {
        ids.add(box.id.toString());
      }
    }
    callDataService(
      deliveryBillRepo.success(successModel: SuccessModel(ids: ids)),
      onSuccess: (data) async {
        // AppSnackBar.success();
        Get.to(TakePhotoScreen(
          deliveryBillDetail: deliveryBill.value,
        ));
      },
      onError: (data) async {
        AppSnackBar.failure();
      },
    );
  }

  void receiveSingleBox() {
    List<String> ids = [];
    for (var box in vnDeliveryBoxes) {
      if (barcodes.contains(box.code)) {
        ids.add(box.id.toString());
      }
    }
    callDataService(
      deliveryBillRepo.receive(receiveModel: ReceiveModel(ids: ids)),
      onSuccess: (data) async {
   //     AppSnackBar.success();
      },
      onError: (data) async {
        AppSnackBar.failure();
      },
    );
  }

  @override
  void onInit() {
    id = argument['id'];
    getDeliveryBillDetail();
    super.onInit();
  }

  void getExpensive() {
    deliveryBillExpensive.value = BillDeliveryExpensive(
      trackingShippingFee: 0,
      trackingSurcharge: 0,
      trackingOtherFee: 0,
    );
    if (deliveryBill.value.trackings == null) {
      return;
    }
    for (final i in deliveryBill.value.trackings!) {
      deliveryBillExpensive.value.trackingShippingFee +=
          double.tryParse(i.trackingShippingFee ?? '0') ?? 0;
      deliveryBillExpensive.value.trackingOtherFee +=
          double.tryParse(i.trackingOtherFee ?? '0') ?? 0;
      deliveryBillExpensive.value.trackingSurcharge +=
          double.tryParse(i.trackingSurcharge ?? '0') ?? 0;
    }
  }

  getDeliveryBillDetail() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<DeliveryBillDetail>(
        deliveryBillRepo.getDeliveryBillDetail(id: id!), onSuccess: (data) {
      deliveryBill.value = data;
      getExpensive();
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }

  // void cancelDeliveryBill() {
  //   if (id == null) {
  //     return;
  //   }
  //   callDataService(deliveryBillRepo.cancelDeliveryBill(id: id!),
  //       onError: (error) {
  //     showErrorMessage(error.toString());
  //   }, onSuccess: (data) {
  //     Get.back(result: true);
  //     showSuccessMessage('Cập nhật thành công');
  //   });
  // }

  void failedDeliveryBill() {
    if (id == null) {
      return;
    }
    callDataService(deliveryBillRepo.failedDeliveryBill(id: id!),
        onError: (error) {
          showErrorMessage(error.toString());
        }, onSuccess: (data) {
          Get.back(result: true);
          showSuccessMessage('Hủy thành công');
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
