import 'dart:io';

import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../../network/exceptions/api_exception.dart';
import '../../model/model/bank_response.dart';
import '../../model/model/transaction_detail.dart';
import '../../model/response/list_transaction_response.dart';
import '../../remote/transaction_data_source.dart';
import '../transaction_reposioty.dart';

class TransactionRepoImpl extends BaseRepoSource
    implements TransactionRepository {
  final TransactionDataSource api = Get.find();

  TransactionRepoImpl();

  @override
  Future<TransactionListResponse> getListTransaction({
    int page = 1,
    int pageSize = 20,
    int? customer_id,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    return callApiWithErrorHandleRepo<TransactionListResponse>(
        api.getListTransaction(
            pageSize: pageSize,
            page: page,
            customer_id: customer_id,
            status: status,
            fromDate: fromDate,
            toDate: toDate));
  }

  @override
  Future<TransactionDetail> getTransactionDetail(int id) {
    return callApiWithErrorHandleApiData<TransactionDetail>(
        api.getTransactionDetail(id));
  }

  @override
  Future updateTransaction(int id, String status) {
    return callApiWithErrorHandleApiData(api.updateTransaction(id, status));
  }

  @override
  Future<BankData> getBankData() async {
    final listBank = await callApiWithErrorHandleApiData(api.getListBank());
    if (listBank.isNotEmpty) return listBank.first;
    throw ApiException(
        httpCode: 404, status: 'Error', message: "Không có bank nào");
  }

  @override
  Future createTransaction(
      File? file,
      String customerId,
      String customer_transaction_type,
      String customer_transaction_money,
      String customer_transaction_note,
      String? bank_account) async {
    final result = await callApiWithErrorHandleRepo(api.createTransaction(
        customerId,
        customer_transaction_type,
        customer_transaction_money,
        customer_transaction_note,
        bank_account,
        file: file));
    return result;
  }
}


