import 'package:get/get.dart';
import 'package:vncss/app/core/base/base_controller.dart';
import '../../../../data/model/model/transaction_customer_detail_model.dart';
import '../../../../data/model/response/transaction_response.dart';
import '../../../../data/repository/transaction_reposioty.dart';


class TransactionCustomerDetailController extends BaseController {

  final transactionCustomerDetailRepo = Get.find<TransactionsRepository>();
  final transactionCustomerDetail = <TransactionCustomerDetailModel>[].obs;

  int? id;

  @override
  void onInit() {
    id = argument['id'];
    getTransactionCustomerDetail();
    super.onInit();
  }
  getTransactionCustomerDetail() {
    if (id == null) {
      showMessage("Lỗi id");
    }
    callDataService<ListTransactionCustomerDetailResponse>(
        transactionCustomerDetailRepo.getTransactionCustomerDetail(id: id!), onSuccess: (data) {
      transactionCustomerDetail.value = data.transactionCustomerDetail!;
    }, onError: (error) {
      showErrorMessage(error.toString());
    });
  }
}
