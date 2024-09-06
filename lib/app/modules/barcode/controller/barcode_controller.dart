import 'package:get/get.dart';
import '../../../core/base/base_controller.dart';
import '../../../core/enum/boxes_status.dart';
import '../../../core/enum/delivery_bill_status.dart';
import '../../../core/widget/dialog/app_snackbar.dart';
import '../../../data/model/model/vn_delivery_box.dart';
import '../../delivery_bills/add_delivery_bills/controller/add_delivery_bill_controller.dart';
import '../../delivery_bills/delivery_bills_detail/controller/delivery_bill_detail_controller.dart';
import '../../missing_receive/missing_box_new_code.dart';
import '../../missing_receive/missing_receive.dart';

class BarCodeController extends BaseController {
  final deliveryBillDetailController = Get.put(DeliveryBillDetailController());
  final addDeliveryBillController = Get.put(AddDeliveryBillController());

  void receiveVnBox() {
    final barCode = deliveryBillDetailController.barcodes.length;
    List<VnDeliveryBox> listBoxNewCode =
        deliveryBillDetailController.listNewCode;
    final check =
        deliveryBillDetailController.deliveryBill.value.deliveryBillStatus ==
                DeliveryStatus.delivering &&
            listBoxNewCode.isNotEmpty;
    final vnBox = check
        ? listBoxNewCode.length
        : deliveryBillDetailController.vnDeliveryBoxes.length;
    if (barCode >= vnBox) {
      addDeliveryBillController.receiveBox();
    } else if (barCode == 0) {
      AppSnackBar.notFoundBox();
    } else {
      Get.to(const MissingBoxNewCode());
    }
  }

  void successVnBox() {
    final barCode = deliveryBillDetailController.barcodes.length;
    final vnBox = deliveryBillDetailController.vnDeliveryBoxes
        .where((element) => element.status == BoxesStatus.delivering)
        .length;
    if (barCode >= vnBox) {
      addDeliveryBillController.successBox();
      AppSnackBar.notFoundBox();
    } else if (barCode == 0) {
      AppSnackBar.notFoundBox();
    } else {
      Get.to(const MissingReceiveScreen());
    }
  }
}
