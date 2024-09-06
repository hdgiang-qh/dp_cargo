import 'package:get/get.dart';

import '../../../core/base/base_repo_handle.dart';
import '../../model/model/transaction.dart';
import '../../model/response/transaction_response.dart';
import '../../remote/transactions_data_source.dart';
import '../transaction_reposioty.dart';

class TransactionsRepoImpl extends BaseRepoSource
    implements TransactionsRepository {
  final TransactionsDataSource _dataSource = Get.find<TransactionsDataSource>();

  @override
  Future<TransactionResponse> getListTransactions(
      {int? page,
      int? pageSize,
      String? type,
      String? customerId,
      String? fromDate,
      String? toDate,
      String? status,String? warehouseId}) {
    return callApiWithErrorHandleRepo(_dataSource.getListTransactions(
        page, pageSize, type, customerId, fromDate, toDate, status,warehouseId));
  }

  @override
  Future createTransactions(
      {required Map<String, dynamic> payload}) {
    return callApiWithErrorHandleRepo(_dataSource.createTransactions(payload));
  }

  @override
  Future<TransactionNameResponse> getTransactionName(
      {String? keyword,String? warehouseId}) async {
    return callApiWithErrorHandleRepo(_dataSource.getTransactionName(keyword,warehouseId));
  }

  @override
  Future<BankResponse> getBank(
      {String? key,String? warehouseId}) async {
    return callApiWithErrorHandleRepo(_dataSource.getBank(key,warehouseId));
  }

  @override
  Future<TransactionResponseDetailResponse> getTransactionDetail(
      {required int id,String? warehouseId}) async {
    return callApiWithErrorHandleRepo(_dataSource.getTransactionDetail(id,warehouseId));
  }

  @override
  Future changeTransaction(
      {required int id,required Map<String,dynamic> payload}) async {
    return callApiWithErrorHandleRepo(_dataSource.changeTransaction(id,payload));
  }

  Future<ListTransactionCustomerDetailResponse> getTransactionCustomerDetail(
      {required int id}) async {
    return callApiWithErrorHandleRepo(
        _dataSource.getTransactionCustomerDetail(id));
  }
}
