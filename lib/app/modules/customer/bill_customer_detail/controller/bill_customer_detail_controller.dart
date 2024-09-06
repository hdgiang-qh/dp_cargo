import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import '../../../../data/model/model/bill_customer_detail.dart';
import '../../../../data/model/response/list_delivery_bill.dart';
import '../../../../data/repository/delivery_bill_repository.dart';
import '../../customer_detail/controller/detail_customer_controller.dart';

class BillCustomerDetailController extends BaseController {

  final billCustomerDetailRepo = Get.find<DeliveryBillRepository>();
  final billCustomerDetail = <BillCustomerDetail>[].obs;

  int? id;

  @override
  void onInit() {
    id = argument['id'];
    getBillCustomerDetail();
    super.onInit();
  }
  getBillCustomerDetail() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<ListDeliveryBillCustomerResponse>(
        billCustomerDetailRepo.getBillCustomerDetail(id: id!), onSuccess: (data) {
      billCustomerDetail.value = data.listBillCustom!;
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }
}
